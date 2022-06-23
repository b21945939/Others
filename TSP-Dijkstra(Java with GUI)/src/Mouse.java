import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;

public class Mouse extends Frame implements MouseMotionListener, MouseListener {
    Point first=new Point(0,0);
    @Override
    public void mouseDragged(MouseEvent e) {
        JComponent jc = (JComponent)e.getSource();
        TransferHandler th = jc.getTransferHandler();
        th.exportAsDrag(jc, e, TransferHandler.MOVE);
        jc.setLocation((int) (jc.getLocation().getX()-first.getX()+e.getLocationOnScreen().getX()),(int)(jc.getLocation().getY()-first.getY()+e.getLocationOnScreen().getY()));
        first = e.getLocationOnScreen();
    }

    @Override
    public void mouseMoved(MouseEvent e) {

    }

    @Override
    public void mouseClicked(MouseEvent e) {

    }

    @Override
    public void mousePressed(MouseEvent e) {
        first = e.getLocationOnScreen();
    }

    @Override
    public void mouseReleased(MouseEvent e) {

    }

    @Override
    public void mouseEntered(MouseEvent e) {

    }

    @Override
    public void mouseExited(MouseEvent e) {

    }
}
