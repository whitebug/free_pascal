program goto_test;
label
	Quit;
begin
	writeln('Start of the program here', #7);
	writeln('Here is the middle');
	goto Quit;
	writeln('Here is the hidden part');
	Quit:
		writeln('This is the bottom part');
	writeln('The end')
end.
