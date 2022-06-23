
import javax.swing.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Node {
    JLabel label;
    String name;
    double total;
    int x,y;
    List<Node> behind=new ArrayList<>();
    double inf=Double.POSITIVE_INFINITY;
    public Node(String name,JLabel label) {
        this.name = name;
        this.total= inf;
        this.label = label;
    }
    void setXY(){
        this.x=label.getX();
        this.y=label.getY();
    }
    Map<Node,Line> hasRoad = new HashMap<>();
    void addRoad(Node a,Line b){
        if(!hasRoad.containsKey(a) || Integer.parseInt(hasRoad.get(a).str)>Integer.parseInt(b.str)){
            hasRoad.put(a,b);
        }
    }
}
