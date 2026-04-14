#include <iostream>
#include <vector>
#include <stack>
using namespace std;

void topoSort(int n, const vector<vector<int>>& adj) {
    vector<int> inDegree(n, 0);
    for (const auto& row : adj) for (int v : row) inDegree[v]++;
    stack<int> q;
    for (int i = 0; i < n; i++) if (inDegree[i] == 0) q.push(i);
    vector<int> result;
    while (!q.empty()) {
        int u = q.top(); q.pop();
        result.push_back(u);
        for (int v : adj[u]) {
            inDegree[v]--;
            if (inDegree[v] == 0) q.push(v);
        }
    }
    for (int x : result) cout << x << " ";
}

int main() {
    int n = 5;
    vector<vector<int>> adj = {{1, 2}, {3}, {4}, {}, {}};
    topoSort(n, adj);
    return 0;
}