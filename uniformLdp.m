%uniformLdp �ú���������������ÿһ�����ص�λ�õ�ldpֵ
%value��ֵ��x�Ǵ���ľ���,�ֱ��Ǿ���A�ĸ���ά�ȣ�y�Ǿ�������꣬z�Ǿ����������
%��ʱ����ת�ļ���
function uninum= uniformLdp(x,y,z )
s=x;
valu(1)=double(s(y,z))*double(s(y,z+1));  %matlab�������Ǵ�1��ʼ�ģ��ܶ��������붼��0 ��ʼ��
valu(2)=double(s(y,z))*double(s(y-1,z+1));%matlabͼ������鶼��unit8��ʽ����û�и����ģ�����ת��Ϊdouble���
valu(3)=double(s(y,z))*double(s(y-1,z));
valu(4)=double(s(y,z))*double(s(y-1,z-1));
valu(5)=double(s(y,z))*double(s(y,z-1));
valu(6)=double(s(y,z))*double(s(y+1,z-1));
valu(7)=double(s(y,z))*double(s(y+1,z));
valu(8)=double(s(y,z))*double(s(y+1,z+1));
uninum=0;
for i=1:8
    if valu(i)>0
        a=0;  
    else 
        a=1;
    end
    num=a*(2^(i-1));
    uninum=uninum+num;
end


end
