using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Double : MonoBehaviour
{
    public List<Stone> tiles;
    public List<Stone> others;
    public HashSet<Stone> tiles3;
    public List<List<Stone>> groups;
    List<Stone> jokerList;
    public void DoubleAlign()
    {
        foreach (Stone i in tiles)
        {
            others.Add(i);
            if (tiles3.Count == 0)
            {
                tiles3.Add(i);
            }
            else
            {
                bool doesHave = false;
                foreach(Stone j in tiles3)
                {
                    if(j.stoneId == i.stoneId && j.stoneType==i.stoneType && !j.isJoker && !i.isJoker)
                    {
                        doesHave = true;
                    }
                }
                if (!doesHave)
                {
                    tiles3.Add(i);
                }
            }
        }
        foreach (Stone i in tiles3)
        {
            if (i.isJoker)
            {
                jokerList.Add(i);
            }
            if (!i.isJoker)
            {
                List<Stone> tiles2 = new List<Stone>(tiles);
                tiles2.Remove(i);
                foreach (Stone j in tiles2)
                {
                    if(!j.isJoker && i.stoneId==j.stoneId && i.stoneType == j.stoneType)
                    {
                        List<Stone> subGroup = new List<Stone>();
                        subGroup.Add(i);
                        subGroup.Add(j);
                        groups.Add(subGroup);
                        others.Remove(i);
                        others.Remove(j);
                        continue;
                    }
                }
            }
        }
        others.Sort((a, b) => a.stoneId.CompareTo(b.stoneId));
        foreach (Stone i in jokerList)
        {
            if (others.Count-jokerList.Count > 0)
            {
                List<Stone> deleter = new List<Stone>();
                foreach(Stone j in others)
                {
                    if (!j.isJoker)
                    {
                        List<Stone> subGroup = new List<Stone>();
                        subGroup.Add(i);
                        subGroup.Add(j);
                        groups.Add(subGroup);
                        deleter.Add(i);
                        deleter.Add(j);
                        break;
                    }

                }
                foreach(Stone j in deleter)
                {
                    others.Remove(j);
                }

            }
        }
    }
}
