indexi=1;
indexj=1;
output=zeros(51);
for i=-5:0.2:5
    for j=-5:0.2:5
        a=-0.5*i+1.5*j-1;
        b=1.716*tanh(2/3*a);
        c=1.5*i-0.5*j+1;
        d=1.716*tanh(2/3*c);
        e=-1*b+1*d+0.5;
        f=1.716*tanh(2/3*e);
        output(indexi,indexj)=f;
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



