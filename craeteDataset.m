%���ű�����featureFV��������Ҫ��ѵ�����ݼ��Ͳ������ݼ�
%fvs ���ص���һ������
%@parameter:imgAdress���磺'F:\Patch\���Ե����ݼ�\�����ܶ���\Tdensity5'��ͼƬ·��;imgSave;�确F:\FLYpic\LBP\Tden5Fvs�������Ĵ洢��ַ
%@parameter:imgNum���ڸ�����µ�ͼƬ����Ŀ;cellSize:��ÿ��patch��cell�߳��Ĵ�С,��
%@parameter:cellNumb��ÿ��patch�е�cell�ĸ���;gmmCenter:��ѵ��GMMģ������Ҫ�ľ������ĵ���Ŀ
%@function:�����������������󣬻��ѵ���õ���˹���ģ�͵�clusters�����ݵõ���clusters�õ�����Fisher Vector
%@override�Ĳ�����imgAdress,imgSave,
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
