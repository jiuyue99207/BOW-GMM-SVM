%%create ground density map from labeled data
%clear;
%load('perspective_roi.mat');
%load('mall_gt.mat');

m=480;n=640;
m=m/4;
n=n/4;
mask = imresize(roi.mask,0.25);
for i=1:2000
   gt = frame{i}.loc;
   gt = gt/4;
   d_map = zeros(m,n);
   for j=1:size(gt,1)
       ksize = ceil(25/sqrt(pMapN(floor(gt(j,2)),1)));
       ksize = max(ksize,7);
       ksize = min(ksize,25);
       radius = ceil(ksize/2);
       sigma = ksize/2.5;
       h = fspecial('gaussian',ksize,sigma);
       x_ = max(1,floor(gt(j,1)));
       y_ = max(1,floor(gt(j,2)));
       
       if (x_-radius+1<1)
              for ra = 0:radius-x_-1
                   h(:,end-ra) = h(:,end-ra)+h(:,1);
                   h(:,1)=[];
              end
       end  
       if (y_-radius+1<1)
           for ra = 0:radius-y_-1
               h(end-ra,:) = h(end-ra,:)+h(1,:);
               h(1,:)=[];
           end
       end
       if (x_+ksize-radius>n)   
           for ra = 0:x_+ksize-radius-n-1
               h (:,1+ra) = h(:,1+ra)+h(:,end);
               h(:,end) = [];
           end
       end
       if(y_+ksize-radius>m)    
            for ra = 0:y_+ksize-radius-m-1
                h (1+ra,:) = h(1+ra,:)+h(end,:);
                h(end,:) = [];
            end
       end             
          d_map(max(y_-radius+1,1):min(y_+ksize-radius,m),max(x_-radius+1,1):min(x_+ksize-radius,n))...
             = d_map(max(y_-radius+1,1):min(y_+ksize-radius,m),max(x_-radius+1,1):min(x_+ksize-radius,n))...
              + h;
   end
   
   d_map = d_map.*mask;
   d_map_name = ['D:\��������\����dataset\mall_dataset\density2\frame'  num2str(i) '.mat'];
   save(d_map_name,'d_map');
end
       