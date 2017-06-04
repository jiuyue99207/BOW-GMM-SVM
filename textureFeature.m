%@auther lijiawen 创建于2016.9.19
%@function textureFeature:提取每个patch的纹理特征。
%这样的好处是，在不改变主要的patch的情况下可以更好地调整GMM的中心点参数，以及训练。
%@parameter:imgAdress是如：'F:\Patch\测试的数据集\测试密度五\Tdensity5'的图片路径;imgSave;如‘F:\FLYpic\LBP\Tden5Fvs‘或者'F:\FLYpic\Tden5Gmm'
%@parameter:imgNum是在该类别下的图片的数目;patchSize:是每个patch下cell的大小。feaGmm是未经过训练的纹理特征矩阵
%@param：type:代表的是用哪种纹理的特征。type:1=Lbp;2=Ldp;3=Srp;4=LTrps;5=LOcPs
function feaGmm=textureFeature(imgAdress,imgSave,imgNum,cellSize,type,downDimen,lowerMatrix)
%imgAdress='F:\Patch\测试的数据集\测试密度一\Tdensity1';
%imgAdress='F:\Patch\最后的分类\密度一\density1'
%imgSave='F:\FLYpic\SRP\Gmm1';
%imgSave='F:\FLYpic\LTRPS\Gmm5';
%imgSave='F:\FLYpic\LBP\Gmm5';
%imgNum=1;
%cellSize=25;
%type=2;
a1=imgAdress;
a2='.jpg';
b1='(';
b2=')';
cellAllNumb=(100/cellSize)^2;
feaGmm=[];
for i=1:1:imgNum 
    imgNumb=num2str(i);
    imgAdress=strcat(a1,b1);
    imgAdress=strcat(imgAdress,imgNumb);
    imgAdress=strcat(imgAdress,b2);
    imgAdress=strcat(imgAdress,a2);
    %imgName=strcat('density1',b1);
    %imgName=strcat(imgName,imgNumb);
    %imgName=strcat(imgName,b2);
Input=imread(imgAdress);%读取文件
Output=rgb2gray(Input);
[m,n]=size(Output);
cellpatch=cellCreate(Output,cellSize);
for j=1:cellAllNumb
  cellOutput=cellpatch(:,:,j);
 switch type
     case 1
unimap=featureLbp(cellOutput,cellSize);
     case 2 
unimap=featureLdp(cellOutput,cellSize);
     case 3 
unimap=featureSrp(cellOutput,cellSize,downDimen,lowerMatrix);
     case 4 
unimap=featureLTrps(cellOutput,cellSize);
     case 5
unimap=featureLOcps(cellOutput,cellSize);
 end
%读取unimap的值组成GMM需要的矩阵格式
point=unimap.values;
point=cell2mat(point);%point应该是一个行向量，然后通过下一步的转置为列向量
point=point';
feaGmm=cat(2,feaGmm,point);
end
%存储的数据格式是映射表，也即58种情况下的每一种情况在每一个小的cell中的统计情况。键;模式类型，值：该模式的数量
%z=strcat('F:\FLYpic\LBP\',imgName);
%save(z,'unimap');%'F:\FLYpic\'注意最后一个分号，这样才是一个完整的地址////需要注意的是，
                 %1，要保存的mat文件要写出后缀，2，要保存的变量名要用单引号引起来。
end
%[means,covariances,priors,ll,posterios]=vl_gmm(feaGmm,gmmCenter);
save(imgSave,'feaGmm');%中间步骤的GMM特征可以不用存储， **load('F:\FLYpic\Tden5Gmm')**
end