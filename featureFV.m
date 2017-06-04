%调用函数将每个Patch分成cells,对每个cell求取特征得到每个patch的特征矩阵
%fvs 返回的是一个矩阵
%@parameter:imgAdress是如：'F:\Patch\测试的数据集\测试密度五\Tdensity5'的图片路径;imgSave;如‘F:\FLYpic\LBP\Tden5Fvs‘这样的存储地址
%@parameter:imgNum是在该类别下的图片的数目;patchSize:是每个patch下cell的大小。
%@parameter:cellNumb：每个patch中的cell的个数;gmmCenter:是训练GMM模型是需要的聚类中心的数目
%@function:本函数根据特征矩阵，混合训练得到高斯混合模型的clusters，根据得到的clusters得到最后的Fisher Vector
%@是不是在训练GMM的时候考虑点数 啊


function fvs=featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter)

feaGmm=cell2mat(struct2cell(load(imgAdress)));
[means,covariances,priors]=vl_gmm(feaGmm,gmmCenter);
%save('F:\FLYpic\Tden5Gmm','feaGmm');%中间步骤的GMM特征可以不用存储， **load('F:\FLYpic\Tden5Gmm')**
%加载每个分类的数据，生成fisher vector
fvs=[];
cellAllNumb=(100/cellSize)^2;
 for i=1:1:imgNum
    n_start=1+(i-1)*cellAllNumb;
    n_end=i*cellAllNumb;
   
    enc=vl_fisher(feaGmm(:,n_start:n_end),means,covariances,priors);
    fvs=cat(2,fvs,enc);
%fisher vector 是2*M*K维的,其中M是聚类的中心，M=5,k是每个特征的维度k=58,所以enc=2*5*58=580
 end

save(imgSave,'fvs');
%enc=vl_fisher(features,means,covariances,priors,Normalized);
end