clear
N = 40;
% generate coordinates
x = rand(N,2);
x((0.25*N+1):(0.5*N),2) = -x((0.25*N+1):(0.5*N),2);
x((0.5*N+1):(0.75*N),:) = -x((0.5*N+1):(0.75*N),:);
x((0.75*N+1):N,1) = -x((0.75*N+1):N,1);

% calculate the distances
distance = zeros(N,N);
for i = 1:1:N
    for j = 1:1:N
        distance(i,j) = sqrt(sum(x(i,:)-x(j,:)).^2);
    end
end

C = 8;
path = zeros(N+1,1);
index = zeros(N,1);
k = randperm(4);

index(1:(0.25*N)) = randperm(0.25*N);
index((0.25*N+1):(0.5*N)) = 0.25*N + randperm(0.25*N);
index((0.5*N+1):(0.75*N)) = 0.5*N + randperm(0.25*N);
index((0.75*N+1):N) = 0.75*N + randperm(0.25*N);

path1 = 1:1:N;
path1 = path1(index);
path(1:0.25*N) = path1((k(1)-1)*0.25*N+1:k(1)*0.25*N);
path(0.25*N+1:0.5*N) = path1((k(2)-1)*0.25*N+1:k(2)*0.25*N);
path(0.5*N+1:0.75*N) = path1((k(3)-1)*0.25*N+1:k(3)*0.25*N);
path(0.75*N+1:N) = path1((k(4)-1)*0.25*N+1:k(4)*0.25*N);
path(N+1) = path(1);

% Metropolis Algorithm
final_path = 0;
iteration = 0;
for i = 1:(N-1)
    final_path = final_path + distance(path(i),path(i+1));
end
while (iteration < 100000)
    i = randi(N-1);
    y = path;
    
    temp = y(i);
    y(i) = y(i+1);
    y(i+1) = temp;
    
    final_y = 0;
    if (i == 0.25*N || i == 0.5*N || i == 0.75*N)
        final_y = inf;
    else
        for j = 1:(N-1)
            final_y = final_y + distance(y(j),y(j+1));
        end 
    end
    
    U = rand();
    diff = final_path - final_y;
    A = exp(diff./(C/log(iteration)));
    if U < A/(1+A)
        path = y;
        final_path = final_y;
    end
    
    iteration = iteration + 1;

end


figure (1)
scatter(x(:,1),x(:,2),'filled');
title('The Tour to travel Country 1')
xlabel('coordinate x')
ylabel('coordinate y')
axis([-1.1,1.1,-1.1,1.1])
grid on; hold on;
plot(x(path(1:(0.25*N)),1) , x(path(1:(0.25*N)),2) , 'red')
legend('City','Country 1')

figure (2)
scatter(x(:,1),x(:,2),'filled');
title('The Tour to travel Country 2')
xlabel('coordinate x')
ylabel('coordinate y')
axis([-1.1,1.1,-1.1,1.1])
grid on; hold on;
plot(x(path((0.25*N):(0.5*N)),1) , x(path((0.25*N):(0.5*N)),2) , 'green')
legend('City','Country 2')

figure (3)
scatter(x(:,1),x(:,2),'filled');
title('The Tour to travel Country 3')
xlabel('coordinate x')
ylabel('coordinate y')
axis([-1.1,1.1,-1.1,1.1])
grid on; hold on;
plot(x(path((0.5*N):(0.75*N)),1) , x(path((0.5*N):(0.75*N)),2) ,'blue')
legend('City','Country 3')

figure (4)
scatter(x(:,1),x(:,2),'filled');
title('The Tour to travel Country 4')
xlabel('coordinate x')
ylabel('coordinate y')
axis([-1.1,1.1,-1.1,1.1])
grid on; hold on;
plot(x(path((0.75*N):N),1) , x(path((0.75*N):N),2) ,'black')
legend('City','Country 4')

figure(5)
scatter(x(:,1),x(:,2),'filled');
title('The Tour to travel 4 Countries')
xlabel('coordinate x')
ylabel('coordinate y')
axis([-1.1,1.1,-1.1,1.1])
grid on; hold on;
plot(x(path(1:(0.25*N)),1) , x(path(1:(0.25*N)),2) , 'red')
plot(x(path((0.25*N):(0.5*N)),1) , x(path((0.25*N):(0.5*N)),2) , 'green')
plot(x(path((0.5*N):(0.75*N)),1) , x(path((0.5*N):(0.75*N)),2) , 'blue')
plot(x(path((0.75*N):N+1),1) , x(path((0.75*N):N+1),2) , 'black')
legend('City','Country 1','Conntry 2','Country 3','Country 4')
