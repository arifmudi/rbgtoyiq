clc; clear;

%%% proses merubah warna RGB (Red, Green dan Blue) menjadi YIQ

%%% created by: Arif Mudi Priyatno 
%%% https://github.com/arifmudi

%% membaca gambar
gambar = imread('gambardepan.png');

%% pemisahan channel
R = gambar(:,:,1);
G = gambar(:,:,2);
B = gambar(:,:,3);

%% konversi uint8 menjadi double
R = double(R);
G = double(G);
B = double(B);

%% konversi RGB ke [0-1]
if max(max(R)) > 1.0 || max(max(G)) > 1.0 || max(max(B)) > 1.0
   R = R / 255;
   G = G / 255;
   B = B /255;
end

[tinggi, lebar] = size(R);
for m=1: tinggi
    for n=1: lebar
        Y(m,n) = 0.299 * R(m,n) + 0.587 * G(m,n) + 0.114 * B(m,n);
        I(m,n) = 0.596 * R(m,n) - 0.274 * G(m,n) - 0.322 * B(m,n);
        Q(m,n) = 0.211 * R(m,n) - 0.523 * G(m,n) + 0.312 * B(m,n);
    end
end

%% merubah range 0-1 menjadi 0-255
Y = Y * 255;
I = I * 255;
Q = Q * 255;

Y = uint8(Y);
I = uint8(I);
Q = uint8(Q);

%% menggabungkan 3 channel menjadi 1
YIQ = cat(3,Y,I,Q);

save YIQ.mat YIQ;