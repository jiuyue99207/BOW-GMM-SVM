%@function:�������ڶ�patch���зֿ���ÿ�������ά����
%@parameter:Output�Ǻ�����patch������룬cellNumb��ÿ�����е�cell��Ŀ
function out=cellCreate(Input,cellSize)
%Input=imread('F:\Patch\��һ��patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%��ȡ�ļ�
cellNumb=100/cellSize;
for i=1:cellNumb
    for j=1:cellNumb
       m_start=1+(i-1)*cellSize;
       m_end=i*cellSize;
       n_start=1+(j-1)*cellSize;
       n_end=j*cellSize;
       dimen=(i-1)*cellNumb+j;
    out(:,:,dimen)=Input(m_start:m_end, n_start: n_end);
    end
end

end