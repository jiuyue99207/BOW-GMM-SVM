function inter= doubInter( a,b,x1,x2,x3,x4 ,type)
%�˺������ڼ���˫���Բ�ֵ
%   �˴���ʾ��ϸ˵��
switch type
    case 1
        u=b*cosd(a);
        v=b*sind(a);
        inter=(1-u)*(1-v)*double(x1)+(1-v)*u*double(x2)+(1-u)*v*double(x3)+u*v*double(x4);
    case 2
        u=a;
        v=b;
        inter=(1-u)*(1-v)*double(x1)+(1-v)*u*double(x2)+(1-u)*v*double(x3)+u*v*double(x4);
end
end

