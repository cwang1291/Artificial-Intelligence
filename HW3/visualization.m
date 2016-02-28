indexi=1;
indexj=1;
output=zeros(51);
for i=-5:0.2:5
    for j=-5:0.2:5
        a1=0.3*i-0.1*j+0.5;
        b1=1.716*tanh(2/3*a1);
        c1=-0.4*i+1*j-0.5;
        d1=1.716*tanh(2/3*c1);
        e1=-2*b1+0.5*d1+1;
        f1=1.716*tanh(2/3*e1);
        output(indexi,indexj)=f1;
        indexj=indexj+1;
        if f>=0
            scatter(i,j,'x','g');
            hold on;
        else
            scatter(i,j,'o','r');
            hold on;
        end
    end
    indexi=indexi+1;
    indexj=1;
end



