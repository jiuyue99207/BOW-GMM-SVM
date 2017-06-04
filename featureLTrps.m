%@auther Lijiawen,����ʱ��2016.9.14
%@function featureLTrps������ȡͼ���LTrps������
%@parameter Output:�����cell,cellsize:ÿ��patch��cell�Ĵ�С
%@parameter uniLtrps��LTrps�ķ���������uniM��LTrps�ķ�������
function unimapLTrps=featureLTrps(Output,cellSize)
%ȷ��ÿ����ķ����Ժ�ģֵ��С
%clear  all
%Output=imread('F:\Patch\��һ��patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%��ȡ�ļ�
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
%���һ��256ά������
unimap1=unimap;
unimap2=unimap;
unimap3=unimap;
unimap4=unimap;

%���ÿ�����lTrps��ֵ
for i=2:cellSize-3
    for j=2:cellSize-3
     [uniltrps11,uniltrps12,uniltrps13,uniM]=uniformLTrps(D,M,i,j); 
     uniltrps11=int2str(uniltrps11);
     uniltrps12=int2str(uniltrps12);
     uniltrps13=int2str(uniltrps13);
    uniM=int2str(uniM);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap1.isKey(uniltrps11);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap1(uniltrps11)=unimap1(uniltrps11)+1;
    end
    ifkey= unimap2.isKey(uniltrps12);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap2(uniltrps12)=unimap2(uniltrps12)+1;
    end
    ifkey= unimap3.isKey(uniltrps13);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap3(uniltrps13)=unimap3(uniltrps13)+1;
    end
    ifkey= unimap4.isKey(uniM);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap4(uniM)=unimap4(uniM)+1;
    end
        
    end
end
%�����е�������ͳ�ƽ��ƴ����һ��

matrix1=cell2mat(unimap1.values);
matrix2=cell2mat(unimap2.values);
matrix3=cell2mat(unimap3.values);
matrix4=cell2mat(unimap4.values);
matrix=cat(2,matrix,matrix1);
matrix=cat(2,matrix,matrix2);
matrix=cat(2,matrix,matrix3);
matrix=cat(2,matrix,matrix4);
%�õ��������
unimapLTrps=containers.Map;
for i=1:1024
    j=int2str(i);
    unimapLTrps(j)=matrix(1,i);
end
    
end
