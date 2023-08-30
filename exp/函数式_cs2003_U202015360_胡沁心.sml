fun evens []=[]
|evens (x::xs)=if x mod 2=0 then x::evens xs else evens xs;

fun toInt (base : int) (digits : int list) : int = 
    case digits of 
      [] =>  0
    | d::digits'=>  d+base*toInt(base)(digits');

fun toBase (base : int) (n : int):int list=
	case n of 0=>[]
	|_=>(n mod base)::toBase(base)(n div base);

fun convert (b1:int,b2:int)(L:int list):int list=toBase b2 (toInt b1 L);
	