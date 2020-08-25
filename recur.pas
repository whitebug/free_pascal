program recur;

procedure PrintDigitsOfNumber(n: integer);
begin
	if n > 0 then
	begin
		PrintDigitsOfNumber(n div 10);
		write(n mod 10, ' ');
	end
end;

procedure PrintChars(ch: char; count: integer);
begin
	if count > 0 then
	begin
		write(ch);
		PrintChars(ch, count - 1)
	end
end;

var 
{in_char: char;}
	in_in: integer;
begin
	{writeln('input the character you want to print');
	readln(in_char);
	writeln('input the number of repeat');
	readln(in_in);
	PrintChars(in_char, in_in);
	writeln}
	writeln('Input a digit');
	readln(in_in);
	PrintDigitsOfNumber(in_in);
	writeln;
end.

