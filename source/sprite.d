module sprite;
import raylib;

struct Sprite{
    Texture2D text;
    this(char* path){
        text = LoadTexture(path);
    }
    void draw(Vector2 pos){
        DrawTexture(text,cast(int)pos.x,cast(int)pos.y,Color(255,255,255));
    }
}
struct Animation{
    int[] frames;
    float[] durations;
    bool one_shot = false;
    this(int[] _frames,float[] _durations){
        frames = _frames;
        durations = _durations;
    }
}