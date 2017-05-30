function thesis
stock=xlsread('D:\Shanghai University of Finance and Economics\THESIS\DATA\bufuquan\thesis1.xlsx');
[stockrow,stockcolumn]=size(stock);
for i=1:stockcolumn
    h(i)=adftest(stock(:,i));
end
for i=1:stockcolumn
    jbh(i)=jbtest(stock(:,i));
end
tstock=stock';
[Out1, Out2, Out3] = fastica(tstock,'interactivePCA','gui','stabilization','on');
[icarow,icacolumn]=size(Out2);
for i=1:icarow
    m_pattern(i).feature=Out2(i,:);
end
patternnum=icarow;
for centernum=5:-1:4
    [m_pattern]=monikjunzhi(m_pattern,patternnum,2,centernum,20,20,0.9);
    for i=1:patternnum
        CATEG(i)=getfield(m_pattern(i),'category');
        T=CATEG';
    end
    PFS(centernum)=pseudoF(Out2,T,3)
end