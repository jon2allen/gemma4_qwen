#include <iostream>
#include <vector>
#include <queue>
#include <map>
#include <limits>

// Pair: {distance, node}
using P = std::pair<int, int>; 
// Graph: Adjacency list where pair is {neighbor, weight}
using Graph = std::map<int, std::vector<P>>;

void dijkstra(const Graph& graph, int startNode) {
    // Distance map: stores the shortest distance from startNode to every other node
    std::map<int, int> distances;
    // Priority Queue: stores {distance, node}, ordered by smallest distance
    std::priority_queue<P, std::vector<P>, std::greater<P>> pq;

    // Initialize distances to infinity
    for (const auto& pair : graph) {
        distances[pair.first] = std::numeric_limits<int>::max();
    }
    distances[startNode] = 0;
    pq.push({0, startNode});

    std::cout << "Dijkstra's Shortest Paths from Node " << startNode << ":\n";

    while (!pq.empty()) {
        int dist = pq.top().first;
        int u = pq.top().second;
        pq.pop();

        // Optimization: Skip if we found a shorter path already
        if (dist > distances[u]) continue;

        // Relax neighbors
        if (graph.count(u)) {
            for (const auto& edge : graph.at(u)) {
                int v = edge.first;
                int weight = edge.second;

                if (distances[u] + weight < distances[v]) {
                    distances[v] = distances[u] + weight;
                    pq.push({distances[v], v});
                }
            }
        }
    }

    // Print results
    for (const auto& pair : distances) {
        std::cout << "  To Node " << pair.first << ": Distance = " << (pair.second == std::numeric_limits<int>::max() ? "Unreachable" : std::to_string(pair.second)) << "\n";
    }
}

// Example usage:
void run_dijkstra() {
    Graph g = {
        {1, {{2, 7}, {3, 9}, {6, 14}}},
        {2, {{1, 7}, {3, 10}, {4, 15}}},
        {3, {{1, 9}, {2, 10}, {4, 1}}},
        {4, {{2, 15}, {3, 1}, {5, 6}}},
        {5, {{4, 6}, {6, 9}}},
        {6, {{1, 14}, {5, 9}}}
    };
    dijkstra(g, 1);
}

int main() {
    run_dijkstra();
    return 0;
}