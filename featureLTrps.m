%@auther Lijiawen,创建时间2016.9.14
%@function featureLTrps用于提取图像的LTrps特征。
%@parameter Output:输入的cell,cellsize:每个patch中cell的大小
%@parameter uniLtrps是LTrps的方向特征，uniM是LTrps的幅度特征
function unimapLTrps=featureLTrps(Output,cellSize)
%确定每个点的方向性和模值大小
%clear  all
%Output=imread('F:\Patch\第一列patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%读取文件
%Output=rgb2gray(Output);
%cellSize=10;
unimap=containers.Map;
for i=1:256
    j=int2str(i);
    unimap(j)=0;
end

matrix=[];
for i=2:cellSize-1
    for j=2:cellSize-1
        directionH=double(Output(i,j+1))-double(Output(i,j));
        directionV=double(Output(i-1,j))-double(Output(i,j));
        M(i,j)=double(sqrt(directionH^2+directionV^2));
     if directionH>=0&&directionV>=0
            D(i,j)=1;
        elseif directionH<0&&directionV>=0
            D(i,j)=2;
        elseif directionH>=0&&directionV<0
            D(i,j)=3;
        elseif directionH<0&&directionV<0
            D(i,j)=4;
    end
    end
end
%获得一个256维的容器
unimap1=unimap;
unimap2=unimap;
unimap3=unimap;
unimap4=unimap;

%获得每个点的lTrps的值
for i=2:cellSize-3
    for j=2:cellSize-3
     [uniltrps11,uniltrps12,uniltrps13,uniM]=uniformLTrps(D,M,i,j); 
     uniltrps11=int2str(uniltrps11);
     uniltrps12=int2str(uniltrps12);
     uniltrps13=int2str(uniltrps13);
    uniM=int2str(uniM);%改变数值为char,因为map的键是char格式的
    ifkey= unimap1.isKey(uniltrps11);
    if  ifkey==1%判断是否存在该键值
        unimap1(uniltrps11)=unimap1(uniltrps11)+1;
    end
    ifkey= unimap2.isKey(uniltrps12);
    if  ifkey==1%判断是否存在该键值
        unimap2(uniltrps12)=unimap2(uniltrps12)+1;
    end
    ifkey= unimap3.isKey(uniltrps13);
    if  ifkey==1%判断是否存在该键值
        unimap3(uniltrps13)=unimap3(uniltrps13)+1;
    end
    ifkey= unimap4.isKey(uniM);
    if  ifkey==1%判断是否存在该键值
        unimap4(uniM)=unimap4(uniM)+1;
    end
        
    end
end
%将所有的特征的统计结果拼接在一起

matrix1=cell2mat(unimap1.values);
matrix2=cell2mat(unimap2.values);
matrix3=cell2mat(unimap3.values);
matrix4=cell2mat(unimap4.values);
matrix=cat(2,matrix,matrix1);
matrix=cat(2,matrix,matrix2);
matrix=cat(2,matrix,matrix3);
matrix=cat(2,matrix,matrix4);
%得到特征结果
unimapLTrps=containers.Map;
for i=1:1024
    j=int2str(i);
    unimapLTrps(j)=matrix(1,i);
end
    
end
