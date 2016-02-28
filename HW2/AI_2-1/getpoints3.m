function trn=get20points3(n)
sigma1=[10 0 0;0 10 0; 0 0 10];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[0;0;0];
end
rn=randn(3,n);
trn=A*rn+u1;
scatter3(trn(1,:),trn(2,:),trn(3,:),'b');
end

