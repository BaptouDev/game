module vector;
import std.math;


struct vector2{
    float x=0;
    float y=0;
    this(float _x,float _y){
        x = _x;
        y = _y;
    }
    float magnitude_sq(){
        return (x*x+y*y);
    }
    float length(){
        return sqrt(magnitude_sq());
    }
    vector2 normalized(){
        if (magnitude_sq()!=0)
            return vector2(x/length(),y/length());
        else
            return vector2(0,0);
    }
    vector2 opBinary(string op:"+")(vector2 u)
    {
        return vector2(x+u.x,y+u.y);
    }
    vector2 opBinary(string op:"-")(vector2 u)
    {
        return vector2(x-u.x,y-u.y);
    }
    vector2 opBinaryRight(string op:"*")(float scaler)
    {
        return vector2(x*scaler,y*scaler);
    }
}