function SOM_test(Input_data, weight_change, num, clu_con_pat)
%% this function is to identify and test the given data, cluster and class 
% Input = Input_data, 
%         Weight_change (we already find usinf SOM_train function)
%         num (only variable to print proper cluster and not related with algorithm)

if num == 1     % define cluster/class according to data
    cluster1 = 'class 1'; %defien class 
    cluster2 = 'class 2';
    disp(['test_vector 1 is ','[',num2str(Input_data(1,:)),']']);
    disp(['test_vector 2 is ','[',num2str(Input_data(2,:)),']']);
    disp(['test_vector 3 is ','[',num2str(Input_data(3,:)),']']);
    disp(['test_vector 4 is ','[',num2str(Input_data(4,:)),']']);
else
    if clu_con_pat == 1 % find which cluster is patient/control
        cluster1 = 'control';
        cluster2 = 'patient';   
    else
        cluster1 = 'patient';
        cluster2 = 'control';
    end
end

for N = 1:size(Input_data,1) % this is for compute euclidean distance between input data and weight_change
    D1 = norm(Input_data(N,:)-weight_change(:,1)')^2;
    D2 = norm(Input_data(N,:)-weight_change(:,2)')^2;
    
    if D1 < D2 %compare euclidean distance of two cluster and find class  
        disp(['test vector ',num2str(N),' belongs to ', cluster1]);
    else
        disp(['test vector ',num2str(N),' belongs to ', cluster2]);
    end
end


end
