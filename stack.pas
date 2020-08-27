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
	stackIn^.next := nil;
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
	stackA: stackPtr;
begin
	userInput(stackA);
	while stackA^.next <> nil do
	begin
		writeln(stackA^.data);
		stackA := stackA^.next;
	end;
end.
