function  piccover = LSB( piccover,pic2ray,M,N,m,n ) %piccover���棬pic2ray��ֵͼ��M,N�������У�m��n��ֵͼ����
if(m<=M&&n<=N)
    for i=1:m
        for j=1:n
            if pic2ray(i,j)==1&&mod(piccover(i,j),2)==1
                continue;
            elseif pic2ray(i,j)==1&&mod(piccover(i,j),2)==0
                piccover(i,j)=piccover(i,j)+1;
            elseif pic2ray(i,j)==0&&mod(piccover(i,j),2)==0
                continue;
            elseif pic2ray(i,j)==0 && mod(piccover(i,j),2)==1
                piccover(i,j)=piccover(i,j)-1;
            end
        end         
    end
else
    fprintf('��������С������')
end
end

