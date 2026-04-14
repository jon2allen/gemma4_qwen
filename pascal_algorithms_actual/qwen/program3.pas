program DFSGraph;

uses SysUtils;

type
  TAdjList = array of array of Integer;
  TNode = record
    Visited: Boolean;
    Neighbors: TAdjList;
  end;

var
  adj: TAdjList;
  visited: array of Boolean;
  n, m: Integer; // Nodes and Edges
  startNode: Integer;
  i: Integer;

function DFS(u: Integer): Boolean;
var
  v: Integer;
begin
  Result := True;
  if u >= Length(visited) then Exit(False);
  visited[u] := True;
  for v := 0 to High(adj[u]) do
    if adj[u][v] < Length(visited) and not visited[adj[u][v]] then
      DFS(adj[u][v]);
end;

begin
  Write('Enter number of nodes: ');
  ReadLn(n);
  SetLength(adj, n);
  SetLength(visited, n);
  
  for i := 0 to n - 1 do
    adj[i] := []; // Initialize empty lists

  Write('Enter edges (u v): ');
  while True do
  begin
    ReadLn;
    if ReadLn = '' then Break;
    m := StrToInt(ReadLn);
    if m > 0 then
      for i := 1 to m do
        ReadLn; // Simplified input handling for demo
    // Note: For a real implementation, use a loop to read edges properly.
    // This is a simplified structure for the example.
  end;

  Write('Enter start node: ');
  ReadLn(startNode);
  
  DFS(startNode);
  Write('Visited nodes: ');
  for i := 0 to High(visited) do
    if visited[i] then Write(i, ' ');
  WriteLn;
end.