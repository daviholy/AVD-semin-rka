function values = window(data,len)
%integrate the given data by specified window length
    A = mod(size(data,2),len);
    if (A ~= 0)
        data = data(1:(size(data,2) - A));
    end
    data = reshape(data,len,[]);
    values = zeros(size(data,2),1);
    for i = 1:size(data,2)
        values(i) = iemg(data(:,i));
    end
end