%% Part 1
%% a

%% b
x = [1,1,2,1,2,2,1,1]';
b = [4,2.4,-1.6];
a = [1,-0.5,0.6];

y1 = direct(b,a,x)                  % direct-form-I
y2 = tran(b,a,x)
[y2,vout2] = tran(b,a,x)            % tranposed with vin = [0;0]
[y3,vout3] = tran(b,a,x,[0;1])      % tranposed with vin = [0;1]
[y, vout] = filter(b,a,x,[0;0])     % filter function

% error between direct.m and filter function
error_y1 = norm(y'-y1)              
% error between tran.m and filter function
error_y2 = norm(y'-y2)
error_vout1 = norm(vout(1)-vout2(1,9))
error_vout2 = norm(vout(2)-vout2(2,9))

%% c
fprintf(' n      x        y           v1         v2\n');
fprintf('-------------------------------------------------\n');
fprintf(' %d   %4d   %9.5f    %9.6f    %9.6f \n',[(0:7)' x((1:8)') y((1:8)') vout2((1:2:16)') vout2((2:2:16)')]');
fprintf(' %d      -        -       %9.6f    %9.6f \n',8, vout2(17), vout2(18));

%% Part 2
%% a
fs = 200;
fo = 4;
wo = 2*pi*fo/fs;
R1 = 0.980;
R2 = 0.995;

b1 = [1 -2*cos(wo) 1];
a1 = [1 -2*R1*cos(wo) R1^2];

b2 = [1 -2*cos(wo) 1];
a2 = [1 -2*R2*cos(wo) R2^2];

fprintf('filter 1\n');
fprintf('------------------------------------\n');
fprintf('b = [ %5.6f  %5.6f   %5.6f ]\n',b1(1),b1(2),b1(3));
fprintf('a = [ %5.6f  %5.6f   %5.6f ]\n\n',a1(1),a1(2),a1(3));

fprintf('filter 2\n');
fprintf('------------------------------------\n');
fprintf('b = [ %5.6f  %5.6f   %5.6f ]\n',b2(1),b2(2),b2(3));
fprintf('a = [ %5.6f  %5.6f   %5.6f ]\n\n',a2(1),a2(2),a2(3));

fresp = @(b,a,w) polyval(flip(b),exp(-j*w))./polyval(flip(a),exp(-j*w));
mag = @(b,a,w) abs(fresp(b,a,w));

f = 0:0.01:10;
w = 2*pi*f/fs;
plot(f,mag(b1,a1,w));
title('Magnitude Response of Filter 1');
xlabel('f (Hz)');
ylabel('|H(f)|');
axis([0 10 0 1.1]);

figure
plot(f,mag(b2,a2,w));
title('Magnitude Response of Filter 2');
xlabel('f (Hz)');
ylabel('|H(f)|');
axis([0 10 0 1.1]);
grid on

%% b
% Approximate 3-dB of filter 1
D_fa1 = fs/pi*(1-R1);
f_La1 = fo-0.5*D_fa1;
f_Ra1 = fo+0.5*D_fa1;
% Approximate 3-dB of filter 2
D_fa2 = fs/pi*(1-R2);
f_La2 = fo-0.5*D_fa2;
f_Ra2 = fo+0.5*D_fa2;

% Exact 3-dB of Filter 1
F1 = @(f) mag(b1,a1,2*pi*f/fs)-1/sqrt(2);
f_Le1 = fzero(F1,f_La1);
f_Re1 = fzero(F1,f_Ra1);
% Exact 3-dB of Filter 2
F2 = @(f) mag(b2,a2,2*pi*f/fs)-1/sqrt(2);
f_Le2 = fzero(F2,f_La1);
f_Re2 = fzero(F2,f_Ra1);

% Error
error1 = 100*(abs(f_Le1-f_La1)+abs(f_Re1-f_Ra1))/(abs(f_Le1)+abs(f_Re1));
error2 = 100*(abs(f_Le2-f_La2)+abs(f_Re2-f_Ra2))/(abs(f_Le2)+abs(f_Re2));

fprintf('Filter 1    exact  approx\n');
fprintf('--------------------------\n');
fprintf('  fL   =   %5.4f  %5.4f\n',f_Le1,f_La1);
fprintf('  fR   =   %5.4f  %5.4f\n',f_Re1,f_Ra1);
fprintf('--------------------------\n');
fprintf('percent error = %3.4f%% \n\n',error1);

fprintf('Filter 2    exact  approx\n');
fprintf('--------------------------\n');
fprintf('  fL   =   %5.4f  %5.4f\n',f_Le2,f_La2);
fprintf('  fR   =   %5.4f  %5.4f\n',f_Re2,f_Ra2);
fprintf('--------------------------\n');
fprintf('percent error = %3.4f%% \n\n',error2);

%% c
f0 = 4;
f1 = 2;
f2 = 6;
fs = 200;
% interval of sampling is 1/200 = 0.005
t1 = 0:0.005:3.995;
t2 = 4:0.005:7.995;
t3 = 8:0.005:12;
t = 0:0.005:12;

x = @(f,t) cos(2*pi*f*t);
x1 = x(f1,t1);
x2 = x(f0,t2);
x3 = x(f2,t3);
x = [x1 x2 x3];

plot(t,x)
title('Input Signal');
xlabel('t (sec)');
ylabel('x(t)');
axis([0 12 -2 2]);
grid on

% Filter Signal
y1 = tran(b1,a1,x);
figure
plot(t,y1)
title('Notch Filter Output, R = 0.980');
xlabel('t (sec)');
ylabel('y(t)');
axis([0 12 -2 2]);
grid on

y2 = tran(b2,a2,x);
figure
plot(t,y2)
title('Notch Filter Output, R = 0.995');
xlabel('t (sec)');
ylabel('y(t)');
axis([0 12 -2 2]);
grid on

% Effective Time
t1 = 1/fs*(log(0.01)/log(R1))
t2 = 1/fs*(log(0.01)/log(R2))

fprintf('  R        t_eff\n');
fprintf('--------------------\n');
fprintf('0.980   %4.4f (sec)\n',t1);
fprintf('0.995   %4.4f (sec)\n',t2);

%% Graph
f = 0:0.01:10;
w = 2*pi*f/fs;

F1_0 = mag(b1,a1,2*pi*f0/fs);
F1_1 = mag(b1,a1,2*pi*f1/fs);
F1_2 = mag(b1,a1,2*pi*f2/fs);

F2_0 = mag(b2,a2,2*pi*f0/fs);
F2_1 = mag(b2,a2,2*pi*f1/fs);
F2_2 = mag(b2,a2,2*pi*f2/fs);

figure
plot(f,mag(b1,a1,w),[f1,f0,f2],[F1_1,F1_0,F1_2],'bo',[f_Le1,f_Re1],[mag(b1,a1,2*pi*f_Le1/fs),mag(b1,a1,2*pi*f_Re1/fs)],'r-o');
title('Magnitude Response of Filter 1');
xlabel('f (Hz)');
ylabel('|H(f)|');
legend('magnitude','f_1,f_0,f_2','3-dB width');
axis([0 10 0 1.1]);

figure
plot(f,mag(b2,a2,w),[f1,f0,f2],[F2_1,F2_0,F2_2],'bo',[f_Le2,f_Re2],[mag(b2,a2,2*pi*f_Le2/fs),mag(b2,a2,2*pi*f_Re2/fs)],'r-o');
title('Magnitude Response of Filter 2');
xlabel('f (Hz)');
ylabel('|H(f)|');
legend('magnitude','f_1,f_0,f_2','3-dB width');
axis([0 10 0 1.1]);
grid on
