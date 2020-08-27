program Stack;
type
	stackPtr = ^stackItem;
	stackItem = record
		data: integer;
		next: stackPtr;
	end;

procedure userInput(var stackIn: stackPtr);
var
	num: integer;
	stackNext: stackPtr;
begin
	writeln('please enter a number');
	new(stackIn);
	stackIn := nil;
	while not SeekEof do
	begin
		writeln('please enter a number');
		read(num);
		new(stackNext);
		stackNext^.next := stackIn;
		stackNext^.data := num;
		stackIn := stackNext
	end;
end;
var
	stackA, stackDel: stackPtr;
begin
	userInput(stackA);
	while stackA^.next <> nil do
	begin
		writeln(stackA^.data);
		stackDel := stackA;
		stackA := stackA^.next;
		dispose(stackDel)
	end
end.
