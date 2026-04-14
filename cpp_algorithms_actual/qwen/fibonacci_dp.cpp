#include <iostream>
#include <vector>
using namespace std;

int fib(int n, vector<int>& memo) {
    if (n <= 1) return n;
    if (memo[n] != -1) return memo[n];
    memo[n] = fib(n - 1, memo) + fib(n - 2, memo);
    return memo[n];
}

int main() {
    int n = 10;
    vector<int> memo(n + 1, -1);
    cout << fib(n, memo) << endl;
    return 0;
}