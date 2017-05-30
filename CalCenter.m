function [m_center_i]=CalCenter(m_center_i,m_pattern,patternnum)
temp=zeros(1,length(m_pattern(1).feature));
a=0;
for i=1:patternnum
    if(m_pattern(i).category==m_center_i.index)
        a=a+1;
        temp=temp+m_pattern(i).feature;
    end
end
m_center_i.patternnum=a;
if(a~=0)
    m_center_i.feature=temp/a;
else
    m_center_i.feature=temp;
end