%@auther Lijiawen,修改于时间2016.9.18
%@functionfeatureSrp用于提取图像的srp特征。
%@parameter
%Output:输入的cell,cellsize:每个patch中cell的大小,downDimen:高维的srp特征利用rp完成降维度。
%@parameter unimapSrp是Srp的特征，特征和lbp一样，将为后变成了x*1的列向量
function unimapSrp=featureSrp(Output,cellSize,downDimen,lowerMatrix);
%Input=imread('F:\Patch\第一列patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%读取文件
%Output=rgb2gray(Input);
%[m,n]=size(Output);
X=[];
%算法中的58是对应到标准LBP模式的原因，具体是多少还应当继续检验
%对每一个中心点做radical_diff的特征提取，论文中这样描述“extracts small subpatches in a
%sliding-window manner“
%每一个patch的向量维度是，似乎是不是太大了一点啊，所以这个
%调用matrixRp函数生成一个降维矩阵从而获得每个patch的sort特征
cellSize=cellSize-2
for i=3:cellSize
    for j=3:cellSize
      sortSubpatch=radicalSrp(Output,i,j);
      X=cat(1,X,sortSubpatch);  
    end
end
%这个应该是固定的而不是随机变动的吧。这个需要更改。
X=double(X);
y=floor(lowerMatrix*X);
unimapSrp=containers.Map;
for i=1:downDimen
    j=int2str(i);
    unimapSrp(j)=y(i,1);
end
end
%save('F:\\FLYpic\\file1.mat',y);% load('F:\FLYpic\fikename')