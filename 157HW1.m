theta = pi/9;
ratio1 = zeros(1,30);
for ee = [2:30]
    hh1 = (1-ee)./(cos(theta)+sqrt(ee-sin(theta).^2)).^2;
    vv1 = ((ee-1)*(sin(theta)^2-ee*(1+sin(theta)^2)))./...
        (ee*cos(theta)+sqrt(ee-sin(theta)^2)).^2;
    ratio1(ee) = (hh1./vv1).^2;
end

theta = 2*pi/9;
ratio2 = zeros(1,30);
for ee = [2:30]
    hh2 = (1-ee)./(cos(theta)+sqrt(ee-sin(theta).^2)).^2;
    vv2 = ((ee-1)*(sin(theta)^2-ee*(1+sin(theta)^2)))./(ee*cos(theta)+sqrt(ee-sin(theta)^2)).^2;
    ratio2(ee) = (hh2./vv2).^2;
end

theta = pi/3;
ratio3 = zeros(1,30);
for ee = [2:30]
    hh3 = (1-ee)./(cos(theta)+sqrt(ee-sin(theta).^2)).^2;
    vv3 = ((ee-1)*(sin(theta)^2-ee*(1+sin(theta)^2)))./(ee*cos(theta)+sqrt(ee-sin(theta)^2)).^2;
    ratio3(ee) = (hh3./vv3).^2;
end

plot(2:30,ratio1(2:30),'r-o')
hold on
plot(2:30,ratio2(2:30),'b-o')
hold on
plot(2:30,ratio3(2:30),'g-o')
title('Fist Order Small-Perturbation Model')
legend('\theta = 20^o','\theta = 40^o','\theta = 60^o')
ylabel('\sigma_h_h/\sigma_v_v')
xlabel('\epsilon')
