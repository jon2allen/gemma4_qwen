#include <iostream>
#include <vector>
#include <algorithm>

// Finds the maximum sum of a subarray of size K
int maxSubarraySum(const std::vector<int>& arr, int K) {
    if (arr.size() < K) return 0;

    int current_sum = 0;
    int max_sum = 0;

    // 1. Initialize the first window (size K)
    for (int i = 0; i < K; ++i) {
        current_sum += arr[i];
    }
    max_sum = current_sum;

    // 2. Slide the window one element at a time
    for (int i = K; i < arr.size(); ++i) {
        // Add the new element (i) and subtract the element leaving the window (i - K)
        current_sum = current_sum + arr[i] - arr[i - K];
        max_sum = std::max(max_sum, current_sum);
    }
    return max_sum;
}

// Example usage:
void run_sliding_window() {
    std::vector<int> data = {1, 4, 2, 10, 2, 3};
    int K = 3;
    int result = maxSubarraySum(data, K);
    std::cout << "Sliding Window Result (Max sum of size " << K << "): " << result << "\n"; // Should be 14 (4+2+10)
}

int main() {
    run_sliding_window();
    return 0;
}