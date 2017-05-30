function [PFS]=pseudoF(x,c,type)
%c is the result of the matlab function clusterdata
%c NOTICE:column vector
%return the pseudo F statistics 
%type is the type of distance
%x ROW VECTOR!!!!!!!!!!
G=max(c);
n=length(c);
modix=x;
[row,column]=size(x);
isnanvalue=isnan(x);
%convert NaN into 0
for i=1:row
    for j=1:column
        if(isnanvalue(i,j)==1)
            modix(i,j)=0;
        end
    end
end
%aggaverage is a row vector
aggaverage=mean(modix);
%calculate  total cluster
T=0;
for i=1:row
    T=T+GetDistance(modix(i,:),aggaverage,type);
end
%calculate in cluster
PG=0;
for i=1:G
    index=find(c==i);
        lengthindex=length(index);
        inneraverage=zeros(1,column);
        for j=1:lengthindex
            inneraverage=inneraverage+modix(index(j),:);
        end
        inneraverage=inneraverage./lengthindex;
        Wk=0;
        for j=1:lengthindex
            Wk=Wk+GetDistance(modix(index(j),:),inneraverage,type);
        end
     PG=PG+Wk;
end
%calculate pseudo F statistics
PFS=((T-PG)/(G-1))/(PG/(n-G));