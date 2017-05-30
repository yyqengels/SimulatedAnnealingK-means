for i=1:1210
    xaxis(i)=i;
end
 stockcode={'Stock 000001','Stock 000002','Stock 000009','Stock 000027','Stock 000039'...
     'Stock 000046','Stock 000059','Stock 000061','Stock 000069','Stock 000100'};

catego=1;

for i=1:10
subplot(5,2,i);%%%%%%
plot(xaxis,stock(:,o(catego,i)),'k')%%%%%%
axis([0 1210 -10 10])%%%%
title(stockcode(i))
end
