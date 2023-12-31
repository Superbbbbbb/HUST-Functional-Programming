(*1.*)
int*string list->string list

f:'a*int->int
funny:('a * int->int)*'a list->int

?.X1 -> string

(*2.
ins:
1.当L长度为0时，ins(x, [ ])的值为[x]，为有序表.
2.假设长度为k的表A为有序表，ins(x,A)中x插入到第一个比x小的数之前。
因为A为有序表，插入后的表仍为有序表，即长度为k+1的表也为有序表
*isort：
1.当L长度为0时，isort(L)的值为空表，为有序表
2.假设长度为k的表isort(L)为有序表，isort(A)=isort(x::L)=ins(x,isort(L))。
因为isort(L)为有序表，所以ins(x,isort(L))为有序表，即长度为k+1的表也为有序表*)

(*3.
时间复杂度O(n^2)
时间复杂度O(n)*)

(*4.*)
fun divisibleByThree 0=true
	|divisibleByThree 1=false
	|divisibleByThree 2=false
	|divisibleByThree n=divisibleByThree(n-3);	

(*5.*)
fun oddP 0= false
	| oddP 1 = true
	| oddP n = oddP (n - 2);

(*6.*)
fun interleave([]:int list,x:int list):int list =x
	|interleave(x,[])=x
	|interleave(a::L1,b::L2)=a::b::interleave(L1,L2);

(*7.*)
fun reverse([]:int list):int list=[]
	|reverse [a]=[a]
	|reverse(a::L)=reverse(L)@[a];
(*O(n^2)*)

fun help([]:int list,L:int list):int list=L
	|help(x::L,l)=help(L,x::l);
fun reverse'(L)=help(L,[]);
(*O(n))*

(*8.*)
fun PrefixSum([]:int list):int list=[]
	|PrefixSum [a]=[a]
	|PrefixSum (a::x::L)=a::PrefixSum((a+x)::L);
(*O(n^2)*)

fun PrefixSumHelp([]:int list,L:int list,b:int):int list=L
	|PrefixSumHelp(a::l,L,b)=PrefixSumHelp(l,L@[a+b],a+b);
fun fastPrefixSum(L)=PrefixSumHelp(L,[],0);
(*O(n)*)
