%@auther lijiawen ������2016.9.19
%@function textureFeature:��ȡÿ��patch������������
%�����ĺô��ǣ��ڲ��ı���Ҫ��patch������¿��Ը��õص���GMM�����ĵ�������Լ�ѵ����
%@parameter:imgAdress���磺'F:\Patch\���Ե����ݼ�\�����ܶ���\Tdensity5'��ͼƬ·��;imgSave;�确F:\FLYpic\LBP\Tden5Fvs������'F:\FLYpic\Tden5Gmm'
%@parameter:imgNum���ڸ�����µ�ͼƬ����Ŀ;patchSize:��ÿ��patch��cell�Ĵ�С��feaGmm��δ����ѵ����������������
%@param��type:������������������������type:1=Lbp;2=Ldp;3=Srp;4=LTrps;5=LOcPs
function feaGmm=textureFeature(imgAdress,imgSave,imgNum,cellSize,type,downDimen,lowerMatrix)
%imgAdress='F:\Patch\���Ե����ݼ�\�����ܶ�һ\Tdensity1';
%imgAdress='F:\Patch\���ķ���\�ܶ�һ\density1'
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
Input=imread(imgAdress);%��ȡ�ļ�
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
%��ȡunimap��ֵ���GMM��Ҫ�ľ����ʽ
point=unimap.values;
point=cell2mat(point);%pointӦ����һ����������Ȼ��ͨ����һ����ת��Ϊ������
point=point';
feaGmm=cat(2,feaGmm,point);
end
%�洢�����ݸ�ʽ��ӳ���Ҳ��58������µ�ÿһ�������ÿһ��С��cell�е�ͳ���������;ģʽ���ͣ�ֵ����ģʽ������
%z=strcat('F:\FLYpic\LBP\',imgName);
%save(z,'unimap');%'F:\FLYpic\'ע�����һ���ֺţ���������һ�������ĵ�ַ////��Ҫע����ǣ�
                 %1��Ҫ�����mat�ļ�Ҫд����׺��2��Ҫ����ı�����Ҫ�õ�������������
end
%[means,covariances,priors,ll,posterios]=vl_gmm(feaGmm,gmmCenter);
save(imgSave,'feaGmm');%�м䲽���GMM�������Բ��ô洢�� **load('F:\FLYpic\Tden5Gmm')**
end