addpath('./funkce');

map = parseHeader("data/drive06.hea","EMG");
data = read("data/drive06.dat",map);
plot(data);

iemg_res = iemg(data); % iemg value from data
len = 1984;
for i = 1:7
    lengths(i) = len;
    res(i) =sum(window(data,len));
    len = len/2;
end
iemg_windowed = window(data,20); % windowed IEMG
plot(iemg_windowed);