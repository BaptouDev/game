module pathfinding;
import vector;

struct node{
    int parent_i;
    int parent_j;
    int f;
    int g;
    int h;
    bool closed;
}

node[][] init_node_list_from_map(int[][] map){
    node[][] node_list;
    foreach (i,e;map){
        node[] row;
        foreach (j,value;e){
            row~=node(0,0,0,0,0,(value!=0));
        }
        node_list~=row;
    }
    return node_list;
}

vector2[] astar(node[][] node_list){
    vector2[] o_list = [];
    return o_list;
}