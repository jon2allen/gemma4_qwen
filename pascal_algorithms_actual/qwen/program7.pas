program TreeTraversal;

uses SysUtils;

type
  TNode = record
    Data: Integer;
    Left, Right: ^TNode;
  end;

var
  root: ^TNode;
  temp: ^TNode;

function CreateNode(val: Integer): ^TNode;
begin
  Result := New(TNode);
  Result^.Data := val;
  Result^.Left := nil;
  Result^.Right := nil;
end;

procedure Insert(var root: ^TNode; val: Integer);
var
  curr, prev: ^TNode;
begin
  if root = nil then
    root := CreateNode(val)
  else
  begin
    curr := root;
    while True do
    begin
      prev := curr;
      if val < curr^.Data then
        curr := curr^.Left
      else if val > curr^.Data then
        curr := curr^.Right
      else Break; // Duplicate check
      if curr = nil then
        break;
    end;
    if val < prev^.Data then
      prev^.Left := CreateNode(val)
    else
      prev^.Right := CreateNode(val);
  end;
end;

procedure InOrder(var node: ^TNode);
begin
  if node <> nil then
  begin
    InOrder(node^.Left);
    Write(node^.Data, ' ');
    InOrder(node^.Right);
  end;
end;

var
  i: Integer;
begin
  root := nil;
  for i := 1 to 5 do
  begin
    Insert(root, i * 2 - 1); // 1, 3, 5...
  end;
  Write('In-Order Traversal: ');
  InOrder(root);
  WriteLn;
end.