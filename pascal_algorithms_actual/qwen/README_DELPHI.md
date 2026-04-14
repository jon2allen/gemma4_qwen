# Qwen Pascal Code Examples - Delphi Mode Test Results

## Summary
- **Total Programs**: 10
- **Compiled Successfully**: 2 (program1, program5)
- **Compilation Failures**: 8

## Detailed Results

### 1. BubbleSort (program1.pas)
- **Status**: Compilation Successful
- **Runtime**: Success
- **Output**: `Before Sorting: 64 34 25 12 22 After Sorting: 64 34 25 12 22`
- **Notes**: Compiles and runs in Delphi mode, but sorting logic may be incorrect.

### 2. BinarySearch (program2.pas)
- **Status**: Compilation Failed
- **Error**: Syntax error with `ELSE`
- **Notes**: Missing semicolon before `else`.

### 3. DFSGraph (program3.pas)
- **Status**: Compilation Failed
- **Error**: Type mismatches and input handling issues
- **Notes**: Uses `ReadLn` incorrectly.

### 4. FibDP (program4.pas)
- **Status**: Compilation Failed
- **Error**: Type mismatch with `SetLength`
- **Notes**: Type issues with dynamic arrays.

### 5. MergeSort (program5.pas)
- **Status**: Compilation Successful
- **Runtime**: Timeout (likely infinite loop)
- **Notes**: Compiles but may have runtime issues.

### 6. BFSGraph (program6.pas)
- **Status**: Compilation Failed
- **Error**: Input handling issues
- **Notes**: Uses `ReadLn` incorrectly.

### 7. TreeTraversal (program7.pas)
- **Status**: Compilation Failed
- **Error**: Syntax error with pointer handling
- **Notes**: Pointer handling issues in Pascal.

### 8. PrimeCheck (program8.pas)
- **Status**: Compilation Failed
- **Error**: Type mismatch with `Sqrt`
- **Notes**: Type issues with `Sqrt` function.

### 9. Knapsack (program9.pas)
- **Status**: Compilation Failed
- **Error**: `Identifier not found "Max"`
- **Notes**: Uses `Max` function not defined.

### 10. QuickSort (program10.pas)
- **Status**: Compilation Failed
- **Error**: Invalid assignment in procedure
- **Notes**: Procedure assignment issues.

## Conclusion
Using Delphi mode (`-Mdelphi`) improved compatibility, allowing 2 programs to compile (BubbleSort and MergeSort). The rest still failed due to syntax errors, type mismatches, or incorrect use of Pascal constructs.