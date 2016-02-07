new_data_set = cell(4, 1);
T = 1000;

for type_num = 1:4
    data = {};
    for k = 1:length(dataset{type_num})
        this_data = dataset{type_num}{k};
        for t = 1:T:length(this_data)-T+1
            data = [data; this_data(2:end, t:t+T-1)];
        end
    end
    new_data_set{type_num} = data;
end
