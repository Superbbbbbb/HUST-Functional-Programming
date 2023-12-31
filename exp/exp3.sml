datatype tree=Empty|Node of tree*int*tree;
datatype order = GREATER | EQUAL | LESS;
fun compare(x:int,y:int):order=
	if x<y then LESS else
	if y<x then GREATER else EQUAL;
fun trav Empty = [ ]| trav (Node(t1, x, t2)) = trav t1 @ (x :: trav t2);

(*1.*)
fun split ([]:int list):(int list*int*int list)=([],0,[])
	|split [x]=([],x,[])
	|split [x,y]=([x],y,[])
	|split (x::y::L)=
		let val(L1,a,L2)=split L
		in (x::L1,a,y::L2)
		end;

fun listToTree([]:int list):tree=Empty
	|listToTree L=
		let val(L1,a,L2)=split L
		in Node(listToTree L1,a,listToTree L2)
		end;
(*2.*)
fun revT(Empty:tree):tree=Empty
	|revT (Node(L,x,R))=Node(revT R,x,revT L);

(*O(2^n) S(d^2)*)

(*3.*)
fun binarySearch(Empty:tree,x:int)=false:bool
	|binarySearch(Node(L,x,R),y)=case compare(x,y) of
		EQUAL=>true
		|_=>(if binarySearch(L,y)=true then true else
			if binarySearch(R,y)=true then true else false);

(*4.*)
fun treecompare(Empty,_)=EQUAL
	|treecompare(_,Empty)=EQUAL
	|treecompare(Node(L1,x1,R1),Node(L2,x2,R2))=compare(x1,x2);

fun SwapDown(Empty)=Empty
	|SwapDown(Node(Empty,x,Empty))=Node(Empty,x,Empty)
	|SwapDown(Node(Empty,x,Node(l2,x2,r2)))=(case compare(x,x2) of
		GREATER=>SwapDown(Node(Empty,x2,SwapDown(Node(l2,x,r2))))
		|_=>Node(Empty,x,Node(l2,x2,r2)))
	|SwapDown(Node(Node(l1,x1,r1),x,Empty))=(case compare(x,x1) of
		GREATER=>SwapDown(Node(SwapDown(Node(l1,x,r1)),x1,Empty))
		|_=>Node(Node(l1,x1,r1),x,Empty))
	|SwapDown(Node(Node(l1,x1,r1),x,Node(l2,x2,r2)))=case compare(x,x1) of
		GREATER=>(case compare(x1,x2) of
			GREATER=>SwapDown(Node(Node(l1,x1,r1),x2,SwapDown(Node(l2,x,r2))))
			|_=>SwapDown(Node(SwapDown(Node(l1,x,r1)),x1,Node(l2,x2,r2)))) 
		|_=>(case compare(x,x2) of
			GREATER=>SwapDown(Node(Node(l1,x1,r1),x2,SwapDown(Node(l2,x,r2))))
			|_=>Node(Node(l1,x1,r1),x,Node(l2,x2,r2)));

fun heapify(Empty)=Empty
	|heapify(Node(L,x,R))=SwapDown(Node(heapify L,x,heapify R));

(*O(nlogn) S(logn)*)
