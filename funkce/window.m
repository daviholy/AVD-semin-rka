function values = window(data,time,len)
%integrate the given data by specified window length, the time vector must
%be same length as data vector!!!
    A = mod(size(data,2),len);
    if (A ~= 0)
        data = data(1:(size(data,2) - A));
        time = time(1:(size(time,2) - A));
    end
    data = reshape(data,len,[]);
    time = reshape(time,len,[]);
    values = zeros(size(data,2),1);
    parfor i = 1:size(data,2)
        values(i) = iemg(data(:,i),time(:,i));
    end
end