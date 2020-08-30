program MatchPattern;
function MatchIdx(var strng, pattrn: string; idxs, idxp: integer) : boolean;
var
	i: integer;
begin
	while true do
	begin
		if idxp > length(pattrn) then
		begin
			MatchIdx := idxs > length(strng);
			exit
		end;
		if pattrn[idxp] = '*' then
		begin
			for i := 0 to length(strng) - idxs + 1 do
				if MatchIdx(strng, pattrn, idxs+i, idxp+1) then
				begin
					MatchIdx := true;
					exit
				end;
			MatchIdx := false;
			exit
		end;
		if (idxs > length(strng)) or 
		((strng[idxs] <> pattrn[idxp]) and (pattrn[idxp] <> '?')) then
		begin
			MatchIdx := false;
			exit
		end;
		idxs := idxs + 1;
		idxp := idxp + 1;
	end
end;

function Match(strng, pattrn: string): boolean;
begin
	Match := MatchIdx(strng, pattrn, 1, 1)
end;

begin
	if ParamCount < 2 then
	begin
		writeln(ErrOutput, 'Two parameters expected');
		halt(1)
	end;
	if Match(ParamStr(1), ParamStr(2)) then
		writeln('yes')
	else
		writeln('no')
end.
