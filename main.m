addpath('./funkce');

map = parseHeader("data/drive06.hea","EMG");
data = read("data/drive06.dat",map);

iemg_res = iemg(data); % iemg value from data
iemg_part = iemg(data_part); %iemg value from data 1-100
iemg_windowed = window(data,16); % windowed IEMG
plot(iemg_windowed);