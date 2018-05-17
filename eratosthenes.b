implement Sieve;
 
include "sys.m";
	sys: Sys;
	print: import sys;
include "draw.m";
	draw: Draw;
 
Sieve : module
{
	init : fn(ctxt : ref Draw->Context, args : list of string);
};
 
init (ctxt: ref Draw->Context, args: list of string)
{
	sys = load Sys Sys->PATH;
 
	limit := 201;
	sieve : array of int;
	sieve = array [201] of {* => 1};
	(sieve[0], sieve[1]) = (0, 0);
 
	for (n := 2; n < limit; n++) {
		if (sieve[n]) {
			for (i := n*n; i < limit; i += n) {
				sieve[i] = 0;
			}
		}
	}
 
	for (n = 1; n < limit; n++) {
		if (sieve[n]) {
			print ("%4d", n);
		} else {
			print("   .");
		};
		if ((n%20) == 0) 
			print("\n\n");
	}	
}
