#include <iostream>
#include <vector>
#include <map>

// Graph representation
using Graph = std::map<int, std::vector<int>>;

// Recursive DFS function
void dfs(const Graph& graph, int node, std::map<int, bool>& visited) {
    visited[node] = true;
    std::cout << node << " ";

    // Visit all neighbors
    if (graph.count(node)) {
        for (int neighbor : graph.at(node)) {
            if (!visited[neighbor]) {
                dfs(graph, neighbor, visited); // Recursive call
            }
        }
    }
}

// Example usage:
void run_dfs() {
    Graph g = {
        {1, {2, 3}},
        {2, {4}},
        {3, {4, 5}},
        {4, {6}},
        {5, {6}},
        {6, {}}
    };
    std::map<int, bool> visited;
    
    // Initialize all nodes as unvisited
    for (const auto& pair : g) {
        visited[pair.first] = false;
    }

    std::cout << "DFS Traversal starting from 1: ";
    dfs(g, 1, visited); // Traversal order: 1 2 4 6 3 5
    std::cout << "\n";
}

int main() {
    run_dfs();
    return 0;
}