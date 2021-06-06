%creating handlers of functions in subfolder
cd funkce
h_read =@read;
h_parseHeader = @parseHeader;
iemg_f = @iemg;
cd ..
%
map = h_parseHeader("data/drive06.hea","EMG");
data = h_read("data/drive06.dat",map);
plot(data)

iemg_res = iemg_f(data); % iemg value from data
data_part = data(1:100); % data from 1 to 100
iemg_part = iemg_f(data_part); %iemg value from data 1-100

disp(iemg_res);
disp(iemg_part); 
