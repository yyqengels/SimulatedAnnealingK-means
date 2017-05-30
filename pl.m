function pl
PFSweigaijin=[7.4962    7.8138   8.2722    7.5674    7.1144    8.2954    6.7771    7.9761   7.4962   7.8138];
PFSgaijin=[8.3178 8.3178 8.3032 8.3178 8.3178 8.3178 8.3178 8.3178 8.3178 8.3032];
for i=1:length(PFSgaijin)
    x(i)=i;
end
plot(x,PFSweigaijin,'-k',x,PFSgaijin,'-ok')
legend('Unmodified K-means','Modified K-means')