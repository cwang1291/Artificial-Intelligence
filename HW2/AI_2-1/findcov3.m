function cov3=findcov3(n)
sigma1=[10 0 0;0 10 0; 0 0 10];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[0;0;0];
end
rn=randn(3,n);
trn=A*rn+u1;
for i=1:3
    m3(i)=sum(trn(i,:))/n;
end
m3=m3';
for i=1:n
    D(:,i)=trn(:,i)-m3;
end
cov3=(D*D')/n;
end