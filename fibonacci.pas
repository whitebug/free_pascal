program Fibo;

function Fibonacci(n: integer): longint;
var
	i: integer;
	p, q, r: longint;
begin
	if n <= 0 then
		Fibonacci := 0
	else
	begin
		q := 0;
		r := 1;
		for i := 2 to n do
		begin
			p := q;
			q := r;
			r := p + q
		end;
		Fibonacci := r
	end
end;
var
	fibo_number: integer;

begin
	writeln('enter Fibo number');
	read(fibo_number);
	writeln('Your fibo number is ', Fibonacci(fibo_number));
end.
