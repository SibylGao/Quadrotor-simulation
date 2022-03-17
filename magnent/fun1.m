function [YUV]=fun1
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

RGB=imread('White.bmp');
%White.bmp是一幅640*480的空图像。
red=zeros(640,480);
%建立一个二维数组red用来保存R的值。

a=textread('a.txt','%s')';
%读取16进制的r.txt文件中的数据放到a中。
b=hex2dec(a);
%16进制转化为10进制。
c=uint8(b);
%0-255的数值保存unit8格式进行操作
for i=1:640
    for j=1:480
      m=480*(i-1)+j;
      red(i,j)=c(m);
    end
end
%red二维数组赋值
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

