module utils;
import std.math;

float lerp(float a,float b,float t){
    return(a+(b-a)*t);
}
float cerp(float a,float b,float t){
    return (2*(a-b)*t*t*t+3*(b-a)*t*t+a);
}

float ease_in_sine(float t){
    return (1-cos(t*PI/2));
}
float ease_out_sine(float t){
    return (sin(t*PI/2));
}
float ease_in_out_sine(float t){
    return -(cos(PI*t)-1)/2;
}
float smooth_interp(float a,float b,float m,float to, float t){
    if(t<=to)
        return a+(m-a)*ease_in_sine(1/to*t);
    else
        return m+(b-m)*ease_out_sine(1/(1-to)*t+to/(to-1));
}

