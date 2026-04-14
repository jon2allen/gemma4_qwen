program QuickSortExample;

type
  TArray = array[1..10] of Integer;

// Partition function (Hoare's scheme)
function Partition(var A: TArray; Low, High: Integer): Integer;
var
  Pivot: Integer;
  i, j: Integer;
  temp: Integer;
begin
  Pivot := A[High]; // Choose last element as pivot
  i := Low - 1;

  for j := Low to High - 1 do begin
    if A[j] <= Pivot then
    begin
      Inc(i);
      // Swap A[i] and A[j]
      temp := A[i];
      A[i] := A[j];
      A[j] := temp;
    end;
  end;

  // Place the pivot in its correct position
  Inc(i);
  // Swap A[i] and A[High] (Pivot)
  temp := A[i];
  A[i] := A[High];
  A[High] := temp;

  Result := i; // Return the partition index
end;

// Recursive QuickSort function
procedure QuickSort(var A: TArray; Low, High: Integer);
var
  Pi: Integer;
begin
  if Low < High then begin
    Pi := Partition(A, Low, High);
    QuickSort(A, Low, Pi - 1); // Sort left side
    QuickSort(A, Pi + 1, High); // Sort right side
  end;
end;

var
  Data: TArray;
  i: Integer;
begin
  // Initialize data (worst case scenario for simple pivot choice)
  for i := 1 to 10 do Data[i] := i;

  QuickSort(Data, 1, 10);

  WriteLn('Sorted Array: ');
  for i := 1 to 10 do Write(Data[i], ' ');
  WriteLn;
end.