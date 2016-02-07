function dataset = preprocess(root_dir, suffix)
    dataset = cell(4, 1);

    % for type_num = 1:4
        subdir = [root_dir];
        % subdir = [root_dir '/' int2str(type_num)];
        features = {};

        for file = dir([subdir '/*.' suffix])'
            filename = [subdir '/' file.name]
            features = [features; extract_features(filename)];
        end
        dataset = features;
        % dataset{type_num} = features;
    % end
