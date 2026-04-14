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