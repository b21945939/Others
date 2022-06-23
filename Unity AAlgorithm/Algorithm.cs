using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Algorithm : MonoBehaviour
{
    public Node chosen;
    public Node start;
    public Node[] nodes;
    public bool itsEnemy;
    public struct Nodie
    {
        public List<Node> behind;
        public List<float> behindgx;
        public Node node;
    }
    public List<Nodie> explored = new List<Nodie>();
    public List<Node> AStar()
    {
        explored = new List<Nodie>();
        foreach (Node i in nodes)
        {
            i.hx= Mathf.Sqrt(Mathf.Pow(chosen.transform.position.x-i.transform.position.x, 2) + Mathf.Pow(chosen.transform.position.y - i.transform.position.y, 2));
        }
        foreach(Node i in start.hasRoad)
        {
            if(((itsEnemy ^ i.isEnemy)|| i.neutral) && i != chosen)
            {
                continue;
            }
            else
            {
                i.gx = Mathf.Sqrt(Mathf.Pow(start.transform.position.x - i.transform.position.x, 2) + Mathf.Pow(start.transform.position.y - i.transform.position.y, 2));
                i.total = i.gx + i.hx;
                Nodie ii = new Nodie();
                ii.node = i;
                ii.behind = new List<Node> { start };
                if (ii.behindgx == null)
                {
                    ii.behindgx = new List<float>();
                }
                ii.behindgx.Add(i.gx);
                explored.Add(ii);
            }
        }
        bool kk = true;
        Nodie min = new Nodie();
        foreach (Nodie k in explored)
        {
            if (min.node == null || k.node.total < min.node.total)
            {
                min = k;
            }
        }
        if (min.node == null)
        {
            return null;
        }
        if (min.node.transform.position.x == chosen.transform.position.x && min.node.transform.position.y == chosen.transform.position.y)
        {
            kk = false;
        }
        else
        {
            min= new Nodie();
        }
        while (kk)
        {
            Nodie ii = new Nodie();
            foreach(Nodie i in explored)
            {
                if (ii.node == null || i.node.total < ii.node.total)
                {
                    ii = i;
                }
            }
            if (ii.node == null)
            {
                break;
            }
            foreach(Node i in ii.node.hasRoad)
            {
                if (((itsEnemy ^ i.isEnemy) || i.neutral) && i != chosen)
                {
                    continue;
                }
                else
                {
                    bool gg = false;
                    foreach (Node k in ii.behind)
                    {
                        if (i == k)
                        {
                            gg = true;
                            break;
                        }
                    }
                    if (gg)
                    {
                        continue;
                    }
                    i.gx = Mathf.Sqrt(Mathf.Pow(ii.node.transform.position.x - i.transform.position.x, 2) + Mathf.Pow(ii.node.transform.position.y - i.transform.position.y, 2));
                    i.total = i.gx + i.hx;
                    foreach (float k in ii.behindgx)
                    {
                        i.total += k;
                    }
                    Nodie iii = new Nodie();
                    iii.node = i;
                    iii.behind = new List<Node>();
                    foreach (Node j in ii.behind)
                    {
                        iii.behind.Add(j);
                    }
                    iii.behind.Add(ii.node);
                    if (iii.behindgx == null)
                    {
                        iii.behindgx = new List<float>();
                    }
                    iii.behindgx.Add(i.gx);
                    explored.Add(iii);
                }
            }
            explored.Remove(ii);
            foreach (Nodie k in explored)
            {
                if (min.node == null || k.node.total < min.node.total)
                {
                    min = k;
                }
            }
            if (min.node==null)
            {
                return null;
            }
            if (min.node.transform.position.x == chosen.transform.position.x && min.node.transform.position.y == chosen.transform.position.y)
            {
                kk = false;
            }
        }
        List<Node> returner = new List<Node>();
        foreach(Node i in min.behind){
            returner.Add(i);
        }
        returner.Add(min.node);
        return returner;
    }
}
