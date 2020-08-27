program DoubleRow;
type
	doublePtr = ^doubleData;
	doubleData = record
		data: integer;
		next: doublePtr
	end;
const
	repeatNumber = 2;
var
	number: integer;
	currentRepeat: integer;
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
	double1 := double1Start;
	currentRepeat := 0;
       	while currentRepeat < repeatNumber do
	begin
		while double1^.next <> nil do
		begin
			writeln(double1^.data);
			double2 := double1;
			double1 := double1^.next;
			if currentRepeat = 1 then
				dispose(double2)
		end;
		currentRepeat := currentRepeat + 1;
		double1 := double1Start
	end;
end.

