function values = read(filepath,map)
file = fopen(filepath,'r','l');
data = fread(file, Inf,'int16');
fclose(file);
values = int16.empty(map('totalSamples'),0);
i =1;
for frame = map('offset'):map('windowLen'):(size(data,1)/map('windowLen'))
    for value = 1:map('samples')
        values(i) = data(value + frame);
        i = i +1;
    end
end
end