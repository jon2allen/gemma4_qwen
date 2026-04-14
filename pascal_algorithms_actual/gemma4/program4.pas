program DFSExample;

// Simple representation: Adjacency List
const
  MAX_NODES = 5;
type
  AdjList = array[1..MAX_NODES] of array[1..MAX_NODES] of Boolean;

var
  Graph: AdjList;
  Visited: array[1..MAX_NODES] of Boolean;
  i, j: Integer;

// Recursive DFS function
procedure DFS(Node: Integer);
var
  i: Integer;
begin
  Write(Node, ' ');
  Visited[Node] := True;

  // Explore neighbors
  for i := 1 to MAX_NODES do begin
    if Graph[Node][i] and not Visited[i] then
      DFS(i); // Recurse deeper
  end;
end;

begin
  // Define the same graph as BFS (1-2, 1-3, 2-4, 3-5)
  for i := 1 to MAX_NODES do
    for j := 1 to MAX_NODES do
      Graph[i][j] := False;

  Graph[1][2] := True; Graph[2][1] := True;
  Graph[1][3] := True; Graph[3][1] := True;
  Graph[2][4] := True; Graph[4][2] := True;
  Graph[3][5] := True; Graph[5][3] := True;

  WriteLn('DFS Traversal Order: ');
  Visited := array[1..MAX_NODES] of Boolean; // Reset visited status
  DFS(1); // Start from Node 1
end.