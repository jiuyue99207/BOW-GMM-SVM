%创建于2016.8.20，用于对训练的样本和测试样本进行Normalization
%@parameter den1Fvs:每一个类别下的patch的fv
function train_feature=scaling(den1Fvs,den2Fvs,den3Fvs,den4Fvs,den5Fvs)
den1Fvs=den1Fvs.fvs';
den2Fvs=den2Fvs.fvs';
den3Fvs=den3Fvs.fvs';
den4Fvs=den4Fvs.fvs';
den5Fvs=den5Fvs.fvs';
train_feature=cat(1,den1Fvs,den2Fvs);
train_feature=cat(1,train_feature,den3Fvs);
train_feature=cat(1,train_feature,den4Fvs);
train_feature=cat(1,train_feature,den5Fvs);
[m,n]=size(train_feature);
for i=1:1:m
    Max=max(train_feature(i,:));
    Min=min(train_feature(i,:));
    Mean=sum(train_feature(i,:))/348;
    for j=1:1:n
     train_feature(i,j)=(train_feature(i,j)-Mean)/(Max-Min);  
    end
end


end