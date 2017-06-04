%创建于2016.8.18，SVM的训练，运用的是libsvm
%读取训练文件和标注的文件
clc 
clear all
den1Fvs=load('F:\FLYpic\LBP\den1Fvs');
den2Fvs=load('F:\FLYpic\LBP\den2Fvs');
den3Fvs=load('F:\FLYpic\LBP\den3Fvs');
den4Fvs=load('F:\FLYpic\LBP\den4Fvs');
den5Fvs=load('F:\FLYpic\LBP\den5Fvs');
train_label=[];
train_label(1:1918,1)=1;
train_label(1919:2730,1)=2;
train_label(2731:4702,1)=3;
train_label(4703:6221,1)=4;
train_label(6222:7618,1)=5;
%对训练集进行scaling处理,
%Mean_Normolization
train_feature=scaling(den1Fvs,den2Fvs,den3Fvs,den4Fvs,den5Fvs);
%对训练集进行训练
model=svmtrain2(train_label,train_feature, '-c 4 -g 0.07 ');
Tden1Fvs=load('F:\FLYpic\LBP\Tden1Fvs');
Tden2Fvs=load('F:\FLYpic\LBP\Tden2Fvs');
Tden3Fvs=load('F:\FLYpic\LBP\Tden3Fvs');
Tden4Fvs=load('F:\FLYpic\LBP\Tden4Fvs');
Tden5Fvs=load('F:\FLYpic\LBP\Tden5Fvs');
Ttrain_label(1:466,1)=1;
Ttrain_label(467:635,1)=2;
Ttrain_label(636:850,1)=3;
Ttrain_label(851:1144,1)=4;
Ttrain_label(1145:1356,1)=5;
setRan=rand(1356,1);
Ttrain_feature=scaling(Tden1Fvs,Tden2Fvs,Tden3Fvs,Tden4Fvs,Tden5Fvs);
[predicted_label,accuracy,~]=svmpredict2(setRan,Ttrain_feature,model);
sum=0;
for i=1:1:1356
    if predicted_label(i,1)==Ttrain_label(i,1)
        sum=sum+1;
    end 
end

