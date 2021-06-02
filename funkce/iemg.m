function values = iemg(data)
    values = trapz(abs(data));
end
