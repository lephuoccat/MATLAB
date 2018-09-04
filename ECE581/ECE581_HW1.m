clear
% a
% Define the image size
rows = 1024;                    
cols = 1024;
S = eye(rows, cols);            % create 1024x1024 diagonal matrix of 1
alpha = sqrt(4/1024);           % value of diagonal element to get E = 4
                                % alpha = 1/16
A = alpha.*S;                   % create image matrix A
E = sum(sum(A.^2));             % check the energy of the image
fprintf("Total signal energy: %d\n", E);
figure, imshow(A,[])            % display grayscale image
title('Noise-free Image');
xlabel('Row Pixel x');
ylabel('Column Pixel y');

% b
% Define the noise
noise = normrnd(0,1,[rows,cols]);
A_noise = A + noise;            % add noise to the signal A
figure, imshow(A_noise)         % display noisy image
title('Image with noise');
xlabel('Row x');
ylabel('Column y');
figure, imshow(noise)           % display noise
title('Noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
% Cannot see a straight line from the noise with E/variance = 4

% c
% E/variance = 4096
alpha = 2;                      % new alpha to increase E
A_new = alpha.*S;               % create new image A
E = sum(sum(A_new.^2));
fprintf("Total signal energy after modified E: %d\n", E);
A_new_noise = A_new + noise;    % add noise to the signal A_new
figure, imshow(A_new_noise)     % display
title('Amplified Image with noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');

% d
% E/variance = 1024
alpha = 1;                      % smaller alpha than part (c)
A_tilt = alpha.*S;              % create new image A_tilt
E = sum(sum(A_tilt.^2));
fprintf("Total signal energy after tilted: %d\n", E);
A_tilt_noise = A_tilt + noise;  % add noise to the signal A_tilt
figure, imshow(A_tilt_noise)    % display
title('Tilted Image with noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');

% e
% Define a square of size 32x32 in the center of 1024x1024 image
square = ones(32,32);           % a square 1024 points of 1
% zero padding to create 1024x1024 matrix with square matrix
A_square = padarray(square, [496, 496]);
E = sum(sum(A_square.^2));
fprintf("Total signal energy after changing shape: %d\n", E);
figure, imshow(A_square)        % display grayscale image
title('Noise-free Square Image');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
% Add noise to this signal
A_square_noise = A_square + noise;
figure, imshow(A_square_noise)  % display square image with noise
title('Square Image with noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
% It's capable to see the square from the noise that the same E/variance = 1024

% e2
A_rec = zeros(1024,1024);
A_rec(1:32,1:16) = 1;           % add a rectangle to top left corner
A_rec(992:1024,1008:1024) = 1;  % add a rectangle to bottom right corner
figure, imshow(A_rec)           % display grayscale image
title('Noise-free Rectangles Image');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
% Add noise to this signal
A_rec_noise = A_rec + noise;
figure, imshow(A_rec_noise)  % display square image with noise
title('Rectangles Image with noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');

% f
% Load image file
img = imread('ece-581-test-7.jpg');
img_d = im2double(img);         % convert image to double precision
img_gray = rgb2gray(img_d);     % convert RGB to grayscale
E_img = sum(sum(img_gray.^2));  % total energy of image
fprintf("Total signal energy of the image: %d\n", E_img);
figure, imshow(img_gray)        % display grayscale image       
title('Digital Image');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
% Add noise to the image
img_noise = img_gray + noise;   % add noise to the image
figure, imshow(img_noise)       % display image with noise
title('Digital Image with noise');
xlabel('Row Pixel x');
ylabel('Column Pixel y');
