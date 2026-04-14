program BSTTraversalExample;

// Define the Node structure
type
  TNode = record
    Value: Integer;
    Left: ^TNode;
    Right: ^TNode;
  end;

var
  Root: ^TNode;

// Function to insert a new node into the BST
procedure Insert(var Current: ^TNode; Value: Integer);
var
  NewNode: TNode;
begin
  if Current = nil then begin
    NewNode.Value := Value;
    NewNode.Left := nil;
    NewNode.Right := nil;
    Current := @NewNode;
    Exit;
  end;

  if Value < Current^.Value then
    Insert(Current^.Left, Value)
  else if Value > Current^.Value then
    Insert(Current^.Right, Value)
  else
    // Value already exists
    WriteLn('Value ', Value, ' already exists.');
end;

// Inorder Traversal (prints nodes in sorted order)
procedure InorderTraversal(Current: ^TNode);
begin
  if Current <> nil then begin
    InorderTraversal(Current^.Left);
    Write(Current^.Value, ' '); // Visit node
    InorderTraversal(Current^.Right);
  end;
end;

begin
  // Build the tree
  Root := nil;
  Insert(Root, 50);
  Insert(Root, 30);
  Insert(Root, 70);
  Insert(Root, 20);
  Insert(Root, 40);
  Insert(Root, 60);

  WriteLn('Inorder Traversal (Sorted Order): ');
  InorderTraversal(Root);
  WriteLn;
end.