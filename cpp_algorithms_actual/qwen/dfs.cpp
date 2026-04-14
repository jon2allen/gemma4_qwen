#include <iostream>
#include <vector>
#include <set>
using namespace std;

void dfs(int u, const vector<vector<int>>& adj, vector<bool>& visited) {
    visited[u] = true;
    for (int v : adj[u]) {
        if (!visited[v]) dfs(v, adj, visited);
    }
}

int main() {
    int n = 4;
    vector<vector<int>> adj = {{1, 2}, {0, 3}, {0, 3}, {1, 2}};
    vector<bool> visited(n, false);
    dfs(0, adj, visited);
    for (int i = 0; i < n; i++) cout << (visited[i] ? "1" : "0") << " ";
    return 0;
}