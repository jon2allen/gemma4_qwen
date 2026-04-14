program LinearSearchExample;

type
  TArray = array[1..5] of Integer;

// Function to perform linear search
function LinearSearch(const A: TArray; N: Integer; Target: Integer): Boolean;
var
  i: Integer;
begin
  for i := 1 to N do begin
    if A[i] = Target then
    begin
      LinearSearch := True; // Found
      Exit;
    end;
  end;
  LinearSearch := False; // Not found
end;

var
  Data: TArray;
  TargetValue: Integer;
begin
  // Unsorted data
  Data[1] := 45; Data[2] := 10; Data[3] := 88; Data[4] := 2; Data[5] := 77;

  TargetValue := 88; // Search for 88

  if LinearSearch(Data, 5, TargetValue) then
    WriteLn('Element ', TargetValue, ' found.')
  else
    WriteLn('Element ', TargetValue, ' not found.');
end.