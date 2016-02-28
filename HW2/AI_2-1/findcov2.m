function cov2=findcov2(n)
sigma1=[1 0 0;0 4 1; 0 1 6];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[1;5;-3];
end
rn=randn(3,n);
trn=A*rn+u1;
for i=1:3
    m2(i)=sum(trn(i,:))/n;
end
m2=m2';
for i=1:n
    D(:,i)=trn(:,i)-m2;
end
cov2=(D*D')/n;
end