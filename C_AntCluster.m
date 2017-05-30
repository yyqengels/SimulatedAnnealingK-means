function [m_pattern]=C_AntCluster(m_pattern,patternNum,dtype)
%        disType=DisSelDlg();
disType=dtype;
m_min=inf;
m_max=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp1=zeros(patternNum-1,patternNum);
for i=1:patternNum-1
    for j=i+1:patternNum
        temp1(i,j)=GetDistance(m_pattern(i),m_pattern(j),disType);
    end
end
for i=1:patternNum-1
    temp2((i*patternNum-(1+(i-1)*2+(i-1)*(i-2)/2)-(patternNum-i-1)):(i*patternNum-(1+(i-1)*2+(i-1)*(i-2)/2)))=temp1(i,(i+1):patternNum);
end
temp3=sort(temp2);   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=temp3(2)+(temp3(patternNum*(patternNum-1)/2-1)-temp3(2))/2;
counter=1;
a=1;
b=1;
pc=0.8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:patternNum
    m_center(i).index=i;
    m_pattern(i).category=i;
    m_center(i).feature=m_pattern(i).feature;
    m_center(i).patternNum=1;
end
centerNum=patternNum;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tao=zeros(patternNum,patternNum);
h=ones(patternNum,patternNum);
distance=ones(patternNum,patternNum);
p=zeros(patternNum,patternNum);
temp=zeros(1,centerNum);
while(counter<100&&centerNum~=1)
    %%%%%%%%%%%
    for i=1:centerNum-1
        temp(i)=0;
        for j=i+1:centerNum
            distance(i,j)=GetDistance(m_center(i),m_center(j),disType);
            if(distance(i,j)<r)
                tao(i,j)=1;
            else
                tao(i,j)=0;
            end
            h(i,j)=1;
            temp(i)=temp(i)+(tao(i,j)^a)*(h(i,j)^b);
        end
    end
    flag=1;
    for i=1:centerNum-1
        for j=i+1:centerNum
            if(temp(i)~=0)
                p(i,j)=(tao(i,j)^a)*(h(i,j)^b)/temp(i);
            else
                p(i,j)=0;
            end
            if(p(i,j)>pc)
                pi=i;
                pj=j;
                flag=0;
                break;
            end
        end
        if(flag==0)
            break;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(flag==0)
        for i=1:patternNum
            if(m_pattern(i).category==pj)
                m_pattern(i).category=pi;
            elseif(m_pattern(i).category>pj)
                m_pattern(i).category=m_pattern(i).category-1;
            end
        end
        centerNum=centerNum-1;
    else
        break;
    end
    %%%%%%%%%%%%%%%%%%%
    for i=1:centerNum
        m_center(i)=CalCenter(m_center(i),m_pattern,patternNum);
    end
end