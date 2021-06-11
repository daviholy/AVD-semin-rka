function values = iemg(data,time)
    values = trapz(time,abs(data));
end
