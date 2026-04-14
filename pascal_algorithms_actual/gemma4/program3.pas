program BFSExample;

// Simple representation: Adjacency List (using arrays for simplicity)
const
  MAX_NODES = 5;
type
  AdjList = array[1..MAX_NODES] of array[1..MAX_NODES] of Boolean;

var
  Graph: AdjList;
  Queue: array[1..MAX_NODES] of Integer;
  Visited: array[1..MAX_NODES] of Boolean;
  Front, Rear: Integer;
  Node: Integer;
  i, j: Integer;

procedure Enqueue(N: Integer);
begin
  Inc(Rear);
  Queue[Rear] := N;
end;

function Dequeue: Integer;
begin
  Result := Queue[Front];
  Inc(Front);
end;

procedure BFS(StartNode: Integer);
var
  i: Integer;
begin
  // Initialize queue and visited array
  Front := 1; Rear := 0;
  for i := 1 to MAX_NODES do Visited[i] := False;

  // Start traversal
  Enqueue(StartNode);
  Visited[StartNode] := True;

  WriteLn('BFS Traversal Order: ');
  while Front <= Rear do begin
    Node := Dequeue;
    Write(Node, ' ');

    // Check all neighbors of the current node
    for i := 1 to MAX_NODES do begin
      if Graph[Node][i] and not Visited[i] then begin
        Visited[i] := True;
        Enqueue(i);
      end;
    end;
  end;
end;

begin
  // Define a simple graph (1-2, 1-3, 2-4, 3-5)
  for i := 1 to MAX_NODES do
    for j := 1 to MAX_NODES do
      Graph[i][j] := False;

  Graph[1][2] := True; Graph[2][1] := True;
  Graph[1][3] := True; Graph[3][1] := True;
  Graph[2][4] := True; Graph[4][2] := True;
  Graph[3][5] := True; Graph[5][3] := True;

  BFS(1); // Start from Node 1
end.