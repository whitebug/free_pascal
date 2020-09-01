program FrCancel;

procedure MinusMod(var first, second: integer; var minf, mins: boolean);
begin
	if first < 0 then
	begin
		first := first * (-1);
		minf := true
	end;

	if second < 0 then
	begin
		second := second * (-1);
		mins := true;
	end
end;

procedure WhichBigger(var first, second: integer);
var
	temp: integer;
begin
	if first > second then
	begin
		temp := first;
		first := second;
		second := temp;
	end;
	{$IFDEF DEBUG}
	writeln('WhichBigger: first = ', first, ' second = ', second);
	{$ENDIF}
end;

function Euclidian(first, second: integer): integer;
begin
	WhichBigger(first, second);
	while (first <> 0) and (second <> 0) do
	begin
		if first > second then
			first := first - second
		else
			second := second - first
	end;
	if first > second then
		Euclidian := first
	else
		Euclidian := second
end;

var
	first, second, divider, firstAns, secondAns: integer;
	minf, mins: boolean;
begin
	read(first);
	read(second);
	{$IFDEF DEBUG}
	writeln('start processing');
	{$ENDIF}	
	MinusMod(first, second, minf, mins);
	{$IFDEF DEBUG}
	writeln('f ', first, ' s ', second, ' mf ', minf, ' ms ', mins);
	{$ENDIF}
	divider := Euclidian(first, second);
	firstAns := first div divider;
	secondAns := second div divider;
	if minf then
		firstAns := firstAns * (-1);
	if mins then
		secondAns := secondAns * (-1);
	writeln(firstAns, ' ', secondAns);
end.
