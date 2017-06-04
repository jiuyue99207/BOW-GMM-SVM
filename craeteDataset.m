%本脚本调用featureFV生成所需要的训练数据集和测试数据集
%fvs 返回的是一个矩阵
%@parameter:imgAdress是如：'F:\Patch\测试的数据集\测试密度五\Tdensity5'的图片路径;imgSave;如‘F:\FLYpic\LBP\Tden5Fvs‘这样的存储地址
%@parameter:imgNum是在该类别下的图片的数目;cellSize:是每个patch下cell边长的大小,。
%@parameter:cellNumb：每个patch中的cell的个数;gmmCenter:是训练GMM模型是需要的聚类中心的数目
%@function:本函数根据特征矩阵，混合训练得到高斯混合模型的clusters，根据得到的clusters得到最后的Fisher Vector
%@override的参数：imgAdress,imgSave,
%(1)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\Gmm5';
imgSave='F:\FLYpic\SRP\den5Fvs';
%%airport = dir(strcat(imgAdress,'*.jpg'));
%%imgNum=length(airport);
imgNum=1397;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(2)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\Gmm4';
imgSave='F:\FLYpic\SRP\den4Fvs';
imgNum=1519;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(3)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\Gmm3';
imgSave='F:\FLYpic\SRP\den3Fvs';
imgNum=1972;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(4)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\Gmm2';
imgSave='F:\FLYpic\SRP\den2Fvs';
imgNum=812;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(5)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\Gmm1';
imgSave='F:\FLYpic\SRP\den1Fvs';
imgNum=1918;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(6)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\TGmm5';
imgSave='F:\FLYpic\SRP\Tden5Fvs';
imgNum=212;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(7)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\TGmm4';
imgSave='F:\FLYpic\SRP\Tden4Fvs';
imgNum=294;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(8)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\TGmm3';
imgSave='F:\FLYpic\SRP\Tden3Fvs';
imgNum=215;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(9)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\TGmm2';
imgSave='F:\FLYpic\SRP\Tden2Fvs';
imgNum=169;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%(10)********************************************************************
clc
clear all
imgAdress='F:\FLYpic\SRP\TGmm1';
imgSave='F:\FLYpic\SRP\Tden1Fvs';
imgNum=466;
cellSize=25;
gmmCenter=5;
featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter);
%********************************************************************
