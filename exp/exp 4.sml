fun thenAddOne (f:int->int,x:int)=(f x)+1;

fun mapList (f,[])=[]
|mapList (f,x::xs)=(f x)::mapList(f,xs);

fun mapList' f []=[]
|mapList' f (x::xs)=(f x)::mapList' f xs;

fun exists p []=false
|exists p (x::L)=(case (p x) of true=>true
	|_=>exists p L);

fun forall p []=true
|forall p (x::L)=(case (p x) of false=>false
	|_=>forall p L);

datatype 'a tree=Empty|Node of 'a tree*'a*'a tree;
fun treeFilter p Empty=Empty
|treeFilter p (Node(t1,x,t2))= (case (p Node(t1,x,t2)) of
	true=>Node(treeFilter p t1,SOME x,treeFilter p t2)
	|_=>Node(treeFilter p t1,NONE,treeFilter p t2));
