function [YUV]=fun1
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

RGB=imread('White.bmp');
%White.bmp��һ��640*480�Ŀ�ͼ��
red=zeros(640,480);
%����һ����ά����red��������R��ֵ��

a=textread('a.txt','%s')';
%��ȡ16���Ƶ�r.txt�ļ��е����ݷŵ�a�С�
b=hex2dec(a);
%16����ת��Ϊ10���ơ�
c=uint8(b);
%0-255����ֵ����unit8��ʽ���в���
for i=1:640
    for j=1:480
      m=480*(i-1)+j;
      red(i,j)=c(m);
    end
end
%red��ά���鸳ֵ
d=textread('g.txt','%s')';
e=hex2dec(d);
f=uint8(e);
green=zeros(640,480);
for x=1:640
    for y=1:480
        z=480*(x-1)+y;
        green(x,y)=f(z);
    end
end
g=textread('b.txt','%s')';
h=hex2dec(g);
k=uint8(h);
blue=zeros(640,480);
for o=1:640
    for p=1:480
        q=480*(o-1)+p;
        blue(o,p)=k(q);
    end
end
RGB(:,:,1)=red;
RGB(:,:,2)=green;
RGB(:,:,3)=blue;
end

