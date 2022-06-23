import javax.swing.*;
import java.awt.*;
import java.util.*;

public class GUI {
    static void GUIStart(){
        JFrame frame=new JFrame();
        JPanel panel = new JPanel();
        JTextField field = new JTextField();
        JButton starter = new JButton("Başlat");
        JLabel label = new JLabel("Şehir sayısı giriniz: ");
        field.setBounds(200,20,50,20);
        label.setBounds(50,20,150,20);
        starter.setBounds(300,20,150,20);
        starter.addActionListener(
                e -> {
                    JFrame mainFrame = new JFrame();
                    JPanel cityPanel = new JPanel();
                    JPanel drawPanel = new JPanel();
                    JLabel arrow = new JLabel("<->");
                    JTextField city1 = new JTextField();
                    JTextField city2 = new JTextField();
                    JTextField dcity1 = new JTextField();
                    JTextField dcity2 = new JTextField();
                    JLabel arrow2 = new JLabel("<->");
                    JButton dijkstra = new JButton("Dijkstra");
                    JTextField mesafe = new JTextField();
                    Dimension pref = new Dimension();
                    pref.setSize(60,20);
                    city1.setPreferredSize(pref);
                    city2.setPreferredSize(pref);
                    dcity1.setPreferredSize(pref);
                    dcity2.setPreferredSize(pref);
                    mesafe.setPreferredSize(pref);
                    JButton create = new JButton("Yol oluştur");
                    JButton tester = new JButton("Test");
                    JButton tsp = new JButton("GSP");
                    JButton reset = new JButton("Sıfırla");
                    JButton refresh = new JButton("Yenile");
                    JButton save = new JButton("Pozisyon Kaydet");
                    Map<String,Node> cities = new HashMap<>();
                    ArrayList<Node> nodes = new ArrayList<>();
                    ArrayList<Line> lines = new ArrayList<>();
                    int count = Integer.parseInt(field.getText()) -1;
                    ImageIcon imageIcon = new ImageIcon("square.png");
                    Image image = imageIcon.getImage();
                    Image newimg = image.getScaledInstance(50, 50,  Image.SCALE_SMOOTH);
                    imageIcon = new ImageIcon(newimg);
                    JLabel imager = new JLabel(imageIcon);
                    imager.setTransferHandler(new TransferHandler("icon"));
                    Mouse mouse = new Mouse();
                    imager.addMouseMotionListener(mouse);
                    imager.addMouseListener(mouse);
                    drawPanel.add(imager);
                    cities.put("Starter",new Node("Starter",imager));
                    nodes.add(cities.get("Starter"));
                    imager.setText("Starter");
                    int c=1;
                    for(int i=0;i<count;i++){
                        ImageIcon adder = new ImageIcon("circle.png");
                        Image im = adder.getImage();
                        Image newim = im.getScaledInstance(50, 50,  Image.SCALE_SMOOTH);
                        adder = new ImageIcon(newim);
                        JLabel added = new JLabel(adder);
                        added.setTransferHandler(new TransferHandler("icon"));
                        added.addMouseMotionListener(mouse);
                        added.addMouseListener(mouse);
                        drawPanel.add(added);
                        added.setText("City"+c);
                        cities.put("City"+c,new Node("City"+c,added));
                        nodes.add(cities.get("City"+c++));
                    }
                    refresh.addActionListener(
                            x -> {
                                for(Node i:nodes){
                                    i.label.setLocation(i.x,i.y);
                                }
                                Graphics g =drawPanel.getGraphics().create();
                                g.setColor(Color.BLACK);
                                for(Line i:lines){
                                    g.drawString(i.str,i.strx, i.stry);
                                    g.drawLine(i.x1,i.y1,i.x2,i.y2);
                                }
                            }
                    );
                    save.addActionListener(
                            x -> {
                                for(Node i:nodes){
                                    i.setXY();
                                }
                            }
                    );
                    reset.addActionListener(
                            x -> {
                                drawPanel.updateUI();
                                for(Node i:nodes){
                                    i.hasRoad.clear();
                                    i.setXY();
                                }
                                lines.clear();
                            }
                    );
                    create.addActionListener(
                            x -> {
                                if(cities.containsKey(city1.getText()) && cities.containsKey(city2.getText())){
                                    Graphics g =drawPanel.getGraphics().create();
                                    int optX = (cities.get(city1.getText()).label.getX()+25 +cities.get(city2.getText()).label.getX()+25)/2;
                                    int optY = (cities.get(city1.getText()).label.getY()+25 +cities.get(city2.getText()).label.getY()+25)/2;
                                    g.setColor(Color.BLACK);
                                    g.drawString(mesafe.getText(),optX,optY);
                                    Line line = new Line(cities.get(city1.getText()).label.getX()+25,cities.get(city1.getText()).label.getY()+25,cities.get(city2.getText()).label.getX()+25,cities.get(city2.getText()).label.getY()+25,optX,optY,mesafe.getText());
                                    g.drawLine(line.x1,line.y1,line.x2,line.y2);
                                    cities.get(city1.getText()).addRoad(cities.get(city2.getText()),line);
                                    cities.get(city2.getText()).addRoad(cities.get(city1.getText()),line);
                                    lines.add(line);
                                }
                            }
                    );
                    tsp.addActionListener(
                            x -> {
                                boolean[] bool = new boolean[nodes.size()];
                                bool[0]=true;
                                Counter counter = new Counter();
                                Counter total = new Counter();
                                total.total=0;
                                Dijkstra.TSP(nodes,bool,0,nodes.size(),1,total,counter);
                                Graphics g = drawPanel.getGraphics().create();
                                g.setColor(Color.blue);
                                int max =0;
                                int totaly=0;
                                int totall=0;
                                for(Line i:counter.road){
                                    g.drawLine(i.x1,i.y1,i.x2,i.y2);
                                    g.drawString(i.str,i.strx,i.stry);
                                    if(i.strx>max){
                                        max=i.strx;
                                    }
                                    totaly+=i.stry;
                                    totall++;
                                }
                                g.drawString("Result: "+counter,max+100,totaly/totall);
                            }
                    );
                    tester.addActionListener(
                            x -> {
                                int range;
                                Random rand = new Random();
                                for(String i:cities.keySet()){
                                    for(String j:cities.keySet()){
                                        range= rand.nextInt(100)+1;
                                        if(!i.equals(j) && !cities.get(i).hasRoad.containsKey(cities.get(j))){
                                            Graphics g =drawPanel.getGraphics().create();
                                            int optX = (cities.get(i).label.getX()+25 +cities.get(j).label.getX()+25)/2;
                                            int optY = (cities.get(i).label.getY()+25 +cities.get(j).label.getY()+25)/2;
                                            g.setColor(Color.BLACK);
                                            g.drawString(Integer.toString(range),optX,optY);
                                            Line line = new Line(cities.get(i).label.getX()+25,cities.get(i).label.getY()+25,cities.get(j).label.getX()+25,cities.get(j).label.getY()+25,optX,optY,Integer.toString(range));
                                            g.drawLine(line.x1,line.y1,line.x2,line.y2);
                                            cities.get(i).addRoad(cities.get(j),line);
                                            cities.get(j).addRoad(cities.get(i),line);
                                            lines.add(line);
                                        }
                                    }
                                }
                            }
                    );
                    dijkstra.addActionListener(
                            x -> {
                                if(cities.containsKey(dcity1.getText()) && cities.containsKey(dcity2.getText())){
                                    for(Node i:nodes){
                                        i.behind.clear();
                                    }
                                    Dijkstra.DijkstraAlg(cities.get(dcity1.getText()),nodes);
                                    Graphics g = drawPanel.getGraphics().create();
                                    g.setColor(Color.red);
                                    Node k = cities.get(dcity2.getText());
                                    Line line;
                                    Collections.reverse(cities.get(dcity2.getText()).behind);
                                    for(Node i:cities.get(dcity2.getText()).behind){
                                        line = i.hasRoad.get(k);
                                        g.drawLine(line.x1,line.y1,line.x2,line.y2);
                                        g.drawString(line.str,line.strx,line.stry);
                                        k=i;
                                    }
                                    g.drawString("Result: "+cities.get(dcity2.getText()).total,cities.get(dcity2.getText()).label.getX()+100,cities.get(dcity2.getText()).label.getY());
                                }
                            }
                    );
                    cityPanel.add(dcity1);
                    cityPanel.add(arrow2);
                    cityPanel.add(dcity2);
                    cityPanel.add(dijkstra);
                    cityPanel.add(tester);
                    cityPanel.add(city1);
                    cityPanel.add(arrow);
                    cityPanel.add(city2);
                    cityPanel.add(mesafe);
                    cityPanel.add(create);
                    cityPanel.add(tsp);
                    cityPanel.add(reset);
                    cityPanel.add(refresh);
                    cityPanel.add(save);
                    cityPanel.setBackground(Color.gray);
                    mainFrame.add(cityPanel,BorderLayout.PAGE_START);
                    mainFrame.add(drawPanel,BorderLayout.CENTER);
                    mainFrame.setSize(1280,720);
                    mainFrame.setLocationRelativeTo(null);
                    mainFrame.setVisible(true);
                }
        );
        panel.add(label);
        panel.add(starter);
        panel.add(field);
        panel.setLayout(null);
        frame.add(panel);
        frame.setSize(500,100);
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
