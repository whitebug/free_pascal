program Deque;
type
	LongItem2Ptr = ^LongItem2;
	LongItem2 = record
		data: longint;
		prev, next: LongItem2Ptr;
	end;
	LongDeque = record
		first, last: LongItem2Ptr;
	end;

procedure LongDequeInit(var deque: LongDeque);
begin
	deque.first := nil;
	deque.last := nil
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
	tmp: LongItem2Ptr;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := nil;
	tmp^.next := deque.first;
	if deque.first = nil then
		deque.last := tmp
	else
		deque.first^.prev := tmp;
	deque.first := tmp;
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var
	tmp: LongItem2Ptr;
begin
	new(tmp);
	tmp^.data := n;
	tmp^.prev := deque.last;
	tmp^.next := nil;
	if deque.last = nil then
		deque.first := tmp
	else
		deque.last^.next := tmp;
	deque.last := tmp;
end;

function LongDequePopFront(var deque: LongDeque; var n: longint) : boolean;
var
	tmp: LongItem2Ptr;
begin
	if deque.first = nil then
	begin
		LongDequePopFront := false;
		exit
	end;
	n := deque.first^.data;
	tmp := deque.first;
	deque.first := deque.first^.next;
	dispose(tmp);
	LongDequePopFront := true
end;

function LongDequePopBack(var deque: LongDeque; var n: longint) : boolean;
var
	tmp: LongItem2Ptr;
begin
	if deque.last = nil then
	begin
		LongDequePopBack := false;
		exit
	end;
	n := deque.last^.data;
	tmp := deque.last;
	deque.last := deque.last^.prev;
	dispose(tmp);
	LongDequePopBack := true
end;

function LongDequeIsEmpty(var deque: LongDeque) : boolean;
begin
	LongDequeIsEmpty := (deque.first = nil) or (deque.last = nil)
end;

begin
end.
