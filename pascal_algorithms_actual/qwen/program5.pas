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