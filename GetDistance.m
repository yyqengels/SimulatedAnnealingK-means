function [result]=GetDistance(pattern1,pattern2,distype)
result=0;
switch(distype)
    case 1  %eu
    result=sum((pattern1.feature(:)-pattern2.feature(:)).^2);
    result=sqrt(result);

    case 2 %DTW
        result=dtw(pattern1,pattern2);
        
    case 3%eu non-structure
        result=sum((pattern1(:)-pattern2(:)).^2);
    result=sqrt(result);
end