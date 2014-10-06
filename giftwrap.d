module giftwrap;

import std.range;

struct Point
{
	double x,y;
	bool opEquals()(auto ref const Point s) const
	{
		return (x==s.x)&&(y==s.y);
	}
	int opCmp()(auto ref const Point s) const
	{
		if(y<s.y)
			return -1;
		else
			if(y==s.y)
				if(x<s.x)
					return -1;
				else 
					if(x>s.x)
						return 1;
					else 
						return 0;
			else
				return 1;
	}

	unittest 
	{
		assert(Point(3,1)<Point(3,2));
		assert(Point(1,1)>=Point(1,1));
		assert(Point(3,3)<Point(4,3));
		assert(Point(4,3)>Point(3,3));
		assert(Point(3,2)>Point(3,1));
	}
}

enum Orient {none, left, right};

Orient turn(Point a, Point b, Point c)
{
	double val = (b.y - a.y) * (c.x - b.x) -
            (b.x - a.x) * (c.y - b.y);
    if(val==0) return Orient.none;
    return (val>0)? Orient.right : Orient.left;
}

unittest 
{
	Point a = Point(1,1);
	Point b = Point(2,1);
	Point l = Point(3,2);
	Point r = Point(3,0);
	Point n = Point(3,1);
	assert(turn(a,b,n)==Orient.none);
	assert(turn(a,b,l)==Orient.left);
	assert(turn(a,b,r)==Orient.right);
}

double distSq(Point a, Point b)
{
	return (a.x-b.x)^^2+(a.y-b.y)^^2;
}

Point[] convex(Point[] points)
{
	Point[] hull = [points[0]];
	int s = 0;
	int q = 1;
	do 
	{
		q = (s+1)%points.length;
		foreach(int i, p;points)
		{
			Orient t = turn(points[s],points[q],p);
			if(t==Orient.none)
				if(distSq(points[s],p)>distSq(points[s],points[q]))
					q = i;
				else {}
			else if(t==Orient.left)
				q = i;
		}
		hull~=points[q];
		s = q;
	} while(s!=0);
	return hull;
}