function uninum= uniformLbp(x,y,z )
%uniformLbp �ú���������������ÿһ�����ص�λ�õ�lbpֵ
%value��ֵ��x�Ǵ���ľ���y�Ǿ�������꣬z�Ǿ����������
%��ʱ����ת�ļ���

valu(1)=double(x(y,z))-double(x(y,z+1));  %matlab�������Ǵ�1��ʼ�ģ��ܶ��������붼��0 ��ʼ��
valu(2)=double(x(y,z))-double(x(y-1,z+1));%matlabͼ������鶼��unit8��ʽ����û�и����ģ�����ת��Ϊdouble���
valu(3)=double(x(y,z))-double(x(y-1,z));
valu(4)=double(x(y,z))-double(x(y-1,z-1));
valu(5)=double(x(y,z))-double(x(y,z-1));
valu(6)=double(x(y,z))-double(x(y+1,z-1));
valu(7)=double(x(y,z))-double(x(y+1,z));
valu(8)=double(x(y,z))-double(x(y+1,z+1));
uninum=0;
for i=1:8
    if valu(i)>=0
        a=1;  
    else 
        a=0;
    end
    num=a*(2^(i-1));
    uninum=uninum+num;
end


end

