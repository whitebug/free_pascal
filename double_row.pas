program DoubleRow;
type
	doublePtr = ^doubleData;
	doubleData = record
		data: integer;
		next: doublePtr
	end;
const
	repeatNumber = 2;

procedure printDoubles(var first, second, beginning: doublePtr; max: integer);
var
	currentRepeat: integer;
begin
	first := beginning;
	currentRepeat := 0;
       	while currentRepeat < max do
	begin
		while first^.next <> nil do
		begin
			writeln(first^.data);
			second := first;
			first := first^.next;
			if currentRepeat = 1 then
				dispose(second)
		end;
		currentRepeat := currentRepeat + 1;
		first := beginning
	end;
end;
var
	number: integer;
	double1: doublePtr;
	double1Start: doublePtr;
	double2: doublePtr;
begin
	{$I-}
	new(double1);
	double1Start := double1;
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
		double1^.data := number;
		new(double1^.next);
		double1 := double1^.next
	end;
	printDoubles(double1, double2, double1Start, repeatNumber)
end.

