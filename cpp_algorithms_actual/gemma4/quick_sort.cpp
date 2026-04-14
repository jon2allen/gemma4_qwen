#include <iostream>
#include <vector>
#include <algorithm>

// Partition function: places the pivot element at its correct position
int partition(std::vector<int>& arr, int low, int high) {
    int pivot = arr[high]; // Choosing the last element as pivot
    int i = (low - 1);     // Index of smaller element

    for (int j = low; j <= high - 1; j++) {
        // If current element is smaller than or equal to pivot
        if (arr[j] <= pivot) {
            i++; // Increment index of smaller element
            std::swap(arr[i], arr[j]);
        }
    }
    std::swap(arr[i + 1], arr[high]);
    return (i + 1);
}

// Main Quick Sort function
void quickSort(std::vector<int>& arr, int low, int high) {
    if (low < high) {
        // pi is partitioning index, arr[pi] is now at right place
        int pi = partition(arr, low, high);

        // Recursively sort elements before and after partition
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

// Example usage:
void run_quick_sort() {
    std::vector<int> data = {10, 7, 8, 9, 1, 5};
    quickSort(data, 0, data.size() - 1);
    std::cout << "Quick Sort Result: ";
    for (int x : data) std::cout << x << " ";
    std::cout << "\n";
}

int main() {
    run_quick_sort();
    return 0;
}