public class Line {
    int x1,x2,y1,y2,strx,stry;
    String str;

    public Line(int x1, int y1, int x2, int y2, int strx, int stry, String str) {
        this.x1 = x1;
        this.x2 = x2;
        this.y1 = y1;
        this.y2 = y2;
        this.strx = strx;
        this.stry = stry;
        this.str = str;
    }

    public int w(){
        return Integer.parseInt(str);
    }
}
