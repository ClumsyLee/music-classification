function [emotions, fixed_emotions] = test_music(models, music)
    probs = [];
    fixed_probs = [];
    len = length(music);
    last = [0.25; 0.25; 0.25; 0.25];
    last = last / sum(last);
    coeff = [
        92/114  1/114   11/114   10/114
        4/23   16/23  2/23   1/23
        13/63   2/63   47/63  1/63
        8/34  1/34   1/34   24/34
    ]';
    % coeff = [
    %     60/82  1/82   5/82   16/82
    %     2/24   18/24  3/24   1/24
    %     4/59   2/59   48/59  5/59
    %     15/66  0/66   3/66   48/66
    % ]';


    for k = 1:len
        clip = music{k};
        [~, logp] = test_model(models, clip);
        p = exp(logp / 1000);

        probs = [probs, p];
        last = (coeff * last) .* p;

        fixed_probs = [fixed_probs, last];
    end

    [~, emotions] = max(probs);
    [~, fixed_emotions] = max(fixed_probs);
