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