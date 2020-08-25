program errorless;
var
	x, y: longint;
begin
	{$I-}
	writeln('Enter two longint');
	read(x, y);
	if IOResult = 0 then
		writeln(x * y)
	else
		writeln('I couldn''t parse your input')
end.
