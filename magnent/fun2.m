function [RGB] fun2( YUV )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
close all;
clear
fid = fopen('akiyo_qcif.yuv','r');
row=640;col=480;%����ߴ��С��CIFͼ���С��YUV����(352*288)
frames=4; % total=300
Y=zeros(row,col,frames);
U=zeros(row/2,col/2,frames);
V=zeros(row/2,col/2,frames);
UU=zeros(row,col,frames);%����ɨ��ʱ�ı���
VV=zeros(row,col,frames);

for frame=1:frames
[Y(:,:,frame),count] = fread(fid,[row,col],'uchar');
[U(:,:,frame),count1]=fread(fid,[row/2,col/2],'uchar');
[V(:,:,frame),count2]=fread(fid,[row/2,col/2],'uchar');

UU(1:2:row-1,1:2:col-1,frame)=U(:,:,frame);%����
UU(1:2:row-1,2:2:col,frame)=U(:,:,frame);%��ż
UU(2:2:row,1:2:col-1,frame)=U(:,:,frame);%ż��
UU(2:2:row,2:2:col,frame)=U(:,:,frame);%żż

VV(1:2:row-1,1:2:col-1,frame)=V(:,:,frame);
VV(1:2:row-1,2:2:col,frame)=V(:,:,frame);
VV(2:2:row,1:2:col-1,frame)=V(:,:,frame);
VV(2:2:row,2:2:col,frame)=V(:,:,frame);

R = Y + 1.140 * (VV-128 );
G = Y + 0.395 * (UU-128 ) - 0.581 *(VV-128);
B = Y + 2.032 *(UU-128);

for i=1:row %���0��255
for j=1:col
if R(i,j,frame)<0
R(i,j,frame)=0;
end
if R(i,j,frame)>255
R(i,j,frame)=255;
end
if G(i,j,frame)<0
G(i,j,frame)=0;
end
if G(i,j,frame)>255
G(i,j,frame)=255;
end
if B(i,j,frame)<0
B(i,j,frame)=0;
end
if B(i,j,frame)>255
B(i,j,frame)=255;
end
end
end
R=R/255;G=G/255;B=B/255;
images(:,:,1)=R(:,:,frame)';
images(:,:,2)=G(:,:,frame)';
images(:,:,3)=B(:,:,frame)';
figure,imshow(images)
imwrite(images,['F:\',num2str(frame), '.jpg'])


end

