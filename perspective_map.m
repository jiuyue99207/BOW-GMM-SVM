function perspective_map()
figure;
%global num;
%%%此处需要修改
I=imread('D:\航拍资料\数据集图片\0001.png');
line=I;
imshow(line);
unimap=containers.Map;
unimap('location')=[];
unimap('num')=0;
%unimap('location')=cat(1,unimap('location'),a)
save('D:\\航拍资料\\数据集图片\\0001.mat','unimap')

set(gcf,'WindowButtonDownFcn',@ButttonDownFcn)

h2 = uicontrol('style','text','Position',[30 15 100 30],'string','此处显示选中点的坐标');


% 回调函数
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

unimap= load('D:\航拍资料\数据集图片\0001.mat');%此处需要修改
unimap=unimap.unimap;%将contaner赋给变量得到的是一个sturct，导致读取进来是一个,因此需要这一步，

unimap('location')=cat(1,unimap('location'),b); 
unimap('num')=unimap('num')+1;
save('D:\\航拍资料\\数据集图片\\0001.mat','unimap');

set(findobj('style','text'),'String',strcat('x:',num2str(b(1,1)),'  y:',num2str(b(1,2))));