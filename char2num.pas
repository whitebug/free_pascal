program char2num;

function ReadLongInt(var result: longint): boolean;
var
	c: char;
	res: longint;
	position: integer;
begin
	res := 0;
	position := 0;
	repeat
		read(c);
		position := position + 1
	until (c <> ' ') and (c <> #10);
	while (c <> ' ') and (c <> #10) do
	begin
		if (c < '0') or (c > '9') then
		begin writeln('Unexpected ''', c, ''' in pos: ', position);
			readln;
			ReadLongInt := false;
			exit
		end;
		res := res * 10 + ord(c) - ord('0');
		read(c);
		position := position + 1
	end;
	result := res;
	ReadLongInt := true;
end;

var
	x, y: longint;
	ok: boolean;
begin
	repeat
		write('Please type the first number: ');
		ok := ReadLongInt(x)
	until ok;
	repeat
		write('Please type the second number: ');
		ok := ReadLongInt(y)
	until ok;
	writeln(x, ' times ', y, ' is ', x * y)
end.
