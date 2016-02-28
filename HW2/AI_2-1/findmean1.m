function m1=findmean1(n)
sigma1=[3 0 0;0 5 0; 0 0 2];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[0;0;0];
end
rn=randn(3,n);
trn=A*rn+u1;
for i=1:3
    m1(i)=sum(trn(i,:))/n;
end
m1=m1';

end