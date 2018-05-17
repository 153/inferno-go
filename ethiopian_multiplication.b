implement Ethiopian;
 
include "sys.m";
	sys: Sys;
	print: import sys;
include "draw.m";
	draw: Draw;
 
Ethiopian : module
{
	init : fn(ctxt : ref Draw->Context, args : list of string);
};
 
init (ctxt: ref Draw->Context, args: list of string)
{
	sys = load Sys Sys->PATH;
 
	print("\n%d\n", ethiopian(17, 34, 0));
	print("\n%d\n", ethiopian(99, 99, 1));
}
 
halve(n: int): int
{
	return (n /2);
}
 
double(n: int): int
{
	return (n * 2);
}
 
iseven(n: int): int
{
	return ((n%2) == 0);
}
 
ethiopian(a: int, b: int, tutor: int): int
{
	product := 0;
	if (tutor)
		print("\nmultiplying %d x %d", a, b);
	while (a >= 1) {
		if (!(iseven(a))) {
			if (tutor)
				print("\n%3d   %d", a, b);
			product += b;
		} else
			if (tutor)
				print("\n%3d   ----", a);
		a = halve(a);
		b = double(b);
	}
	return product;
}
