%@auther Lijiawen,�޸���ʱ��2016.9.18
%@functionfeatureSrp������ȡͼ���srp������
%@parameter
%Output:�����cell,cellsize:ÿ��patch��cell�Ĵ�С,downDimen:��ά��srp��������rp��ɽ�ά�ȡ�
%@parameter unimapSrp��Srp��������������lbpһ������Ϊ������x*1��������
function unimapSrp=featureSrp(Output,cellSize,downDimen,lowerMatrix);
%Input=imread('F:\Patch\��һ��patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%��ȡ�ļ�
%Output=rgb2gray(Input);
%[m,n]=size(Output);
X=[];
%�㷨�е�58�Ƕ�Ӧ����׼LBPģʽ��ԭ�򣬾����Ƕ��ٻ�Ӧ����������
%��ÿһ�����ĵ���radical_diff��������ȡ������������������extracts small subpatches in a
%sliding-window manner��
%ÿһ��patch������ά���ǣ��ƺ��ǲ���̫����һ�㰡���������
%����matrixRp��������һ����ά����Ӷ����ÿ��patch��sort����
cellSize=cellSize-2
for i=3:cellSize
    for j=3:cellSize
      sortSubpatch=radicalSrp(Output,i,j);
      X=cat(1,X,sortSubpatch);  
    end
end
%���Ӧ���ǹ̶��Ķ���������䶯�İɡ������Ҫ���ġ�
X=double(X);
y=floor(lowerMatrix*X);
unimapSrp=containers.Map;
for i=1:downDimen
    j=int2str(i);
    unimapSrp(j)=y(i,1);
end
end
%save('F:\\FLYpic\\file1.mat',y);% load('F:\FLYpic\fikename')