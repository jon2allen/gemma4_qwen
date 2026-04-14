program Knapsack;

uses SysUtils;

type
  TItem = record
    Weight: Integer;
    Value: Integer;
  end;

var
  n, W: Integer; // Items and Capacity
  items: array[0..10] of TItem;
  dp: array[0..10, 0..100] of Integer;

function SolveKnapsack(n: Integer; capacity: Integer): Integer;
var
  i, w: Integer;
begin
  for i := 0 to n do
    for w := 0 to capacity do
      dp[i, w] := 0;

  for i := 1 to n do
    for w := 0 to capacity do
    begin
      if items[i].Weight <= w then
        dp[i, w] := Max(dp[i - 1, w], dp[i - 1, w - items[i].Weight] + items[i].Value)
      else
        dp[i, w] := dp[i - 1, w];
    end;

  Result := dp[n, capacity];
end;

var
  i: Integer;
begin
  Write('Enter number of items: ');
  ReadLn(n);
  Write('Enter weights and values (Weight Value): ');
  for i := 1 to n do
  begin
    ReadLn(items[i].Weight, items[i].Value);
  end;

  Write('Enter capacity: ');
  ReadLn(W);

  SolveKnapsack(n, W);
end.