piccover=double((imread('1.bmp')));%����ͼ��
pic2ray=double(im2bw(imread('2.bmp')));%������Ϣ

%��ȡ����ͼ��Ĵ�С
[M,N] = size(piccover);
[m,n] = size(pic2ray);
%fprintf('M=%f',M);
%fprintf('N=%f',N);
%fprintf('m=%f',m);
%fprintf('n=%f',n);

subplot(2,3,1),imshow(piccover,[]); %չʾ�����������Ϣ��ͼ��ĶԱ�
title('����ǰ');

pichide=LSB(piccover,pic2ray,M,N,m,n);%M,NΪ�������У�m��nΪ��ֵͼ���У�����ֵͼ��д��������
subplot(2,3,2),imshow(pichide,[]);%��ʾ���غ�ͼ��
title('���غ�');

subplot(2,3,3),imshow(pic2ray,[]);%��ʾ�����ص���Ϣ
title('������Ϣ');

for i=1:M
     for j=1:N
      tmp_qian(i,j) = bitget(piccover(i,j),1);%bitget�������Ƚ�X(i,j)���Ҷ�ֵ�ֽ�Ϊ�����ƴ���Ȼ��ȡ��1λ
     end
end
 subplot(2,3,4),imshow(tmp_qian,[]);%��ʾ����ǰ�����λƽ��
 title('����ǰ�����λƽ��');

 for i=1:M
     for j=1:N
      tmp_hou(i,j) = bitget(pichide(i,j),1);%bitget�������Ƚ�X(i,j)���Ҷ�ֵ�ֽ�Ϊ�����ƴ���Ȼ��ȡ��1λ
     end
end
 subplot(2,3,5),imshow(tmp_hou,[]);%��ʾ���غ�����λƽ��
 title('���غ�����λƽ��');

picjie=inLSB(pichide,m,n);%��ȡ��������Ϣ
subplot(2,3,6),imshow(picjie,[]);%��ʾ��ȡ��Ϣ
%imshow(picjie,[]);
title('��ȡ��Ϣ');


