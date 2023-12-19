(*
1.
能 非空表
能 非空表
能 长度>=2的表
否 表不能作为追加元素
能 长度为2的表

2.
[x,y,z]
[x,y]
[(a,b),(c,d)]
([a,b],[c,d])

3.
int 3
real 12.4
int 9001
27

4.
正确
正确
错误
fun f (3 : int) : int = 9
    | f _ = 4;
错误
fun circ (r : real) : real = (real 2) * pi * r;
错误
fun semicirc : real = pi * r
错误
fun area (r : int) : real = pi *(real r)  *(real r);

5.
val it = 7 : int
类型错误
val it = 13 : int
val it = "hello" : string
不合法,string类型不能加字符串
不合法,string类型不能加数字
val a = 5 : int
不合法，没有val
val it = 13 : int
val twice = fn : int -> int
val it = 10 : int
不合法，没有val
不合法
不合法*)

(*6.*)
fun mult [ ]=1|mult(x::L)=x*(mult L);

mult([1,2,3,4]);

(*7.*)
fun zip ([],_)=[] | zip(_,[])=[] | zip(x::L1,y::L2)=(x,y)::zip(L1,L2);

zip(["a","b","c"],[1,2]);


fun unzip([])=([],[])
    |unzip((x,y)::L)=
    let
        val (L1,L2) = unzip(L)
    in
        (x::L1,y::L2)
    end;

unzip [("a",1),("b",2),("c",3)];

(*当L1和L2表长相同时成立，否则不成立*)

(*8.*)
fun Mult[]=1
    |Mult(r::R)=r*Mult(R);

Mult([1,2,3,4]);

(*9.*)
fun mult ([], a) = a
    | mult (x :: L, a) = mult(L, x * a);
(*a与list中所有整数的乘积*)
fun Mult([],a)=a
    |Mult(r::R,a)=Mult(R,mult(r,1)*a);

Mult([[1,2],[3,4]],5);

(*10.*)
fun double(0:int):int=0
    |double(n)=2+double(n-1)
fun square 0=0
    |square n=1+double(n-1)+square(n-1);

square(101);

