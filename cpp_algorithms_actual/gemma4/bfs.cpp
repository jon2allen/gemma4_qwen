#include <iostream>
#include <vector>
#include <queue>
#include <map>

// Graph represented using an adjacency list
using Graph = std::map<int, std::vector<int>>;

void bfs(const Graph& graph, int startNode) {
    std::queue<int> q;
    std::map<int, bool> visited;

    q.push(startNode);
    visited[startNode] = true;

    std::cout << "BFS Traversal starting from " << startNode << ": ";

    while (!q.empty()) {
        int node = q.front();
        q.pop();
        std::cout << node << " ";

        // Visit all neighbors
        if (graph.count(node)) {
            for (int neighbor : graph.at(node)) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    q.push(neighbor);
                }
            }
        }
    }
    std::cout << "\n";
}

// Example usage:
void run_bfs() {
    Graph g = {
        {1, {2, 3}},
        {2, {4}},
        {3, {4, 5}},
        {4, {6}},
        {5, {6}},
        {6, {}}
    };
    bfs(g, 1); // Traversal order: 1 2 3 4 5 6
}

int main() {
    run_bfs();
    return 0;
}