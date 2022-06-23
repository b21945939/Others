import javax.xml.bind.SchemaOutputResolver;
import java.awt.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;


public class Dijkstra {

    static void DijkstraAlg(Node start, ArrayList<Node> nodes){
        double inf=Double.POSITIVE_INFINITY;
        ArrayList<Node> explored = new ArrayList<>(nodes);
        for(Node i:explored){
            i.total=inf;
        }
        start.total=0;
        while(!explored.isEmpty()){
            Node min=null;
            for(Node i:explored){
                if(min==null){
                    min=i;
                }
                else if(i.total<min.total){
                    min=i;
                }
            }
            for(Node i:min.hasRoad.keySet()){
                double a=min.hasRoad.get(i).w()+min.total;
                if(i.total>a){
                    i.behind.clear();
                    i.behind.addAll(min.behind);
                    i.behind.add(min);
                    i.total=a;
                }
            }
            explored.remove(min);
        }
    }

    static Counter TSP(ArrayList<Node> nodes, boolean[] bool, int pos, int n, int count, Counter total, Counter ans){
        if (count == n && nodes.get(pos).hasRoad.containsKey(nodes.get(0)) && nodes.get(pos).hasRoad.get(nodes.get(0)).w() > 0){
            if(ans.total>total.total + nodes.get(pos).hasRoad.get(nodes.get(0)).w()){
                ans.total=total.total + nodes.get(pos).hasRoad.get(nodes.get(0)).w();
                ans.road=new ArrayList<>(total.road);
                ans.road.add(nodes.get(pos).hasRoad.get(nodes.get(0)));
            }
            return ans;
        }
        for (int i = 0; i < n; i++){
            if (!bool[i] && nodes.get(pos).hasRoad.containsKey(nodes.get(i)) && nodes.get(pos).hasRoad.get(nodes.get(i)).w() > 0){
                bool[i] = true;
                total.total+=nodes.get(pos).hasRoad.get(nodes.get(i)).w();
                total.road.add(nodes.get(pos).hasRoad.get(nodes.get(i)));
                ans = TSP(nodes, bool, i, n, count + 1, total, ans);
                total.road.remove(nodes.get(pos).hasRoad.get(nodes.get(i)));
                total.total-=nodes.get(pos).hasRoad.get(nodes.get(i)).w();
                bool[i] = false;
            }
        }
        return ans;
    }

}
