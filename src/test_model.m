function [xy, logp] = test_model(models, data)
    sim = zeros(4, 1);
    for type_num = 1:4
        model = models{type_num};
        sim(type_num) = mhmm_logprob(data, model{2}, model{3}, model{4}, model{5}, model{6});
    end

    logp = sim;
    sim = sim - min(sim);
    sim = sim / sum(sim);
    xy = [sim(1) - sim(2) - sim(3) + sim(4), sim(1) + sim(2) - sim(3) - sim(4)];
