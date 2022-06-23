using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arrow : MonoBehaviour
{
    //This doesn’t need to be public, but it helps when you’re initially trying to find the right size
    public float arrowheadSize;
    Vector3 startPosition, mouseWorld;
    public Algorithm alg;
    public GameObject arrow;
    LineRenderer arrowLine;
    public Soldier soldier;
    bool soldierRun;
    List<Node> nodes;
    int waypointIndex = 0;
    Soldier x;

    void Start()
    {
        arrowLine = arrow.GetComponentInChildren<LineRenderer>();
        mouseWorld = new Vector3();
        arrowheadSize = 1f;
    }
    void OnMouseDown()
    {
        mouseWorld = Camera.main.ScreenToWorldPoint(

        new Vector3(Input.mousePosition.x,
        Input.mousePosition.y,
        Camera.main.nearClipPlane
        ));
        alg.start = gameObject.GetComponent<Node>();
        startPosition = mouseWorld;

    }

    void OnMouseDrag()
    {
        //Turn on the arrow
        arrowLine.enabled = true;
        DrawArrow();
    }

    void DrawArrow()
    {

        mouseWorld = Camera.main.ScreenToWorldPoint(

        new Vector3(Input.mousePosition.x,
        Input.mousePosition.y,
        Camera.main.nearClipPlane
        ));
        //The longer the line gets, the smaller relative to the entire line the arrowhead should be
        float percentSize = (float)(arrowheadSize / Vector3.Distance(startPosition, mouseWorld));
        //h/t ShawnFeatherly (http://answers.unity.com/answers/1330338/view.html)
        arrowLine.SetPosition(0, startPosition);
        arrowLine.SetPosition(1, Vector3.Lerp(startPosition, mouseWorld, 0.999f - percentSize));
        arrowLine.SetPosition(2, Vector3.Lerp(startPosition, mouseWorld, 1 - percentSize));
        arrowLine.SetPosition(3, mouseWorld);
        arrowLine.widthCurve = new AnimationCurve(

        new Keyframe(0, 0.4f),
        new Keyframe(0.999f - percentSize, 0.4f),
        new Keyframe(1 - percentSize, 1f),
        new Keyframe(1 - percentSize, 1f),
        new Keyframe(1, 0f));
    }

    void OnMouseUp()
    {
        float min = 999999f;
        Node k = null;
        foreach(Node i in alg.nodes){
            if(Mathf.Abs((i.transform.position- Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, Camera.main.nearClipPlane))).magnitude)<min)
            {
                min = Mathf.Abs((i.transform.position - Camera.main.ScreenToWorldPoint(new Vector3(Input.mousePosition.x, Input.mousePosition.y, Camera.main.nearClipPlane))).magnitude);
                k = i;
            }
        }
        alg.chosen = k;
        if(!alg.start.isEnemy && !alg.start.neutral)
        {
            bool star = false;
            foreach(Node i in alg.chosen.hasRoad)
            {
                if (i.isEnemy == false)
                {
                    star = true;
                }
            }
            if (star)
            {
                alg.start.soldierCount /= 2;
                nodes = alg.AStar();
                if (nodes != null)
                {
                    x = Instantiate(soldier);
                    x.nodes = nodes;
                    x.transform.position = nodes[0].transform.position;
                }
            }
        }
        //Turn off the arrow
        arrowLine.enabled = false;
    }
}
