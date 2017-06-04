%uniformLdp 该函数的作用是生成每一个像素点位置的ldp值
%value是值，x是传入的矩阵,分别是矩阵A的各个维度，y是矩阵横坐标，z是矩阵的纵坐标
%逆时针旋转的计算
function uninum= uniformLdp(x,y,z )
s=x;
valu(1)=double(s(y,z))*double(s(y,z+1));  %matlab的数组是从1开始的，很多其他代码都是0 开始的
valu(2)=double(s(y,z))*double(s(y-1,z+1));%matlab图像的数组都是unit8格式，是没有负数的，可以转化为double解决
valu(3)=double(s(y,z))*double(s(y-1,z));
valu(4)=double(s(y,z))*double(s(y-1,z-1));
valu(5)=double(s(y,z))*double(s(y,z-1));
valu(6)=double(s(y,z))*double(s(y+1,z-1));
valu(7)=double(s(y,z))*double(s(y+1,z));
valu(8)=double(s(y,z))*double(s(y+1,z+1));
uninum=0;
for i=1:8
    if valu(i)>0
        a=0;  
    else 
        a=1;
    end
    num=a*(2^(i-1));
    uninum=uninum+num;
end


end
