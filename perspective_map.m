function perspective_map()
figure;
%global num;
%%%�˴���Ҫ�޸�
I=imread('D:\��������\���ݼ�ͼƬ\0001.png');
line=I;
imshow(line);
unimap=containers.Map;
unimap('location')=[];
unimap('num')=0;
%unimap('location')=cat(1,unimap('location'),a)
save('D:\\��������\\���ݼ�ͼƬ\\0001.mat','unimap')

set(gcf,'WindowButtonDownFcn',@ButttonDownFcn)

h2 = uicontrol('style','text','Position',[30 15 100 30],'string','�˴���ʾѡ�е������');


% �ص�����
function ButttonDownFcn(src,event)
a = get(gca,'CurrentPoint');
for i=1:2
   ai=a(1,i);
if ceil(ai)-ai>ai-floor(ai)
    b(1,i)=floor(ai);
else
    b(1,i)=ceil(ai);
end
end
x = b(1,1);
y = b(1,2);

hold on;
plot(gca,x,y,'r.')

unimap= load('D:\��������\���ݼ�ͼƬ\0001.mat');%�˴���Ҫ�޸�
unimap=unimap.unimap;%��contaner���������õ�����һ��sturct�����¶�ȡ������һ��,�����Ҫ��һ����

unimap('location')=cat(1,unimap('location'),b); 
unimap('num')=unimap('num')+1;
save('D:\\��������\\���ݼ�ͼƬ\\0001.mat','unimap');

set(findobj('style','text'),'String',strcat('x:',num2str(b(1,1)),'  y:',num2str(b(1,2))));