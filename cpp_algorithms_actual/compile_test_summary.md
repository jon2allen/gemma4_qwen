# Compilation and Runtime Test Summary

## Overview
This document summarizes the compilation and runtime validation results for the Qwen and Gemma4 model code examples.

## Qwen Model Results
- **Total Files Tested:** 10
- **Compilation Success:** 9
- **Compilation Failures:** 1
- **Runtime Success:** 9

### Compilation Failures
- **File:** `quick_sort.cpp`
- **Error:** `no matching function for call to 'partition'`
- **Reason:** Missing `partition` function definition.

### Notes
- All other files compiled and ran successfully, producing expected outputs.
- The `quick_sort.cpp` file failed due to a logical error in the original code.

## Gemma4 Model Results
- **Total Files Tested:** 10
- **Compilation Success:** 10
- **Compilation Failures:** 0
- **Runtime Success:** 10

### Notes
- All files compiled and ran successfully, producing expected outputs.
- The code quality is high, with no logical errors or compilation issues.

## Summary Table
| Model  | Total Files | Compilation Success | Compilation Failures | Runtime Success |
|--------|-------------|---------------------|---------------------|-----------------|
| Qwen   | 10          | 9                   | 1                   | 9               |
| Gemma4 | 10          | 10                  | 0                   | 10              |

## Conclusion
- **Gemma4** performed flawlessly with all files compiling and running successfully.
- **Qwen** had one compilation failure due to a missing function definition in `quick_sort.cpp`.

For detailed results, refer to the `results.md` files in the respective directories:
- [Qwen Results](./qwen/results.md)
- [Gemma4 Results](./gemma4/results.md)