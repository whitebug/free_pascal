program EraseFile;
var
	f: file;
begin
	{$I-}
	if ParamCount < 1 then
	begin
		writeln(stderr, 'Please specify the file to delete');
		halt(1)
	end;
	assign(f, ParamStr(1));
	erase(f);
	if IOResult <> 0 then
	begin
		writeln(stderr, 'Error erasing the file');
		halt(1)
	end
end.
