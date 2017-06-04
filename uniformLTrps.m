%@auther lijiawen 
%@function 该函数用于计算每个像素点的LTrps值，用于做最后的统计。
function [uniltrps12,uniltrps13,uniltrps14,uniM]=uniformLTrps(x,M,y,z)
%第一部分计算的是常规的部分
%1
if double(x(y,z))==double(x(y,z+1))
        valu(1)=0;
else valu(1)=double(x(y,z+1));
end
%2
    if double(x(y,z))==double(x(y-1,z+1))
        valu(2)=0;
else valu(2)=double(x(y-1,z+1));
    end
%3
    if double(x(y,z))==double(x(y-1,z))

    else valu(3)=double(x(y-1,z));
    end
%4
    if double(x(y,z))==double(x(y-1,z-1))
        valu(4)=0;
else valu(4)=double(x(y-1,z-1));
    end
%5
    if double(x(y,z))==double(x(y,z-1))
        valu(5)=0;
else valu(5)=double(x(y,z-1));
    end
%6
        if double(x(y,z))==double(x(y+1,z-1))
        valu(6)=0;
else valu(6)=double(x(y+1,z-1));
        end
%7
        if double(x(y,z))==double(x(y+1,z))
        valu(7)=0;
else valu(7)=double(x(y+1,z));
        end
%8
        if double(x(y,z))==double(x(y+1,z+1))
        valu(8)=0;
else valu(8)=double(x(y+1,z+1));
        end
%第二部分计算的是模值的部分        

    if double(M(y,z))<=double(M(y,z+1))
        valuM(1)=1;
   else valuM(1)=0;
    end
%2
    if double(M(y,z))<=double(M(y-1,z+1))
        valuM(2)=1;
else valuM(2)=0;
    end
%3
    if double(M(y,z))<=double(M(y-1,z))
       valuM(3)=1;
else valuM(3)=0;
    end
%4
    if double(M(y,z))<=double(M(y-1,z-1))
       valuM(4)=1;
else valuM(4)=0;
    end
%5
    if double(M(y,z))<=double(M(y,z-1))
       valuM(5)=1;
else valuM(5)=0;
    end
%6
        if double(M(y,z))<=double(M(y+1,z-1))
        valuM(6)=1;
else valuM(6)=0;
        end
%7
        if double(M(y,z))<=double(M(y+1,z))
        valuM(7)=1;
else valuM(7)=0;
        end
%8
        if double(M(y,z))<=double(M(y+1,z+1))
        valuM(8)=1;
else valuM(8)=0;
        end
        uniM=0;
        uniltrps12=0;
        uniltrps13=0;
         uniltrps14=0;
    for i=1:8
    numM=valuM(i)*(2^(i-1));
    uniM=uniM+numM;
    if valu(i)==2
       num1=(2^(i-1));
    uniltrps12=uniltrps12+num1;
    elseif valu(i)==3
        num2=(2^(i-1));
    uniltrps13=uniltrps13+num2;
    elseif valu(i)==4
         num3=(2^(i-1));
    uniltrps14=uniltrps14+num3;
    end
    end

 end