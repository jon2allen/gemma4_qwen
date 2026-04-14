program DijkstraExample;

const
  MAX_NODES = 5;
  INF = 99999; // Represents infinity

type
  EdgeWeight = array[1..MAX_NODES] of Integer;
  GraphMatrix = array[1..MAX_NODES, 1..MAX_NODES] of Integer;

var
  Adj: GraphMatrix;
  Distance: array[1..MAX_NODES] of Integer;
  Visited: array[1..MAX_NODES] of Boolean;
  U, V, i: Integer;

// Function to find the unvisited node with the minimum distance
function MinDistance(Dist: array[1..MAX_NODES] of Integer; Visited: array[1..MAX_NODES] of Boolean): Integer;
var
  MinVal: Integer;
  MinNode: Integer;
begin
  MinVal := INF;
  MinNode := 0;

  for i := 1 to MAX_NODES do begin
    if not Visited[i] and Dist[i] < MinVal then
    begin
      MinVal := Dist[i];
      MinNode := i;
    end;
  end;
  Result := MinNode;
end;

procedure Dijkstra(StartNode: Integer);
var
  CurrentNode: Integer;
begin
  // Initialization
  for i := 1 to MAX_NODES do begin
    Distance[i] := INF;
    Visited[i] := False;
  end;
  Distance[StartNode] := 0;

  // Main loop: runs V times
  for i := 1 to MAX_NODES do begin
    CurrentNode := MinDistance(Distance, Visited);

    if CurrentNode = 0 then Break; // All reachable nodes processed

    Visited[CurrentNode] := True;

    // Relaxation step: Update distances of neighbors
    for V := 1 to MAX_NODES do begin
      // Check if V is a neighbor and not yet visited
      if Adj[CurrentNode][V] <> 0 and not Visited[V] then begin
        // New distance = Current node distance + edge weight
        if Distance[CurrentNode] + Adj[CurrentNode][V] < Distance[V] then
          Distance[V] := Distance[CurrentNode] + Adj[CurrentNode][V];
      end;
    end;
  end;

  // Output results
  WriteLn('Shortest distances from Node ', StartNode, ':');
  for i := 1 to MAX_NODES do begin
    WriteLn('To Node ', i, ': ', Distance[i]);
  end;
end;

begin
  // Define a weighted graph (Adj[i][j] = weight)
  for i := 1 to MAX_NODES do
    for j := 1 to MAX_NODES do
      Adj[i][j] := 0; // 0 means no direct edge

  // Edges: (Node A, Node B, Weight)
  Adj[1][2] := 7; Adj[1][3] := 9; Adj[1][6] := 14;
  Adj[2][3] := 10; Adj[2][4] := 15;
  Adj[3][4] := 11;
  Adj[4][5] := 6;
  Adj[6][5] := 9;

  Dijkstra(1); // Start from Node 1
end.