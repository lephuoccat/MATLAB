% this number represents the country
X = [1,2,3,4];
iteration = 0;
while (iteration < 10000)
    country_wise = rand;
    country_idx1 = 0;
    country_idx2 = 0;
    X_new = [];
    new_country1 = country1;
    new_country2 = country2;
    new_country3 = country3;
    new_country4 = country4;
    
    % pick a city
    p = 0;
    start_point = 0;
    end_point = 0;
    if (country_wise < 0.5)
        a = rand;
        if (a < 1/3)
            if (country_idx1 == 2)
                country_idx2 = 3;
            else
                country_idx2 = 2;
            end
            
        elseif (a < 2/3)
            if (country_idx1 == 3)
                country_idx2 = 4;
            else
                country_idx2 = 3;
            end
            
        else
            if (country_idx1 == 4)
                country_idx2 = 2;
            else
                country_idx2 = 4;
            end
        end
        
        if (country_idx1 > country_idx2)
            country_temp = country_idx1;
            country_idx1 = country_idx2;
            country_idx2 = country_temp;
        end
        
        reverse = X(country_idx1:country_idx2);
        X_new = [X(1:(country_idx1 - 1)), reverse(end:-1:1), X(country_idx2)];
        
        % done with reverse countries, now reverse cities
        for k = country_idx1 : country_idx2
            if (k == 2)
                new_country2 = country2(end:-1:1,:);
            elseif (k == 3)
                new_country3 = country3(end:-1:1,:);
            elseif (k == 4)
                new_country4 = country4(end:-1:1,:);
            end
        end
    
    % city-wise swapping
    else
        a = rand;
        if (a < 0.25)
            p = 1;
        elseif (a < 0.5)
            p = 2;
        elseif (a < 0.75)
            p = 3;
        else
            p = 4;
        end
        
        if (p == 1)
            if (length(country1) >= 3)
                idx = randperm(length(country1));
                idx = idx(idx~=1);
                if (idx(1) < idx(2))
                    start_point = idx(1);
                    end_point = idx(2);
                else
                    start_point = idx(2);
                    end_point = idx(1);
                end
                portion = country1(start_point:end_point,:);
                reverse = portion(end:-1:1,:);
                new_country1 = [country1(1:(start_point-1),:);reverse];
            end
            
        elseif (p == 2)
            if (length(country2) >= 2)
                idx = randperm(length(country2));
                if (idx(1) < idx(2))
                    start_point = idx(1);
                    end_point = idx(2);
                else
                    start_point = idx(2);
                    end_point = idx(1);
                end
                portion = country2(start_point:end_point,:);
                reverse = portion(end:-1:1,:);
                new_country2 = [country2(1:(start_point-1),:);reverse];
            end
            
        elseif (p == 3)
            if (length(country3) >= 2)
                idx = randperm(length(country3));
                if (idx(1) < idx(2))
                    start_point = idx(1);
                    end_point = idx(2);
                else
                    start_point = idx(2);
                    end_point = idx(1);
                end
                portion = country3(start_point:end_point,:);
                reverse = portion(end:-1:1,:);
                new_country3 = [country3(1:(start_point-1),:);reverse];
            end
            
        elseif (p == 4)
            if (length(country4) >= 2)
                idx = randperm(length(country4));
                if (idx(1) < idx(2))
                    start_point = idx(1);
                    end_point = idx(2);
                else
                    start_point = idx(2);
                    end_point = idx(1);
                end
                portion = country4(start_point:end_point,:);
                reverse = portion(end:-1:1,:);
                new_country4 = [country4(1:(start_point-1),:);reverse];
            end
            
        end
    end
    
    % Calculate distance
    D_dif = 0; % f(x) - f(x')
    if (country_wise < 0.5)
        city1 = [];
        city2 = [];
        city3 = [];
        city4 = [];
        
        if (contry_idx1 == 2)
            city1 = country1(end,:);
            city2 = country2(1,:);
        elseif (country_idx1 == 3)
            city1 = country2(end,:);
            city2 = country3(1,:);
        end
        
        if (contry_idx2 == 3)
            city3 = country3(end,:);
            city4 = country4(1,:);
        elseif (country_idx2 == 4)
            city3 = country3(end,:);
            city4 = country3(1,:);
        end
        
        D_original = sqrt(((city1(1)-city2(1))^2 + ((city1(2)-city2(2))^2))) + ...
            sqrt(((city3(1)-city4(1))^2 +(city3(2)-city4(2))^2));
        D_new = sqrt(((city1(1)-city3(1))^2 + (city1(2)-city3(2))^2)) + ...
            sqrt(((city2(1)-city4(1))^2 + (city2(2)-city4(2))^2));
        D_diff = D_original - D_new;
        
    else
        city1 = [];
        city2 = [];
        city3 = [];
        city4 = [];
        
        if (p == 1)
            city1 = country1(start_point-1,:);
            city2 = country1(start_point,:);
            city3 = country1(end_point,:);
            
            if (end_point == length(country1))
                city4 = city3;
            else
                city4 = country1(end_point+1,:);
            end
            
        elseif (p == 2)
            city2 = country2(start_point,:);
            if (start_point == 1)
                city1 = city2;
            else
                city1 = country2(start_point-1,:);
            end
            
            city2 = country2(start_point,:);
            city3 = country2(end_point,:);
            if (end_point == length(country2))
                city4 = city3;
            else
                city4 = country2(end_point+1,:);
            end
            
        elseif (p == 3)
            city2 = country3(start_point,:);
            if (start_point == 1)
                city1 = city2;
            else
                city1 = country3(start_point-1,:);
            end
            
            city3 = country3(end_point,:);
            if (end_point == length(country3))
                city4 = city3;
            else
                city4 = city3(end_point+1,:);
            end
            
        elseif (p == 4)
            city2 = country4(start_point,:);
            if (start_point == 1)
                city1 = city2;
            else
                city1 = country4(start_point-1,:);
            end
            
            city3 = country4(end_point,:);
            if (end_point == length(country4))
                city4 = city3;
            else
                city4 = city4(end_point+1,:);
            end
        end
        
        D_original = sqrt(((city1(1)-city2(1))^2 + ((city1(2)-city2(2))^2))) + ...
            sqrt(((city3(1)-city4(1))^2 +(city3(2)-city4(2))^2));
        D_new = sqrt(((city1(1)-city3(1))^2 + (city1(2)-city3(2))^2)) + ...
            sqrt(((city2(1)-city4(1))^2 + (city2(2)-city4(2))^2));
        D_diff = D_original - D_new;
    
    
    % Metropolis Algorithm
    U = rand;
    T = 1000*(1+0.1^-6)^(-run);
    diff = exp(D_diff/T);
    
    if (U < min(diff,1))
        X = X_new;
        country2 = new_country2;
        country3 = new_country3;
        country4 = new_country4;
        
        if (country_wise >= 0.5)
            country1 = new_country1;
        end    
    end
    
    total_distance_new = 0;
    % new distance
    for i = 1:length(country1)-1
        c1 = country1(i,:);
        c2 = country1(i+1,:);
        d = sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
        total_distance_new = total_distance_new + d;
    end
    
    for i = 1:length(country2)-1
        c1 = country2(i,:);
        c2 = country2(i+1,:);
        d = sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
        total_distance_new = total_distance_new + d;
    end
    
    for i = 1:length(country3)-1
        c1 = country3(i,:);
        c2 = country3(i+1,:);
        d = sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
        total_distance_new = total_distance_new + d;
    end
    
    for i = 1:length(country4)-1
        c1 = country4(i,:);
        c2 = country4(i+1,:);
        d = sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
        total_distance_new = total_distance_new + d;
    end
    
    iteration = iteration + 1;
    
    end
end
    