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
    this(int[] _frames,float[] _durations,bool _one_shot){
        frames = _frames;
        durations = _durations;
        one_shot = _one_shot;
    }
}

struct AnimatedSprite{
    Texture2D src_text;
    Animation[string] anims;
    float scale;
    int tile_size;
    string current_anim;
    string default_anim;
    float current_time = 0;
    int current_frame = 0;
    Rectangle[] anim_rects;
    this(char* path, Animation[string] _anims,float _scale,int _tile_size,string _current_anim,string _default_anim){
        src_text = LoadTexture(path);
        anims = _anims;
        scale = _scale;
        tile_size = _tile_size;
        current_anim = _current_anim;
        default_anim = _default_anim;
        for(int i=0;i<src_text.width/tile_size;i++){
            for(int j=0;j<src_text.height/tile_size;j++){
                anim_rects~=Rectangle(i*tile_size,j*tile_size,tile_size,tile_size);
            }
        }
    }
    void change_anim(string new_anim){
        current_anim = new_anim;
        current_frame = 0;
        current_time = 0;
    }
    void draw(Vector2 pos, float dt){
        current_time += dt;
        if (anims[current_anim].frames.length !=0){
            if (current_time>anims[current_anim].durations[current_frame]){
                current_time = 0;
                current_frame = (current_frame+1)%(cast(int)anims[current_anim].frames.length-1);
            }
        }
        Rectangle scaled_rect = Rectangle(pos.x,pos.y,tile_size*scale,tile_size*scale);
        DrawTexturePro(src_text,anim_rects[anims[current_anim].frames[current_frame]],scaled_rect,Vector2Zero(),0,Color(255,255,255));
    }
}