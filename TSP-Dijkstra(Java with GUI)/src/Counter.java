import java.util.ArrayList;

public class Counter {
    double total;
    ArrayList<Line> road;

    public Counter(double total, ArrayList<Line> road) {
        this.total = total;
        this.road = road;
    }

    public Counter(){
        this.total=Integer.MAX_VALUE;
        this.road=new ArrayList<>();
    }

    @Override
    public String toString() {
        return String.valueOf(total);
    }
}
