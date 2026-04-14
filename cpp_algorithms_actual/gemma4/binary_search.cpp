#include <iostream>
#include <vector>

// Assumes the input vector 'arr' is sorted.
int binarySearch(const std::vector<int>& arr, int target) {
    int left = 0;
    int right = arr.size() - 1;

    while (left <= right) {
        int mid = left + (right - left) / 2; // Prevents overflow

        if (arr[mid] == target) {
            return mid; // Target found
        } else if (arr[mid] < target) {
            left = mid + 1; // Target is in the right half
        } else {
            right = mid - 1; // Target is in the left half
        }
    }
    return -1; // Target not found
}

// Example usage:
void run_binary_search() {
    std::vector<int> sorted_data = {2, 5, 8, 12, 16, 23, 38};
    int target = 23;
    int index = binarySearch(sorted_data, target);

    if (index != -1) {
        std::cout << "Binary Search Result: Target " << target << " found at index " << index << "\n";
    } else {
        std::cout << "Binary Search Result: Target " << target << " not found.\n";
    }
}

int main() {
    run_binary_search();
    return 0;
}