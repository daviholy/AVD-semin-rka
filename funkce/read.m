function values = read(filepath,map)
%read the from specified file with specific mapped data from header
file = fopen(filepath,'r','l');
data = fread(file, Inf,'int16');
fclose(file);
samples = map('samples')-1;
offset = map('offset');
values = int16.empty(map('totalSamples') + 1,0);
i =1;
%iterate trough each frame
for frame = 1:map('windowLen'):(size(data,1))
    data_offset = frame + offset;
    %iterate trough each sample in frame
    for value = 0:samples
        values(i) = data(data_offset +value);
        i = i +1;
    end
    values = double(values);
end