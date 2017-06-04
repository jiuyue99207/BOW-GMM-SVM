%���ú�����ÿ��Patch�ֳ�cells,��ÿ��cell��ȡ�����õ�ÿ��patch����������
%fvs ���ص���һ������
%@parameter:imgAdress���磺'F:\Patch\���Ե����ݼ�\�����ܶ���\Tdensity5'��ͼƬ·��;imgSave;�确F:\FLYpic\LBP\Tden5Fvs�������Ĵ洢��ַ
%@parameter:imgNum���ڸ�����µ�ͼƬ����Ŀ;patchSize:��ÿ��patch��cell�Ĵ�С��
%@parameter:cellNumb��ÿ��patch�е�cell�ĸ���;gmmCenter:��ѵ��GMMģ������Ҫ�ľ������ĵ���Ŀ
%@function:�����������������󣬻��ѵ���õ���˹���ģ�͵�clusters�����ݵõ���clusters�õ�����Fisher Vector
%@�ǲ�����ѵ��GMM��ʱ���ǵ��� ��


function fvs=featureFV(imgAdress,imgSave,imgNum,cellSize,gmmCenter)

feaGmm=cell2mat(struct2cell(load(imgAdress)));
[means,covariances,priors]=vl_gmm(feaGmm,gmmCenter);
%save('F:\FLYpic\Tden5Gmm','feaGmm');%�м䲽���GMM�������Բ��ô洢�� **load('F:\FLYpic\Tden5Gmm')**
%����ÿ����������ݣ�����fisher vector
fvs=[];
cellAllNumb=(100/cellSize)^2;
 for i=1:1:imgNum
    n_start=1+(i-1)*cellAllNumb;
    n_end=i*cellAllNumb;
   
    enc=vl_fisher(feaGmm(:,n_start:n_end),means,covariances,priors);
    fvs=cat(2,fvs,enc);
%fisher vector ��2*M*Kά��,����M�Ǿ�������ģ�M=5,k��ÿ��������ά��k=58,����enc=2*5*58=580
 end

save(imgSave,'fvs');
%enc=vl_fisher(features,means,covariances,priors,Normalized);
end