function [weight_change,clu_con_pat] = SOM_train(Input_data, learning_rate, num);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input = Input_data(train) , learning_rate
% output = weight_change , clu_con_pat
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
cluster = 2; 
alpha = learning_rate;
weight_change = rand(size(Input_data,2),cluster); %random synaptic weight
weight_change1 = []; %variable for convergence error
j = 2; %variable for convergence error
n_iteration =  100; % no of iteration
%%
%% training starts
for i = 1:1:n_iteration
    for N = 1:size(Input_data,1)
        
        D1 = norm(Input_data(N,:)-weight_change(:,1)')^2; %calculate Euclidian distance
        D2 = norm(Input_data(N,:)-weight_change(:,2)')^2; %calculare Euclidian distance 
        
        if D1 < D2 %finding the closest weight vector 
            weight_change(:,1) = weight_change(:,1) + alpha*(Input_data(N,:)' - weight_change(:,1));
            if N == 1
                clu_con_pat = 1; % clu_con_pat(find which cluster is control/patient)
            end
        else weight_change(:,2) = weight_change(:,2) + alpha*(Input_data(N,:)' - weight_change(:,2));
            if N == 1
                clu_con_pat = 2; % clu_con_pat(find which cluster is control/patient)
            end
        end
    end
    alpha = alpha * exp(-i/n_iteration); %reduce learing rate
    
    %% calculate the convergence error
    
    weight_change1 = [weight_change1 weight_change];
    if i ~= 1
        c_error = sum(sum(weight_change1(:,j-1:j) - weight_change1(:,j+1:j+2)));% calculate convergence error
      
        
        figure(num); 
        scatter(i-1, c_error, 'mo')
        xlabel('iterations')
        ylabel('convergence error')
        title(['weight convergence of part', num2str(num)]);
        hold on;
        pause(1e-6);
        j = j + 2;
       
        if c_error < 1e-35 
            disp(['synaptic weight converged ', num2str(i), ' iterations']);
            if num == 1
                disp(['synaptic weights after convergence is ', 10 ]);
                disp(weight_change);
            end
            break;
        end
    end
end


end
    
    