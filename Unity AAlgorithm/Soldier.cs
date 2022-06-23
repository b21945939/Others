using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Soldier : MonoBehaviour
{
    public List<Node> nodes;
    int waypointIndex = 0;
    EnemyHandler enemyHandle;
    private void Start()
    {
        enemyHandle = FindObjectOfType<EnemyHandler>();
    }
    void Move()
    {
        transform.position = Vector2.MoveTowards(transform.position,
                                                nodes[waypointIndex].transform.position,
                                                5 * Time.deltaTime);

        if (transform.position == nodes[waypointIndex].transform.position)
        {
            waypointIndex += 1;
        }
        if (waypointIndex == nodes.Count)
        {
            nodes[waypointIndex - 1].soldierCount -=nodes[0].soldierCount;
            if(nodes[waypointIndex - 1].soldierCount<=0)
            {
                nodes[waypointIndex - 1].soldierCount = 0;
                if (nodes[0].isEnemy)
                {
                    nodes[waypointIndex - 1].isEnemy = true;
                    nodes[waypointIndex - 1].neutral = false;
                    nodes[waypointIndex - 1].soldierText.color = Color.yellow;
                    enemyHandle.enemyNodes.Add(nodes[waypointIndex - 1]);
                    enemyHandle.allyNodes.Remove(nodes[waypointIndex - 1]);
                }
                else
                {
                    nodes[waypointIndex - 1].isEnemy = false;
                    nodes[waypointIndex - 1].neutral = false;
                    nodes[waypointIndex - 1].soldierText.color = Color.green;
                    enemyHandle.allyNodes.Add(nodes[waypointIndex - 1]);
                    enemyHandle.enemyNodes.Remove(nodes[waypointIndex - 1]);
                }
            }
            Destroy(gameObject);
            waypointIndex = 0;
            nodes.Clear();
        }

    }
    // Update is called once per frame
    void Update()
    {
        Move();
    }
}
