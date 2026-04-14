program QuickSort;

uses SysUtils;

type
  TIntegerArray = array of Integer;

procedure Partition(var arr: TIntegerArray; low, high: Integer);
var
  pivot, i, j: Integer;
  temp: Integer;
begin
  pivot := arr[high];
  i := low - 1;
  for j := low to high - 1 do
    if arr[j] < pivot then
    begin
      Inc(i);
      temp := arr[i];
      arr[i] := arr[j];
      arr[j] := temp;
    end;
  temp := arr[i + 1];
  arr[i + 1] := arr[high];
  arr[high] := temp;
end;

procedure QuickSort(var arr: TIntegerArray; low, high: Integer);
var
  pivotIndex: Integer;
begin
  if low < high then
  begin
    pivotIndex := Partition(arr, low, high);
    QuickSort(arr, low, pivotIndex - 1);
    QuickSort(arr, pivotIndex + 1, high);
  end;
end;

var
  data: TIntegerArray;
  i: Integer;
begin
  SetLength(data, 5);
  data[0] := 45; data[1] := 23; data[2] := 89;
  data[3] := 12; data[4] := 67;

  Write('Before: ');
  for i := 0 to High(data) do Write(data[i], ' ');
  WriteLn;

  QuickSort(data, 0, High(data));

  Write('After: ');
  for i := 0 to High(data) do Write(data[i], ' ');
  WriteLn;
end.