using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyHandler : MonoBehaviour
{
    public List<Node> enemyNodes;
    public List<Node> allyNodes;
    public Soldier soldier;
    public Algorithm alg;
    Soldier x;
    List<Node> nodes;
    List<Node> min;
    float a = 0;
    List<Node> copyEnemy = new List<Node>();
    List<Node> copyAlly = new List<Node>();

    private void Awake()
    {
        min = new List<Node>();
    }

    private void Update()
    {
        copyAlly.Clear();
        copyAlly.AddRange(allyNodes);
        copyEnemy.Clear();
        copyEnemy.AddRange(enemyNodes);
        foreach (Node i in copyEnemy)
        {
            if (a >= 0.5f)
            {
                alg.start = i;
                min.Clear();
                a = 0f;
                foreach (Node j in copyAlly)
                {
                    if (j.soldierCount <= i.soldierCount)
                    {
                        alg.chosen = j;
                        nodes = alg.AStar();
                        if (nodes == null)
                        {
                            continue;
                        }
                        if (min.Count == 0 || min[min.Count - 1].total > nodes[nodes.Count - 1].total)
                        {
                            min.Clear();
                            min.AddRange(nodes);
                        }
                    }
                }
                if (min.Count != 0)
                {
                    i.soldierCount /= 2;
                    x = Instantiate(soldier);
                    x.nodes.AddRange(min);
                    x.transform.position = min[0].transform.position;
                }
            }
            a += Time.deltaTime;
        }
    }
}
