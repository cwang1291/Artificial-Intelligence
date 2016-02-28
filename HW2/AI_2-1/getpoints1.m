function trn=get20points1(n)
sigma1=[3 0 0;0 5 0; 0 0 2];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[0;0;0];
end
rn=randn(3,n);
trn=A*rn+u1;
scatter3(trn(1,:),trn(2,:),trn(3,:),'r');
end

