#include <iostream>
#include <vector>
#include <map>

// Using a map for memoization (caching results)
std::map<int, long long> memo;

long long fibonacci(int n) {
    if (n <= 1) return n;
    
    // Check if the result is already computed
    if (memo.count(n)) {
        return memo[n];
    }

    // Compute and store the result
    long long result = fibonacci(n - 1) + fibonacci(n - 2);
    memo[n] = result;
    return result;
}

// Example usage:
void run_fibonacci_dp() {
    int n = 40; // Calculate the 40th Fibonacci number
    long long result = fibonacci(n);
    std::cout << "Fibonacci DP Result (F_" << n << "): " << result << "\n";
}

int main() {
    run_fibonacci_dp();
    return 0;
}