figure
hold on
xy = [];
for k = 1:172
xy(:, k) = test_model(models, new_data_set{1}{k});
end
plot(xy(1, :), xy(2, :), 'xg');
xy = [];
for k = 1:131
xy(:, k) = test_model(models, new_data_set{2}{k});
end
plot(xy(1, :), xy(2, :), 'xr');
xy = [];
for k = 1:131
xy(:, k) = test_model(models, new_data_set{3}{k});
end
plot(xy(1, :), xy(2, :), 'xm');
xy = [];
for k = 1:52
xy(:, k) = test_model(models, new_data_set{4}{k});
end
plot(xy(1, :), xy(2, :), 'xb');

legend 'Type I' 'Type II' 'Type III' 'Type IV'
