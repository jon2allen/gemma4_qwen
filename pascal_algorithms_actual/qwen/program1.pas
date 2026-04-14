program BubbleSort;

uses SysUtils;

type
  TIntegerArray = array of Integer;

function BubbleSort(var arr: TIntegerArray): Boolean;
var
  i, j, temp: Integer;
  swapped: Boolean;
begin
  Result := True;
  for i := High(arr) downto 1 do
  begin
    swapped := False;
    for j := 0 to High(arr) - i - 1 do
    begin
      if arr[j] > arr[j + 1] then
      begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
        swapped := True;
      end;
    end;
    if not swapped then
      Break; // Optimization: array is sorted
  end;
end;

var
  data: TIntegerArray;
  i: Integer;
begin
  SetLength(data, 5);
  data[0] := 64;
  data[1] := 34;
  data[2] := 25;
  data[3] := 12;
  data[4] := 22;

  Write('Before Sorting: ');
  for i := 0 to High(data) do
    Write(data[i], ' ');
  WriteLn;

  BubbleSort(data);

  Write('After Sorting: ');
  for i := 0 to High(data) do
    Write(data[i], ' ');
  WriteLn;
end.