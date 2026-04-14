program BFSGraph;

uses SysUtils;

type
  TAdjList = array of Integer;
  TNode = record
    Visited: Boolean;
    Neighbors: TAdjList;
  end;

var
  adj: array[0..9] of TAdjList;
  visited: array[0..9] of Boolean;
  queue: array[0..10] of Integer;
  head, tail: Integer;
  n: Integer;
  startNode: Integer;
  i, j: Integer;

procedure InitGraph(n: Integer);
var i: Integer;
begin
  for i := 0 to n - 1 do
  begin
    adj[i] := [];
    visited[i] := False;
  end;
end;

procedure AddEdge(u, v: Integer);
var i: Integer;
begin
  SetLength(adj[u], Length(adj[u]) + 1);
  adj[u][High(adj[u])] := v;
end;

function BFS(startNode: Integer): Boolean;
var
  i: Integer;
begin
  head := 0; tail := 0;
  queue[tail] := startNode;
  visited[startNode] := True;
  Result := False;

  while (head < tail) do
  begin
    i := queue[head];
    Inc(head);
    for j := 0 to High(adj[i]) do
    begin
      if not visited[adj[i][j]] then
      begin
        visited[adj[i][j]] := True;
        queue[tail] := adj[i][j];
        Inc(tail);
      end;
    end;
  end;
end;

begin
  Write('Enter number of nodes: ');
  ReadLn(n);
  InitGraph(n);
  Write('Enter edges (u v): ');
  while True do
  begin
    if ReadLn = '' then Break;
    AddEdge(StrToInt(ReadLn), StrToInt(ReadLn));
  end;

  Write('Start BFS from: ');
  ReadLn(startNode);
  BFS(startNode);
  Write('Visited Nodes: ');
  for i := 0 to n - 1 do
    if visited[i] then Write(i, ' ');
  WriteLn;
end.