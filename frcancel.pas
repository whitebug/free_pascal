program FrCancel;

procedure CompareNumbers(var ina, inb: integer);
var temp: integer;
begin
	{$IFDEF DEBUG}
	writeln('DEBUG: CompareNumbers: ina = ', ina, ' inb = ', inb);
	{$ENDIF}
	if ina < inb then
	begin
		temp := ina;
		{$IFDEF DEBUG}
		writeln('DEBUG: CompareNumbers: temp = ', temp);
		{$ENDIF}
		ina := inb;
		inb := temp;
	end;
	{$IFDEF DEBUG}
	writeln('DEBUG: CompareNumbers: End of procedure');
	{$ENDIF}

end;

function Denominator(ina, inb: integer): integer;
var
	temp: integer;
	legal: boolean;
begin
	{$IFDEF DEBUG}
	writeln('DEBUG: Denominator: ina = ', ina, ' inb = ', inb);
	{$ENDIF}
	if inb <> 0 then
		temp := ina div inb;
	{$IFDEF DEBUG}
	writeln('DEBUG: Denominator: temp = ', temp);
	{$ENDIF}

	legal := true;
	while legal do
	begin
		ina := inb;
		inb := temp;
		if inb > 0 then
			temp := ina div inb
		else
			legal := false;

		{$IFDEF DEBUG}
		writeln('DEBUG: Denominator: temp = ', temp);
		{$ENDIF}
	end;
	{$IFDEF DEBUG}
	writeln('DEBUG: Denominator: result = ', inb);
	{$ENDIF}

	Denominator := inb;
end;

var
	ina, inb, over: integer;
begin
	{$I-}
	read(ina);
	if IOResult <> 0 then
	begin
		writeln('please enter a number');
		halt(1)
	end;
	read(inb);
	if IOResult <> 0 then
	begin
		writeln('please enter a number');
		halt(1)
	end;
	CompareNumbers(ina, inb);
	over := Denominator(ina, inb);
	writeln((ina / over), ' ', (inb / over));
end.

