module collision;
//import vector;
import raylib;

struct CollisionRect{
    Vector2 pos;
    Vector2 size;
    this(Vector2 _pos,Vector2 _size){
       pos = _pos;
       size = _size;
    }
}

bool aabb_detect(CollisionRect a,CollisionRect b){
    return (a.pos.x + a.size.x >=b.pos.x)
    &&(a.pos.x<=b.pos.x+b.size.x)
    &&(a.pos.y + a.size.y >=b.pos.y)
    &&(a.pos.y<=b.pos.y+b.size.y);
}

struct PhysicsObject{
    Vector2 pos;
    Vector2 offset;
    Vector2 size;
    Vector2 velocity;
    CollisionRect rect;
    Vector2 last_pos;
    this(Vector2 _pos,Vector2 _offset, Vector2 _size,CollisionRect _rect){
        pos = _pos;
        offset = _offset;
        size = _size;
        velocity = Vector2(0,0);
        rect = CollisionRect(pos+offset,size);
        last_pos = pos;
    }
    void update_vel(Vector2 new_vel, PhysicsObject o,float dt){
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