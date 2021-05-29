cd funkce
h_read =@read;
h_parseHeader = @parseHeader;
cd ..
map = h_parseHeader("data/drive06.hea","EMG");
data = h_read("data/drive06.dat",map);
plot(data)