function map = parseHeader(filePath,signalDesc)
%parse the infromations of specified signal from header file
file = fopen(filePath,'r','n','UTF-8');
recordHead= fgetl(file);
recordHead= split(recordHead, " ");
windowLen = 0;
for i=1:str2num(recordHead{2})
    record = fgetl(file);
    record = split(record," ");
    format = split(record{2},"x");
    if (length(format) == 1)
            samples= 1;
        else
            samples = str2num(format{2});
    end
    if (record{9} == signalDesc)
        mapValues = [str2num(format{1}) samples samples*str2double(recordHead{3}) str2num(record{3}) str2num(record{4}) str2num(record{5}) str2num(record{6}) windowLen];
        
    end
    windowLen = windowLen + samples;
end
fclose(file);
mapKeys = {'format','samples','frequency','ADCgain','ADCres','ADCzero', 'intValue','offset','windowLen','totalSamples'};
mapValues= [mapValues windowLen str2num(recordHead{4})];
map = containers.Map(mapKeys,mapValues);
end