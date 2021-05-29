function values = read(filepath,map)
%read the from specified file with specific mapped data from header
file = fopen(filepath,'r','l');
data = fread(file, Inf,'int16');
fclose(file);
values = int16.empty(map('totalSamples'),0);
i =1;
%iterate trough each frame
for frame = map('offset'):map('windowLen'):(size(data,1)/map('windowLen'))
    %iterate trough each sample in frame
    for value = 1:map('samples')
        values(i) = data(value + frame);
        i = i +1;
    end
end
end