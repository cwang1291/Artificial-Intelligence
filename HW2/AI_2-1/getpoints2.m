function trn=get20points2(n)
sigma1=[1 0 0;0 4 1; 0 1 6];
A=chol(sigma1);
for i=1:n
    u1(:,i)=[1;5;-3];
end
rn=randn(3,n);
trn=A*rn+u1;
scatter3(trn(1,:),trn(2,:),trn(3,:),'g');
end

