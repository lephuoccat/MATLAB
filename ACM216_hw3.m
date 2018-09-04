clear
theta = 1.5;
T = 0.0001;
% Import pixel from image file
picture = imread('cows.jpg');
pixel = double(rgb2gray(picture));
[A,B] = size(pixel);
shaped_pixel = double(reshape(pixel,A*B,1));
pixel_average = double(mean(shaped_pixel));
% Resize the image
for i = 1:A
    for j = 1:B
        if (pixel(i,j) - pixel_average) > 0
            pixel(i,j) = 1;
        else
            pixel(i,j) = -1;
        end
    end
end
figure(1)
imshow(pixel)
C = pixel;
% Image Segmentation
iteration = 10^6;
while (iteration > 0)
    iteration = iteration - 1;
    i = randi(A);
    j = randi(B);
    U = rand;
    if (i == 1 && j == 1)
        G = -(C(i+1,j+1)) - 2*theta;
    elseif (i == 1 && j == B)
        G = -(C(i+1,j-1)) - 2*theta; 
    elseif (i == A && j == 1)
        G = -(C(i-1,j+1)) - 2*theta;  
    elseif (i == A && j == B)
        G = -(C(i-1,j-1)) - 2*theta;
    elseif (i == A)
        G = -(C(i-1,j+1) + C(i-1,j-1)) - 2*theta; 
    elseif (i == 1)
        G = -(C(i+1,j+1) + C(i+1,j-1)) - 2*theta;  
    elseif (j == B)
        G = -(C(i-1,j-1) + C(i+1,j-1)) - 2*theta;
    elseif (j == 1)
        G = -(C(i+1,j+1) + C(i-1,j+1)) - 2*theta;  
    else
        G = -(C(i+1,j+1) + C(i-1,j+1) + C(i-1,j-1) + C(i+1,j-1)) - 2*theta;  
    end
    %Gibbs Law
    if (U < min(1,exp((1/T)*G*C(i,j))))
        C(i,j) = -C(i,j);
    end    
end
% Print the pixel
figure(2)
imshow(C)
