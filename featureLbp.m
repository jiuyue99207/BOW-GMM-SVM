%@auther Lijiawen,����ʱ��2016.7.14
%@function featureLbp������ȡͼ���Lbp������
%@parameter Output:�����cell�Ĵ�С��cellSize:�޸�ÿ��patch��cell�Ĵ�С
function unimap=featureLbp(Output,cellSize)
%��������
%����һ��ӳ���
unimap=containers.Map;   
unimap('0')=0;unimap('1')=0;unimap('2')=0;unimap('3')=0;unimap('4')=0;
unimap('6')=0;unimap('7')=0;unimap('8')=0;unimap('12')=0;unimap('14')=0;
unimap('15')=0;unimap('16')=0;unimap('24')=0;unimap('28')=0;unimap('30')=0;
unimap('31')=0;unimap('32')=0;unimap('48')=0;unimap('56')=0';unimap('60')=0;
unimap('62')=0;unimap('63')=0;unimap('64')=0;unimap('96')=0';unimap('112')=0;
unimap('120')=0;unimap('124')=0;unimap('126')=0;unimap('127')=0;unimap('128')=0;
unimap('129')=0;unimap('131')=0;unimap('135')=0;unimap('143')=0;unimap('159')=0;
unimap('191')=0;unimap('192')=0;unimap('193')=0;unimap('195')=0;unimap('199')=0;
unimap('207')=0;unimap('223')=0;unimap('224')=0;unimap('225')=0;unimap('227')=0;
unimap('231')=0;unimap('239')=0;unimap('240')=0;unimap('241')=0;unimap('243')=0;
unimap('247')=0;unimap('248')=0;unimap('249')=0;unimap('251')=0;unimap('252')=0;
unimap('253')=0;unimap('254')=0;unimap('255')=0;
cellSize=cellSize-1;
for i=2:cellSize
   for j=2:cellSize
    unilbp=uniformLbp(Output,i,j);
    unilbp=int2str(unilbp);%�ı���ֵΪchar,��Ϊmap�ļ���char��ʽ��
    ifkey= unimap.isKey(unilbp);
    if  ifkey==1%�ж��Ƿ���ڸü�ֵ
        unimap(unilbp)=unimap(unilbp)+1;
    end
end
end

