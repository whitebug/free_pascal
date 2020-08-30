program TreeSearch;
type
	TreeNodePtr = ^TreeNode;
	TreeNode = record
		data: longint;
		left, right: TreeNodePtr;
	end;

function FindAndSearch(var tr: TreeNodePtr; n: longint): boolean;
var
	pp: ^TreeNotePtr;
	tmp: TreeNotePtr;
begin
	if tr = nil then
		FindAndSearch := false;
	if tr^.data = n then
		FindAndSearch := true;
	pp := @tr;
	while (pp^ <> nil) or (pp^^.data <> n) do
	begin
		if pp^^.data = n then
		begin
			FindAndSearch
		end;
	end;
end;

var
	tree: TreeNodePtr;
begin
	new(tree);
	tree^.data := 12;
	new(tree^.left);
	tree^.left^.data := 11;
	new(tree^.right);
	tree^.right^.data := 10;

	while 
end.
