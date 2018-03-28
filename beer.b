# 99 bottles of beer on the wall, shared to Rosetta Code. 
# takes number of beers as a command line argument. 
implement Beer;

include "sys.m";
	sys: Sys;
	print: import sys;
include "draw.m";
	draw: Draw;

Beer : module
{
	init : fn(ctxt : ref Draw->Context, args : list of string);
	number: fn(s : string): int;
	plural: fn(i : int): string;
};

init (ctxt: ref Draw->Context, args: list of string)
{
	sys = load Sys Sys->PATH;
	argc := len args;
	beers := 99; 

	args = tl args;
 	if (argc == 2) 
		beers = number(hd args);
	if (beers > 99)
		beers = 99;
	if (2 > beers)
		beers = 2;
	while (beers > 0) {
		print("%d %s of beer on the wall,\n", beers, plural(beers));
		print("%d %s of beer\n", beers, plural(beers));
		print("Take one down, pass it around,\n");
		beers--;
		print("%d %s of beer on the wall\n\n", beers, plural(beers));
	}
}

number(s: string): int
{
	if (len s >= 3)
		s = s[:3];
	n := 0;
	for (i :=0; i < len s; i++) {
		c := s[i];
		if (c < '0' || c > '9') # Default for non-numbers is "1"
			c = '1'; 
		n = n * 10 + c-'0';
	}
	return n;
}

plural (i: int): string 
{
	if (i != 1)
		return "bottles";
	return "bottle";
}

