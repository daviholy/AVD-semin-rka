addpath('./funkce');
map = parseHeader("data/drive01.hea","EMG");
data = read("data/drive01.dat",map);
plot(data);
time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
iemg_res = iemg(data,time); % iemg value from data
iemg_windowed = window(data,time,256); % windowed IEMG
plot(iemg_windowed);