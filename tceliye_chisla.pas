program TceliyeChisla;
type
	stackPtr = ^stackItem;
	stackItem = record
		data: integer;
		next: stackPtr;
	end;
var
	number: integer;
	stackBegin: stackPtr;
	stackDispose: stackPtr;
	stackNew: stackPtr;
	stack1: stackPtr;
	stack2: stackPtr;
begin
	{$I-}
	new(stack1);
	stackBegin := stack1;
	writeln('Please enter an integer');
	while not SeekEof do
	begin
		writeln('Please enter an integer');
		read(number);
		if IOResult <> 0 then
		begin
			writeln('Could not read your number');
			halt(1)
		end;
		stack1^.data := number;
		if IOResult <> 0 then
		begin
			writeln('Could not write your nuber');
			halt(1)
		end;
		new(stack1^.next);
		stack1 := stack1^.next;
	end;
	{input is ended, add nil to the end}
	stack1^.next := nil;
	stack1 := stackBegin;
	new(stack2);
	{we start stack2 with nil}
	stack2^.next := nil;
	stack2^.data := stack1^.data;
	new(stackNew);
	stackNew^.next := stack2;
	stack2 := stackNew;
	while stack1^.next <> nil do
	begin
		stack2^.data := stack1^.data;
		stackDispose := stack1;
		stack1 := stack1^.next;
		dispose(stackDispose);
		new(stackNew);
		stackNew^.next := stack2;
		stack2 := stackNew
	end;
	stack2 := stack2^.next;
	while stack2^.next <> nil do
	begin
		if stack2^.next^.next <> nil then
			write(stack2^.data, ' ')
		else
			writeln(stack2^.data);
		stackDispose := stack2;
		stack2 := stack2^.next;
		dispose(stackDispose)
	end
end.

