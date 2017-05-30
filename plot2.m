function plot2
maxindex=max(CATEG)
for i=1:maxindex
indexx=transpose(find(CATEG==i));
lengs=length(indexx);
for j=1:lengs
o(i,j)=indexx(j);
end
end
out4=xlsread('D:\Shanghai University of Finance and Economics\THESIS\DATA\bufuquan\thesis0.xlsx');
out5=xlsread('D:\Shanghai University of Finance and Economics\THESIS\DATA\cluster101.xlsx');
for i=1:1211
    henzhou(i)=i;
end
for i=1:maxindex
subplot(5,2,i)
indexxxx=randperm(length(find(o(i,:)~=0)),1);
plot(henzhou,out4(:,o(i,indexxxx)),'k')
axis('tight')
title(['Category ',num2str(i),' Stock Code ',num2str(out5(i,indexxxx))]);
end

indexxxxx=randperm(length(find(o(5,:)~=0)),3);
for i=1:3
subplot(3,1,i)
plot(henzhou,out4(:,o(5,indexxxxx(i))),'k')
axis('tight')
title(['Category',num2str(5),' Stock Code ',num2str(out5(5,indexxxxx(i)))]);
end