new_test_set = cell(size(test_set));
T = 1000;
STEP = 500;

for index = 1:length(test_set)
    data = {};
    this_data = test_set{index};
    len = size(this_data, 2);
    for t = 1:STEP:len-T+1
        data = [data; this_data(2:end, t:t+T-1)];
    end
    new_test_set{index} = data;
end
