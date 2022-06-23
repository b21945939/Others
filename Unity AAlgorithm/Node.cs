using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Node : MonoBehaviour
{
    public Node[] hasRoad;
    public float hx;
    public float gx;
    public float total;
    public bool isEnemy;
    public bool neutral;
    public int soldierCount;
    public float adder;
    public TextMeshProUGUI soldierText;
    public Sprite enemy;
    public Sprite ally;
    public Sprite neutrall;
    public SpriteRenderer renderer;
    private void Start()
    {
        soldierCount = 10;
        adder = 0;
        if (neutral)
        {
            renderer.sprite = neutrall;
        }
        else if (isEnemy)
        {
            renderer.sprite = enemy;
            soldierText.color = Color.yellow;
        }
        else
        {
            renderer.sprite = ally;
            soldierText.color = Color.green;
        }
    }
    private void Update()
    {
        soldierText.text = soldierCount.ToString();
        adder += Time.deltaTime;
        if (soldierCount != 10 && adder>1f)
        {
            soldierCount += 1;
            adder = 0;
        }

    }

}
