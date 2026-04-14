# Qwen Pascal Code Examples - Test Results

## Summary
- **Total Programs**: 10
- **Compiled Successfully**: 1 (program5 - MergeSort)
- **Compilation Failures**: 9

## Detailed Results

### 1. BubbleSort (program1.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Result"`
- **Notes**: Uses `Result` which is not valid in standard Pascal functions.

### 2. BinarySearch (program2.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Result"` and syntax errors
- **Notes**: Uses `Result` and has syntax issues.

### 3. DFSGraph (program3.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Result"` and type mismatches
- **Notes**: Uses `Result` and has input handling issues.

### 4. FibDP (program4.pas)
- **Status**: Compilation Failed
- **Error**: Type mismatch and `Identifier not found "Result"`
- **Notes**: Uses `Result` and has type issues with `SetLength`.

### 5. MergeSort (program5.pas)
- **Status**: Compilation Successful
- **Runtime**: Timeout (likely infinite loop)
- **Notes**: Compiles but may have runtime issues.

### 6. BFSGraph (program6.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Result"` and input handling issues
- **Notes**: Uses `Result` and has input handling issues.

### 7. TreeTraversal (program7.pas)
- **Status**: Compilation Failed
- **Error**: Syntax errors with pointer handling
- **Notes**: Pointer handling issues in Pascal.

### 8. PrimeCheck (program8.pas)
- **Status**: Compilation Failed
- **Error**: Type mismatch and `Identifier not found "Result"`
- **Notes**: Uses `Result` and has type issues with `Sqrt`.

### 9. Knapsack (program9.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Max"` and `Identifier not found "Result"`
- **Notes**: Uses `Result` and `Max` function not defined.

### 10. QuickSort (program10.pas)
- **Status**: Compilation Failed
- **Error**: Invalid assignment in procedure
- **Notes**: Procedure assignment issues.

## Conclusion
Most examples fail due to using `Result` (a Delphi extension) and other syntax issues. Only MergeSort compiled successfully but had runtime issues.