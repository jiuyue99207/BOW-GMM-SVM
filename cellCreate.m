%@function:函数用于对patch进行分块获得每个块的三维数组
%@parameter:Output是函数的patch块的输入，cellNumb是每个块中的cell数目
function out=cellCreate(Input,cellSize)
%Input=imread('F:\Patch\第一列patch\vertical (1).jpg\vertical1_1_18 (18).jpg');%读取文件
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