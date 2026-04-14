#include <iostream>
#include <vector>
#include <unordered_map>

// Returns a vector containing the indices of the two numbers
std::vector<int> twoSum(const std::vector<int>& nums, int target) {
    // Map stores: {value: index}
    std::unordered_map<int, int> num_map;

    for (int i = 0; i < nums.size(); ++i) {
        int complement = target - nums[i];

        // Check if the complement needed is already in the map
        if (num_map.count(complement)) {
            // Found the pair
            return {num_map[complement], i};
        }

        // Store the current number and its index
        num_map[nums[i]] = i;
    }
    // If no solution is found
    return {}; 
}

// Example usage:
void run_two_sum() {
    std::vector<int> nums = {2, 7, 11, 15};
    int target = 9;
    std::vector<int> result = twoSum(nums, target);

    if (!result.empty()) {
        std::cout << "Two Sum Result: Indices " << result[0] << " and " << result[1] 
                  << " sum up to " << target << "\n";
    } else {
        std::cout << "Two Sum Result: No solution found.\n";
    }
}

int main() {
    run_two_sum();
    return 0;
}