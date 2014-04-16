function [ M,a ] = SimpleModel(  )
%SIMPLEMODEL Summary of this function goes here
%   Detailed explanation goes here

%% parameters
a = zeros(1,25); % mm; measured from paper
q = zeros(1,1);
k = zeros(1,6);

a(1:3) = [14 30.5 44.5];
a(4:7) = [14 83.5 128 36];
a(8) = 22.5;
a(9:10) = [12 39]; % double?
a(11:12) = [20 48];
a(13:17) = [28.5 20*2 43 34*2 20]; % double 14,16,17?
% 14 and 16 should be doubled
a(18:20) = [11 31 28]; % double 19,20?
a(21:22) = [11 14];
a(23:25) = [8.5 28 16];

q(1) = 135;

k(1) = 0.3; % 0.3-0.35
k(2) = 0.05; % 0.05-0.07
k(3) = 0.75; % 0.75-0.8
k(4) = 0.47; % 0.47-0.51
k(5) = 0.4; % about 0.4
k(6) = 0.3; % about 0.3

%% points: column 3-by-1 vectors
M = zeros(3,15);

M(:,1)  = [0.0;     a(18);          q(1)];
M(:,2)  = [a(9);    a(18)+k(1)*(a(8)^2+a(1)^2)^0.5;   ...
                                    q(1)-k(2)*a(1)];
M(:,3)  = [0.0;     a(18)+(a(8)^2+a(1)^2)^0.5; ...
                                    q(1)-3];
M(:,5)  = [a(24);   0.0;            q(1)-a(2)];
M(:,6)  = [a(19);   a(23);          q(1)-a(7)];
M(:,4)  = [a(10);   a(23)+a(25);    q(1)-a(4)];% depend on M_6
M(:,7)  = [a(20);   a(23)+(a(11)^2-(a(20)^2-a(19)^2))^0.5;  ...
                                    q(1)-a(7)];
M(:,8)  = [a(17);   (a(12)^2-(a(3)^2-a(2)^2)-(a(17)^2-a(24)^2))^0.5; ...
                                    q(1)-a(3)];
M(:,8)  = [a(17);   (a(12)^2-(a(3)-a(2))^2)^0.5; ...
                                    q(1)-a(3)];% double a(24)
M(:,9)  = [0.0;     a(21);          q(1)-a(5)];
M(:,10) = [0.0;     a(21)+a(13);    q(1)-a(5)];
M(:,11) = [0.0;     a(21)-a(22);    q(1)-a(6)];
M(:,12) = [0.0;     a(21)-a(22)+a(15);  ...
                                    q(1)-a(6)];
M(:,13) = [0.5*a(14);   M(2,9)+k(5)*(M(2,8)-M(2,9)); ...
                                    q(1)-a(5)];
M(:,14) = [0.5*a(16);   M(2,9)+k(5)*(M(2,8)-M(2,9)); ...
                                    q(1)-a(6)];
M(:,15) = [0.0;     a(21)-a(22)+a(15);  ...
                                    (a(6)-a(5))*k(6)+(q(1)-a(6))];
plot3(M(1,:),M(2,:),M(3,:),':ok');
%% point-controls

%% lines



end

