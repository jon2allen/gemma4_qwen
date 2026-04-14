program FibonacciDPExample;

const
  MAX_N = 50; // Maximum number for the sequence
type
  TMemo = array[0..MAX_N] of LongInt;

// Function using memoization (Top-Down DP)
function Fib(n: Integer; Memo: TMemo): LongInt;
begin
  if n <= 1 then
  begin
    Fib := n;
    Exit;
  end;

  // Check if the result is already computed
  if Memo[n] <> -1 then
  begin
    Fib := Memo[n];
    Exit;
  end;

  // Compute and store the result
  Memo[n] := Fib(n - 1, Memo) + Fib(n - 2, Memo);
  Fib := Memo[n];
end;

var
  MemoTable: TMemo;
  N: Integer;
  i: Integer;
begin
  N := 40; // Calculate up to the 40th Fibonacci number

  // Initialize memoization table with -1 (indicating uncomputed)
  for i := 0 to MAX_N do MemoTable[i] := -1;

  WriteLn('Fibonacci Sequence up to ', N, ':');
  for i := 0 to N do begin
    Write(Fib(i, MemoTable), ' ');
  end;
  WriteLn;
end.