clear all;
[fn,pn]=uigetfile({'*.jpg','JPEG files(*.jpg)';'*.bmp','BMP files(*.bmp'},'Select file to hide');
name=strcat(pn,fn);
t=imread(name);
I=t(1:512,1:512);
sz=size(I);
for k=1;3
    %据隐写率大小生成秘密信息，隐写率为 0.3 0.5 0.7三种
    rt=0.3+0.2*(k-1);
    row=round(sz(1)*rt);
    col=round(sz(2)*rt);
    msg=randsrc(row,col,[0 1;0.5 0.5]);
    %LSB信息隐写
    stg=I;
    stg(1:row,1:col)=bitset(stg(1:row,1:col),1,msg);
    imwrite(stg,strcat(pn,strcat(sprintf('stg_%d_',floor(100*rt)),fn)),'bmp');
    i=1;
    for rto=0.1:0.01:1
        row=round(sz(1)*rto);
        col=round(sz(2)*rto);
        p(k,i)=StgPrb(stg(1:row,1:col));
        i=i+1;
    end
end
