function mainfile()
n=20;
getpoints1(n);
hold on;
getpoints2(n);
hold on;
getpoints3(n);
mean1=findmean1(n)
mean2=findmean2(n)
mean3=findmean3(n)
cov1=findcov1(n)
cov2=findcov2(n)
cov3=findcov3(n)
class1=classify(n)
class2=anotherclassify(n)
end

