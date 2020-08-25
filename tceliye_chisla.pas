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
	stack2^.next := nil;
	stack2^.data := stack1^.data;
	while stack1^.next <> nil do
	begin
		writeln('first stack ', stack1^.data);
		new(stack2^.next);
		stack2^.next^.data := stack1^.data;
		stackDispose := stack1;
		stack1 := stack1^.next;
	        stack2^.next := stack2;
		dispose(stackDispose);
	end;
	while stack2^.next <> nil do
	begin
		writeln('second stack ', stack2^.data);
		stackDispose := stack2;
		stack2 := stack2^.next;
		dispose(stackDispose)
	end
end.

