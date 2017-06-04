%@auther lijiawen 文件创建时间2016/9/14
%@function featureLdp 本函数用于提取Ldp特征
%@parameter Output:输入的cell，cellSize:修改每个patch中cell的大小
%unimaptest返回四个维度拼接一起的结果
%@parameter:A的1,2,3,4维分别是对应的0,45,90,135角度的一阶微分
function unimapLdp=featureLdp(Output,cellSize)
%计算特征
%clc 
%clear all
%Output=imread('F:\Patch\第一列patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%读取文件
%cellSize=100;
unimap=containers.Map;
for i=1:256
    j=num2str(i);
    unimap(j)=0;
end
unimap1=unimap;
unimap2=unimap;
unimap3=unimap;
unimap4=unimap;

for i=2:cellSize-1
   for j=2:cellSize-1
 A(i-1,j-1,1)=double(Output(i,j))-double(Output(i,j+1));
 A(i-1,j-1,2)=double(Output(i,j))-double(Output(i-1,j+1));
 A(i-1,j-1,3)=double(Output(i,j))-double(Output(i-1,j));
 A(i-1,j-1,4)=double(Output(i,j))-double(Output(i-1,j-1));
    end
end
%对每一个方向上的ldp进行统计，一共是分为四个部分，分别是0,45,90,135
for i=2:cellSize-3
for  j=2:cellSize-3
 unilbp1=uniformLdp(A(:,:,1),i,j);
    unilbp1=int2str(unilbp1);%改变数值为char,因为map的键是char格式的
    ifkey= unimap1.isKey(unilbp1);
    if  ifkey==1%判断是否存在该键值
        unimap1(unilbp1)=unimap1(unilbp1)+1;
    end


%45方向上的特征

 unilbp2=uniformLdp(A(:,:,2),i,j);
    unilbp2=int2str(unilbp2);%改变数值为char,因为map的键是char格式的
    ifkey= unimap2.isKey(unilbp2);
    if  ifkey==1%判断是否存在该键值
        unimap2(unilbp2)=unimap2(unilbp2)+1;
    end


%90方向上的特征

 unilbp3=uniformLdp(A(:,:,3),i,j);
    unilbp3=int2str(unilbp3);%改变数值为char,因为map的键是char格式的
    ifkey= unimap3.isKey(unilbp3);
    if  ifkey==1%判断是否存在该键值
        unimap3(unilbp3)=unimap3(unilbp3)+1;
    end


%135方向上的特征进行统计直方图的计算

 unilbp4=uniformLdp(A(:,:,4),i,j);
    unilbp4=int2str(unilbp4);%改变数值为char,因为map的键是char格式的
    ifkey= unimap4.isKey(unilbp4);
    if  ifkey==1%判断是否存在该键值
        unimap4(unilbp4)=unimap4(unilbp4)+1;
    end
end
end
matrix=[];
matrix1=cell2mat(unimap1.values);
matrix=cat(2,matrix,matrix1);
matrix2=cell2mat(unimap2.values);
matrix=cat(2,matrix,matrix2);
matrix3=cell2mat(unimap3.values);
matrix=cat(2,matrix,matrix3);
matrix4=cell2mat(unimap4.values);
matrix=cat(2,matrix,matrix4);
unimapLdp=containers.Mapcontainer

for i=1:1024
    j=int2str(i);
    unimapLdp(j)=matrix(1,i);
end
%这里要做四次循环太慢了，应该改为做一次循环即可
end
