function class2 = anotherclassify(n)
X=[0,1,0.8,8,-1,0;0,6,3,-8,1,5;0,-3,-1.5,8,-1,0];
for i=1:6
    m1=findmean1(n);
    cov1=findcov1(n);
    p1=((((2*3.1416)^1.5)*(det(cov1))^0.5)^-1)*exp(-0.5*(X(:,i)-m1)'*inv(cov1)*(X(:,i)-m1));

    m2=findmean2(n);
    cov2=findcov2(n);
    p2=((((2*3.1416)^1.5)*(det(cov2))^0.5)^-1)*exp(-0.5*(X(:,i)-m2)'*inv(cov2)*(X(:,i)-m2));

    m3=findmean3(n);
    cov3=findcov3(n);
    p3=((((2*3.1416)^1.5)*(det(cov3))^0.5)^-1)*exp(-0.5*(X(:,i)-m3)'*inv(cov3)*(X(:,i)-m3));

    p=[p1,p2,3*p3];
    [~,P(i)]=max(p);
end
class2=P;

