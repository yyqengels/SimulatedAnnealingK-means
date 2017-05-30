function [m_pattern]=kjunzhi(m_pattern,patternnum,distype,centernum,iternum)
for i=1:patternnum
    m_pattern(i).distance=inf;
    m_pattern(i).category=-1;
end
randpattern=randperm(patternnum);
for i=1:centernum
    m_pattern(randpattern(i)).category=i;
    m_pattern(randpattern(i)).distance=0;
    m_center(i).feature=m_pattern(randpattern(i)).feature;
    m_center(i).index=i;
    m_center(i).patternnum=1;
end
counter=0;
change=1;
while(counter<iternum&&change~=0)
    counter=counter+1;
    change=0;
    for i=1:patternnum
        index=-1;
        distance=inf;
        for j=1:centernum
            tempdis=GetDistance(m_pattern(i),m_center(j),distype);
            if(distance>tempdis)
                distance=tempdis;
                index=j;
            end
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(m_pattern(i).category==index)
            m_pattern(i).distance=distance;
        else
            oldindex=m_pattern(i).category;
            m_pattern(i).category=index;
            m_pattern(i).distance=distance;
            if(oldindex~=-1)
                m_center(oldindex)=CalCenter(m_center(oldindex),m_pattern,patternnum);
            end
            m_center(index)=CalCenter(m_center(index),m_pattern,patternnum);
            change=1;
        end
    end
end