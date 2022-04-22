function p=StgPrb(x)
%对数据进行分析 对一个二维数组进行分析，数组里面的值在0-255 之间
n=sum(hist(x,[0:255]),2);
h2i=n([3:2:255]);
h2is=(h2i+n([4:2:256]))/2;
filter=(h2is~=0);
k=sum(filter);
idx=zeros(1,k);
for i=1:127
    if filter(i)==1
        idx(sum(filter(1:i)))=i;
    end
end
%compute statistics
r=sum(((h2i(idx)-h2is(idx)) .^2)./(h2is(idx)));
%compute probility 
p=1-chi2cdf(r,k-1);
% p = chi2cdf(r , k); 

