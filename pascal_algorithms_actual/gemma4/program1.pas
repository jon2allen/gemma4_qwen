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