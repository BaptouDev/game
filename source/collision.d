module collision;
import vector;

struct collision_rect{
    vector2 pos;
    vector2 size;
    this(vector2 _pos,vector2 _size){
       pos = _pos;
       size = _size;
    }
}

bool aabb_detect(collision_rect a,collision_rect b){
    return (a.pos.x + a.size.x >=b.pos.x)
    &&(a.pos.x<=b.pos.x+b.size.x)
    &&(a.pos.y + a.size.y >=b.pos.y)
    &&(a.pos.y<=b.pos.y+b.size.y);
}

struct physics_object{
    vector2 pos;
    vector2 offset;
    vector2 size;
    vector2 velocity;
    collision_rect rect;
    vector2 last_pos;
    this(vector2 _pos,vector2 _offset, vector2 _size,collision_rect _rect){
        pos = _pos;
        offset = _offset;
        size = _size;
        velocity = vector2(0,0);
        rect = collision_rect(pos+offset,size);
        last_pos = pos;
    }
    void update_vel(vector2 new_vel, physics_object o,float dt){
        velocity = new_vel;
        pos.x+= velocity.x*dt;
        rect.pos.x = pos.x+offset.x;
        if (aabb_detect(rect,o.rect)){
            pos.x = last_pos.x;
            rect.pos.x = pos.x+offset.x;
        }
        pos.y+= velocity.y*dt;
        rect.pos.y = pos.y+offset.y;
        if (aabb_detect(rect,o.rect)){
            pos.y = last_pos.y;
            rect.pos.y = pos.y+offset.y;
        }
        last_pos = pos;
    }
}