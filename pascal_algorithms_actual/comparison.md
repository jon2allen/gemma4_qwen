# Comparison of MergeSort and BinarySearch Implementations

## MergeSort

### Qwen Implementation (program5.pas)
```pascal
program MergeSort;

uses SysUtils;

type
  TIntegerArray = array of Integer;

procedure Merge(var arr: TIntegerArray; left, mid, right: Integer);
var
  i, j, k: Integer;
  temp: array[0..100] of Integer;
begin
  i := left;
  j := mid + 1;
  k := left;

  while (i <= mid) and (j <= right) do
    if arr[i] < arr[j] then
      temp[k] := arr[i]
    else
      temp[k] := arr[j];
    k := k + 1;

  while i <= mid do
    temp[k] := arr[i];
    k := k + 1;
    i := i + 1;
  while j <= right do
    temp[k] := arr[j];
    k := k + 1;
    j := j + 1;

  for i := left to right do
    arr[i] := temp[i - left];
end;

procedure MergeSort(var arr: TIntegerArray; low, high: Integer);
var
  mid: Integer;
begin
  if low < high then
  begin
    mid := (low + high) div 2;
    MergeSort(arr, low, mid);
    MergeSort(arr, mid + 1, high);
    Merge(arr, low, mid, high);
  end;
end;

var
  data: TIntegerArray;
  i: Integer;
begin
  SetLength(data, 6);
  data[0] := 34; data[1] := 7; data[2] := 23;
  data[3] := 32; data[4] := 10; data[5] := 98;

  Write('Before: ');
  for i := 0 to High(data) do Write(data[i], ' ');
  WriteLn;

  MergeSort(data, 0, High(data));

  Write('After: ');
  for i := 0 to High(data) do Write(data[i], ' ');
  WriteLn;
end.
```

**Compilation Status**: Compiles in Delphi mode but times out at runtime (likely infinite loop).

### Gemma4 Implementation (program1.pas)
```pascal
program MergeSortExample;

type
  TArray = array[1..10] of Integer;

// Function to merge two sorted sub-arrays
procedure Merge(const A: TArray; L, M, R: Integer; Temp: TArray);
var
  i, j, k: Integer;
begin
  i := L; j := M + 1; k := L;
  while i <= M and j <= R do begin
    if A[i] <= A[j] then
      Temp[k] := A[i]
    else
      Temp[k] := A[j];
    Inc(k); Inc(i) or Inc(j);
  end;

  // Copy remaining elements of the left half
  while i <= M do begin
    Temp[k] := A[i];
    Inc(k); Inc(i);
  end;

  // Copy remaining elements of the right half
  while j <= R do begin
    Temp[k] := A[j];
    Inc(k); Inc(j);
  end;

  // Copy back to the original array
  for k := L to R do
    A[k] := Temp[k];
end;

// Main recursive sorting function
procedure MergeSort(var A: TArray; L, R: Integer; Temp: TArray);
var
  M: Integer;
begin
  if L < R then begin
    M := (L + R) div 2;
    MergeSort(A, L, M, Temp);
    MergeSort(A, M + 1, R, Temp);
    Merge(A, L, M, R, Temp);
  end;
end;

var
  Data: TArray;
  TempArray: TArray;
begin
  // Initialize data
  Data[1] := 38; Data[2] := 27; Data[3] := 43; Data[4] := 15; Data[5] := 60;
  Data[6] := 8;  Data[7] := 22; Data[8] := 1;  Data[9] := 55; Data[10] := 3;

  // Perform sort
  MergeSort(Data, 1, 10, TempArray);

  // Output results
  WriteLn('Sorted Array: ');
  for var i := 1 to 10 do Write(Data[i], ' ');
  WriteLn;
end.
```

**Compilation Status**: Fails to compile due to syntax errors (`Inc(i) or Inc(j)` and `var i` in loop).

## BinarySearch

### Qwen Implementation (program2.pas)
```pascal
program BinarySearch;

uses SysUtils;

function BinarySearch(const arr: array of Integer; Target: Integer): Integer;
var
  low, high, mid: Integer;
begin
  Result := -1; // Not found indicator
  low := 0;
  high := Length(arr) - 1;

  while (low <= high) do
  begin
    mid := (low + high) div 2;
    if arr[mid] = Target then
      Exit(mid);
    else if arr[mid] < Target then
      low := mid + 1
    else
      high := mid - 1;
  end;
end;

var
  data: array[0..9] of Integer;
  target: Integer;
  i: Integer;
begin
  SetLength(data, 10);
  for i := 0 to 9 do
    data[i] := i * 2 + 1; // 1, 3, 5...

  Write('Searching for number: ');
  ReadLn(target);

  if BinarySearch(data, target) >= 0 then
    WriteLn('Found at index: ', BinarySearch(data, target))
  else
    WriteLn('Not found in array.');
end.
```

**Compilation Status**: Fails to compile due to syntax error (missing semicolon before `else`).

### Gemma4 Implementation (program2.pas)
```pascal
program BinarySearchExample;

type
  TArray = array[1..10] of Integer;

// Function to perform binary search
function BinarySearch(const A: TArray; Low, High: Integer; Target: Integer): Boolean;
var
  Mid: Integer;
begin
  repeat
    Mid := (Low + High) div 2;
    if A[Mid] = Target then
    begin
      BinarySearch := True; // Found
      Exit;
    end
    else if A[Mid] < Target then
    begin
      Low := Mid + 1; // Search upper half
    end
    else begin
      High := Mid - 1; // Search lower half
    end;
  until Low > High;

  BinarySearch := False; // Not found
end;

var
  SortedData: TArray;
  TargetValue: Integer;
begin
  // Must be sorted!
  SortedData[1] := 5; SortedData[2] := 10; SortedData[3] := 15; SortedData[4] := 20;
  SortedData[5] := 25; SortedData[6] := 30; SortedData[7] := 35; SortedData[8] := 40;
  SortedData[9] := 45; SortedData[10] := 50;

  TargetValue := 30; // Search for 30

  if BinarySearch(SortedData, 1, 10, TargetValue) then
    WriteLn('Element ', TargetValue, ' found.')
  else
    WriteLn('Element ', TargetValue, ' not found.');
end.
```

**Compilation Status**: Compiles and runs successfully.
**Output**: `Element 30 found.`

## Summary
- **MergeSort**: Qwen's implementation compiles but has runtime issues. Gemma4's implementation fails to compile due to syntax errors.
- **BinarySearch**: Qwen's implementation fails to compile. Gemma4's implementation compiles and runs successfully.
