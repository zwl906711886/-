[fn,pn]=uigetfile({'*.jpg','JPEG files(*.jpg)';'*.bmp','BMP files(*.bmp)'},'Select file to hide');
name=strcat(pn,fn);
I=(imread(name)); %对灰度图像进行隐藏
sz=size(I);
% generate msg
rt=1;%隐写率为 100%
row=round(sz(1) *rt);
col=round(sz(2) *rt);
msg=randsrc(row,col,[0 1;0.5 0.5]);
% LSB hide
stg=I;
stg(1:row,1:col)=bitset(stg(1:row,1:col),1,msg);
nI=sum(hist(I,[0:255]),2)';
nS=sum(hist(stg,[0:255]),2)';
x=[80:99];
figure;
stem(x,nI(81:100));figure;
stem(x,nS(81:100));

