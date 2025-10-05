module pathfinding;
import raylib;

struct Node{
    int parent_i;
    int parent_j;
    int f;
    int g;
    int h;
    bool closed;
}

Node[][] init_node_list_from_map(int[][] map){
    Node[][] node_list;
    foreach (i,e;map){
        Node[] row;
        foreach (j,value;e){
            row~=Node(0,0,0,0,0,(value!=0));
        }
        node_list~=row;
    }
    return node_list;
}

Vector2[] astar(Node[][] node_list){
    Vector2[] o_list = [];
    return o_list;
}