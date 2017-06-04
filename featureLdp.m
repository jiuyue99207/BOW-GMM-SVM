%@auther lijiawen �ļ�����ʱ��2016/9/14
%@function featureLdp ������������ȡLdp����
%@parameter Output:�����cell��cellSize:�޸�ÿ��patch��cell�Ĵ�С
%unimaptest�����ĸ�ά��ƴ��һ��Ľ��
%@parameter:A��1,2,3,4ά�ֱ��Ƕ�Ӧ��0,45,90,135�Ƕȵ�һ��΢��
function unimapLdp=featureLdp(Output,cellSize)
%��������
%clc 
%clear all
%Output=imread('F:\Patch\��һ��patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%��ȡ�ļ�
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
%��ÿһ�������ϵ�ldp����ͳ�ƣ�һ���Ƿ�Ϊ�ĸ����֣��ֱ���0,45,90,135
for i=2:cellSize-3
for  j=2:cellSize-3
 unilbp1=uniformLdp(A(:,:,1),i,j);
    unilbp1=int2str(unilbp1);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap1.isKey(unilbp1);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap1(unilbp1)=unimap1(unilbp1)+1;
    end


%45�����ϵ�����

 unilbp2=uniformLdp(A(:,:,2),i,j);
    unilbp2=int2str(unilbp2);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap2.isKey(unilbp2);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap2(unilbp2)=unimap2(unilbp2)+1;
    end


%90�����ϵ�����

 unilbp3=uniformLdp(A(:,:,3),i,j);
    unilbp3=int2str(unilbp3);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap3.isKey(unilbp3);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap3(unilbp3)=unimap3(unilbp3)+1;
    end


%135�����ϵ���������ͳ��ֱ��ͼ�ļ���

 unilbp4=uniformLdp(A(:,:,4),i,j);
    unilbp4=int2str(unilbp4);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap4.isKey(unilbp4);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
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
%����Ҫ���Ĵ�ѭ��̫���ˣ�Ӧ�ø�Ϊ��һ��ѭ������
end
