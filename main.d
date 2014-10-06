import giftwrap;
import std.stdio;


Point[] heap = [
					Point(4.41017,4.16502),
					Point(1.81363,2.10894),
					Point(5.18948,9.88794),
					Point(1.99674,3.78617),
					Point(9.41465,4.28535),
					Point(3.02345,5.32727),
					Point(6.51049,1.12999),
					Point(6.35273,8.97888)
				];

Point[] discHeap = [
					Point(1,1),
					Point(2,3),
					Point(3,3),
					Point(3,5),
					Point(3,8),
					Point(4,2),
					Point(5,4),
					Point(5,6),
					Point(6,3),
					Point(6,7),
					Point(7,5),
					Point(8,6),
					Point(2,1)
					];


void print(Point[] points)
{
	foreach(int i, p;points)
		writeln(i,"\t(",p.x,",",p.y,")");
}

void main()
{
	writeln("Before");
	print(discHeap);
	writeln("\nHull");
	print(convex(discHeap));
}