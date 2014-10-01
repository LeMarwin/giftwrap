module giftwrap;

import std.stdio;
import std.random;
import std.math;
import std.algorithm;

struct Point
{
	double x,y;
}

struct Vector
{
	double x,y,z;
	double length()
	{
		return sqrt(x^^2+y^^2+z^^2);
	}
}

double dot(Vector a, Vector b)
{
	return a.x*b.x+a.y*b.y+a.z*b.z;
}

double cos(Vector a, Vector b)
{
	return dot(a,b)/(a.length*b.length);
}


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

Point searchMin(Point[] data)
{
	Point res=data[0];
	bool f(Point a, Point b)
	{
		return (a.x>b.x)&&(a.y<b.y);
	}
	foreach(int i, p;data)
	{
		if(f(p,res))
		{
			res = p;
		}
	}
	return res;
}

void main()
{
	Vector a = Vector(1,1,0);
	Vector b = Vector(1,0,1);
	writeln(cos(a,b));
	foreach(i;heap)
	{
		writeln(i);	
	}

	Point min = reduce!((a,b)=>{if(a.x>1) return b; else return a;})(heap);
	writeln("\nMin:\t",min);	
}