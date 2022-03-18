using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
public class Per : MonoBehaviour
{
    public int holderCount;
    public StoneHolder[] up;
    public StoneHolder[] down;
    public List<List<StoneHolder>> groups;
    public List<List<StoneHolder>> doubleGroups;
    public List<bool> isColor;
    StoneHolder[] upAndDown;

    private void Awake()
    {
        groups = new List<List<StoneHolder>>();
        doubleGroups = new List<List<StoneHolder>>();
    }
    public void PerCreator()
    {
        upAndDown = up.Concat(down).ToArray();
        groups.Clear();
        isColor.Clear();
        doubleGroups.Clear();
        for (int i = 0; i < holderCount - 1; i++)
        {
            if (up[i].stone != null && (i == 0 || up[i - 1].stone == null) && up[i + 1].stone != null && (up[i + 2].stone == null || i==holderCount-2))
                if (up[i].stone.isJoker || up[i + 1].stone.isJoker || (up[i].stone.stoneId == up[i + 1].stone.stoneId && up[i].stone.stoneType == up[i + 1].stone.stoneType))
            {
                List<StoneHolder> doub = new List<StoneHolder>();
                doub.Add(up[i]);
                doub.Add(up[i + 1]);
                doubleGroups.Add(doub);
                if (i < holderCount - 3)
                {
                    i += 2;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        for (int i = 0; i < holderCount - 1; i++)
        {
            if (down[i].stone.isJoker || down[i + 1].stone.isJoker || (down[i].stone.stoneId == down[i + 1].stone.stoneId && down[i].stone.stoneType == down[i + 1].stone.stoneType))
            {
                List<StoneHolder> doub = new List<StoneHolder>();
                doub.Add(down[i]);
                doub.Add(down[i + 1]);
                doubleGroups.Add(doub);
                if (i < holderCount - 3)
                {
                    i += 2;
                    continue;
                }
                else
                {
                    break;
                }
            }
        }
        for (int i=0;i<holderCount-2;i++)
        {
            if (up[i].stone != null && (i==0 || up[i-1].stone == null) && up[i+1].stone!=null && up[i + 2].stone != null)
            {
                string color = up[i].stone.stoneType;
                int number = up[i].stone.stoneId;
                if (up[i].stone.isJoker)
                {
                    number= up[i+1].stone.stoneId;
                    color = up[i+1].stone.stoneType;
                    if (up[i + 1].stone.isJoker)
                    {
                        number = up[i + 2].stone.stoneId;
                        color = up[i + 2].stone.stoneType;
                    }
                }
                if (ColorControl(up[i].stone,up[i+1].stone, number) && ColorControl(up[i].stone, up[i + 2].stone, number) && ColorControl(up[i+1].stone, up[i + 2].stone, number))
                {
                    if((i<holderCount-3 && ColorControl(up[i].stone, up[i+1].stone, up[i+2].stone, up[i+3].stone, number) && (i < holderCount-4 && up[i + 4].stone == null) || i == holderCount-4))
                    {
                        List<StoneHolder> adder = new List<StoneHolder>
                        {
                            up[i],
                            up[i + 1],
                            up[i + 2],
                            up[i + 3]
                        };
                        groups.Add(adder);
                        isColor.Add(true);
                        if (i < holderCount - 6)
                        {
                            i += 4;
                            continue;
                        }
                        else { break; }
                    }
                    else if((i < holderCount - 3 && up[i + 3].stone == null) || i == holderCount - 3)
                    {
                        List<StoneHolder> adder = new List<StoneHolder>
                        {
                            up[i],
                            up[i + 1],
                            up[i + 2]
                        };
                        groups.Add(adder);
                        isColor.Add(true);
                        if (i < holderCount - 5)
                        {
                            i += 3;
                            continue;
                        }
                        else { break; }
                    }
                }
                if (NumberControl(up[i].stone, up[i + 1].stone,1,color) && NumberControl(up[i].stone, up[i + 2].stone,2, color) && NumberControl(up[i + 1].stone, up[i + 2].stone,1, color))
                {

                    List<StoneHolder> adder = new List<StoneHolder>
                    {
                        up[i],
                        up[i + 1],
                        up[i + 2]
                    };
                    if (i == holderCount - 3)
                    {
                        groups.Add(adder);
                        isColor.Add(false);
                        break;
                    }
                    while (i< holderCount - 3)
                    {
                        if (up[i + 3] == null || !NumberControl(up[i].stone, up[i+1].stone, up[i+2].stone, up[i+3].stone, color))
                        {
                            break;

                        }
                        
                        else
                        {
                            adder.Add(up[i + 3]);
                        }
                        i += 1;
                    }
                    if(up[i + 3].stone == null)
                    {
                        groups.Add(adder);
                        isColor.Add(false);
                    }
                }
            }
        }
        for (int i = 0; i < holderCount - 2; i++)
        {
            if (down[i].stone != null && (i == 0 || down[i - 1].stone == null) && down[i + 1].stone != null && down[i + 2].stone != null)
            {
                string color = down[i].stone.stoneType;
                int number = down[i].stone.stoneId;
                if (down[i].stone.isJoker)
                {
                    number = down[i + 1].stone.stoneId;
                    color = down[i + 1].stone.stoneType;
                    if (down[i + 1].stone.isJoker)
                    {
                        number = down[i + 2].stone.stoneId;
                        color = down[i + 2].stone.stoneType;
                    }
                }
                if (ColorControl(down[i].stone, down[i + 1].stone, number) && ColorControl(down[i].stone, down[i + 2].stone, number) && ColorControl(down[i + 1].stone, down[i + 2].stone, number))
                {
                    if (i < holderCount - 3 && ColorControl(down[i].stone, down[i + 1].stone, down[i + 2].stone, down[i + 3].stone, number) && ((i < holderCount - 4 && down[i + 4].stone == null) || i == holderCount - 4))
                    {
                        List<StoneHolder> adder = new List<StoneHolder>
                        {
                            down[i],
                            down[i + 1],
                            down[i + 2],
                            down[i + 3]
                        };
                        groups.Add(adder);
                        isColor.Add(true);
                        if (i < holderCount - 6)
                        {
                            i += 4;
                            continue;
                        }
                        else { break; }
                    }
                    else if ((i < holderCount - 3 && down[i + 3].stone == null) || i == holderCount - 3)
                    {
                        List<StoneHolder> adder = new List<StoneHolder>
                        {
                            down[i],
                            down[i + 1],
                            down[i + 2]
                        };
                        groups.Add(adder);
                        isColor.Add(true);
                        if (i < holderCount - 5)
                        {
                            i += 3;
                            continue;
                        }
                        else { break; }
                    }
                }
                if (NumberControl(down[i].stone, down[i + 1].stone, 1, color) && NumberControl(down[i].stone, down[i + 2].stone, 2, color) && NumberControl(down[i + 1].stone, down[i + 2].stone, 1, color))
                {
                    List<StoneHolder> adder = new List<StoneHolder>
                    {
                        down[i],
                        down[i + 1],
                        down[i + 2]
                    };
                    if (i == holderCount - 3)
                    {
                        groups.Add(adder);
                        isColor.Add(false);
                        break;
                    }
                    while (i < holderCount - 3)
                    {
                        if (down[i + 3] == null || !NumberControl(down[i].stone, down[i + 1].stone, down[i + 2].stone, down[i + 3].stone, color))
                        {
                            break;
                        }

                        else
                        {
                            adder.Add(down[i + 3]);
                        }
                        i += 1;
                    }
                    if (down[i + 3].stone == null)
                    {
                        groups.Add(adder);
                        isColor.Add(false);
                    }
                }
            }
        }
        List<List<StoneHolder>> deleterGroups = new List<List<StoneHolder>>();
        for(int i=0;i<groups.Count;i++)
        {
            int hasJoker = 0;
            if (!isColor[i])
            {
                foreach (StoneHolder j in groups[i])
                {
                    if (j.stone.isJoker)
                    {
                        hasJoker += 1;
                    }
                }
                if (groups[i].Count == 3 && hasJoker == 2)
                {
                    break;
                }
                else if (hasJoker >= 1)
                {
                    int a = 0;
                    bool first = true;
                    int b = 0;
                    int joker1 = 0;
                    bool firstJoker = true;
                    int joker2 = 0;
                    bool second = true;
                    for (int j = 0; j < groups[i].Count; j++)
                    {
                        if (groups[i][j].stone.isJoker && firstJoker)
                        {
                            joker1 = j;
                            firstJoker = false;
                        }
                        else if (groups[i][j].stone.isJoker)
                        {
                            joker2 = j;
                        }
                        else if (first && !groups[i][j].stone.isJoker)
                        {
                            a = j;
                            first = false;
                        }
                        else if (second && !groups[i][j].stone.isJoker)
                        {
                            b = j;
                            second = false;
                        }
                    }
                    if(groups[i][a].stone.stoneId> groups[i][b].stone.stoneId)
                    {
                        if (hasJoker == 2)
                        {
                            Stone tester1 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId-(joker1-a),false,false,false,null);
                            Stone tester2 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId - (joker2 - a), false, false, false, null);
                            if(!CanTakeble(tester1) || !CanTakeble(tester2))
                            {
                                deleterGroups.Add(groups[i]);
                            }
                            
                        }
                        else
                        {
                            Stone tester1 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId - (joker1 - a), false, false, false, null);
                            if (!CanTakeble(tester1))
                            {
                                deleterGroups.Add(groups[i]);
                            }
                        }
                    }
                    else
                    {
                        if (hasJoker == 2)
                        {
                            Stone tester1 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId + (joker1 - a), false, false, false, null);
                            Stone tester2 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId + (joker2 - a), false, false, false, null);
                            if (!CanTakeble(tester1) || !CanTakeble(tester2))
                            {
                                deleterGroups.Add(groups[i]);
                            }
                        }
                        else
                        {
                            Stone tester1 = new Stone(groups[i][a].stone.stoneType, groups[i][a].stone.stoneId + (joker1 - a), false, false, false, null);
                            if (!CanTakeble(tester1))
                            {
                                deleterGroups.Add(groups[i]);
                            }
                        }
                    }
                }
            }
        }
        foreach(var i in deleterGroups)
        {
            groups.Remove(i);
        }
    }
    public int Calculator()
    {
        int point = 0;
        foreach(List<StoneHolder> i in groups)
        {
            int hasJoker = 0;
            int pointer = 0;
            foreach (StoneHolder j in i)
            {
                if (j.stone.isJoker)
                {
                    hasJoker += 1;
                }
            }
            if (hasJoker != 0)
            {
                int a = 0;
                bool first=true;
                int b = 0;
                bool second=true;
                for(int j = 0; j < i.Count; j++)
                {
                    if (first && !i[j].stone.isJoker)
                    {
                        a = j;
                        first = false;
                    }
                    else if (second && !i[j].stone.isJoker)
                    {
                        b = j;
                        second = false;
                    }
                    else if (!first && !second)
                    {
                        break;
                    }
                }
                if(i.Count==3 && hasJoker == 2)
                {
                    if (isColor[groups.IndexOf(i)])
                    {
                        for (int j = 0; j < i.Count; j++)
                        {
                            if (!i[j].stone.isJoker)
                            {
                                point += i[j].stone.stoneId * 3;
                            }
                        }
                    }
                    else
                    {
                        if (!i[1].stone.isJoker)
                        {
                            point += i[1].stone.stoneId * 3;
                        }
                        else
                        {
                            for (int k = 0; k < 3; k++)
                            {
                                if (!i[k].stone.isJoker)
                                {
                                    if (i[k].stone.stoneId == 13)
                                    {
                                        point += 13 + 12 + 11;
                                    }
                                    else if (i[k].stone.stoneId == 1)
                                    {
                                        point += 1 + 2 + 3;
                                    }
                                    else
                                    {
                                        if(CanTakeble(new Stone(i[k].stone.stoneType, i[k].stone.stoneId + 1, false, false, false, null)) && CanTakeble(new Stone(i[k].stone.stoneType, i[k].stone.stoneId + 2, false, false, false, null)))
                                        {
                                            point += i[k].stone.stoneId + i[k].stone.stoneId +1 +i[k].stone.stoneId + 2;
                                        }
                                        else
                                        {
                                            point += i[k].stone.stoneId + i[k].stone.stoneId - 1 + i[k].stone.stoneId - 2;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else if(i[a].stone.stoneType== i[b].stone.stoneType)
                {
                    for (int j = 0; j < i.Count; j++)
                    {
                        point += i[a].stone.stoneId;
                        point -= a - j;
                    }
                }
                else
                {
                    for (int j = 0; j < i.Count; j++)
                    {
                        point += i[a].stone.stoneId;
                    }
                }
            }
            else
            {
                for (int j = 0; j < i.Count; j++)
                {
                    point += i[j].stone.stoneId;
                }
            }
        }
        return point;
    }
    public bool ColorControl(Stone a,Stone b,int number)
    {
        if (a == null || b == null)
        {
            return false;
        }
        if (a.stoneId==b.stoneId && a.stoneType!=b.stoneType && !a.isJoker && !b.isJoker)
        {
            return true;
        }
        else if(a.isJoker && b.isJoker)
        {
            HashSet<Stone> stones = new HashSet<Stone>();
            string[] colors = {"red","black","blue","orange" };
            foreach(string i in colors)
            {
                Stone c = new Stone(i,number,false,false,false,null);
                if (CanTakeble(c))
                {
                    stones.Add(c);
                }
            }
            if (stones.Count >= 2)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else if (a.isJoker || b.isJoker)
        {
            HashSet<Stone> stones = new HashSet<Stone>();
            string[] colors = { "red", "black", "blue", "orange" };
            foreach (string i in colors)
            {
                Stone c = new Stone(i, number, false, false, false, null);
                if (CanTakeble(c))
                {
                    stones.Add(c);
                }
            }
            if (stones.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else { return false; }
    }
    public bool ColorControl(Stone a, Stone b,Stone c,Stone d,int number)
    {
        return (ColorControl(a, b,number)&& ColorControl(a, c, number) && ColorControl(a, d, number) && ColorControl(b, c, number) && ColorControl(b, d, number) && ColorControl(c, d, number));
    }
    public bool NumberControl(Stone a, Stone b,int number,string color)
    {
        if (a == null || b == null)
        {
            return false;
        }
        if ((a.stoneId+number == b.stoneId || a.stoneId==b.stoneId+number)&& a.stoneType == b.stoneType && !a.isJoker && !b.isJoker)
        {
            return true;
        }
        else if (a.isJoker && b.isJoker)
        {
            return true;
        }
        else if (a.isJoker)
        {
            HashSet<Stone> stones = new HashSet<Stone>();
            Stone c = new Stone(color, b.stoneId-number, false, false, false, null);
            Stone d = new Stone(color, b.stoneId+number, false, false, false, null);
            if (CanTakeble(c) && b.stoneId-number>0)
            {
                stones.Add(c);
            }
            if (CanTakeble(d) && b.stoneId + number <= 13)
            {
                stones.Add(d);
            }
            if (stones.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else if (b.isJoker)
        {
            HashSet<Stone> stones = new HashSet<Stone>();
            Stone c = new Stone(color, a.stoneId - number, false, false, false, null);
            Stone d = new Stone(color, a.stoneId + number, false, false, false, null);
            if (CanTakeble(c) && a.stoneId - number > 0)
            {
                stones.Add(c);
            }
            if (CanTakeble(d) && a.stoneId + number <= 13)
            {
                stones.Add(d);
            }
            if (stones.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else { return false; }
    }
    public bool NumberControl(Stone a, Stone b, Stone c, Stone d,string color)
    {
        return (NumberControl(a, b,1,color) && NumberControl(a, c,2, color) && NumberControl(a, d,3, color) && NumberControl(b, c,1, color) && NumberControl(b, d,2, color) && NumberControl(c, d,1, color));
    }
    public bool CanTakeble(Stone a)
    {
        int first = 0;
        if(a.stoneId>13 || a.stoneId < 1)
        {
            return false;
        }
        foreach (StoneHolder i in upAndDown)
        {
            if (i.stone!=null && i.stone.stoneType == a.stoneType && i.stone.stoneId== a.stoneId && !i.stone.isJoker)
            {
                first += 1;
            }
        }
        if (first == 2)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}
