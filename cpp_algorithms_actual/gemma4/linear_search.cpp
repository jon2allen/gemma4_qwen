#include <iostream>
#include <vector>

// Returns the index of the target if found, otherwise -1
int linearSearch(const std::vector<int>& arr, int target) {
    for (int i = 0; i < arr.size(); ++i) {
        if (arr[i] == target) {
            return i; // Found
        }
    }
    return -1; // Not found
}

// Example usage:
void run_linear_search() {
    std::vector<int> unsorted_data = {5, 1, 9, 3, 7};
    int target = 9;
    int index = linearSearch(unsorted_data, target);

    if (index != -1) {
        std::cout << "Linear Search Result: Target " << target << " found at index " << index << "\n";
    } else {
        std::cout << "Linear Search Result: Target " << target << " not found.\n";
    }
}

int main() {
    run_linear_search();
    return 0;
}