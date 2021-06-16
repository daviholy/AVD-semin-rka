addpath('./funkce');
%-----------------------------------------------
%2 chosen signals
%--------
%1.signal - integrated
map = parseHeader("data/drive01.hea","EMG");
data = read("data/drive01.dat",map);
time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
iemg_windowed = window(data,time,992); % windowed IEMG
fig1=figure();
plot(1/2:1/2:size(iemg_windowed,1)/2,iemg_windowed);
title('Integrovaný signál', 'FontSize', 20);
xlabel('èas', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
xlim([1000 1060])
if(save)
saveas(fig1,'grafy/plot_graph1.png')
savefig('grafy/plot_graph1.fig')
end
%--------
%1.signal - raw data
fig1r=figure();
plot(time, data);
xlim([1000 1060])
title('neupravená data signálu 1', 'FontSize', 20);
xlabel('èas (sekundy)', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
if(save)
saveas(fig1r,'grafy/plot_graph1r.png')
savefig('grafy/plot_graph1r.fig')
end
%--------
%2.signal - integrated
map = parseHeader("data/drive08.hea","EMG");
data = read("data/drive08.dat",map);
time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
iemg_res = iemg(data,time); % iemg value from data
iemg_windowed = window(data,time,31); % windowed IEMG
fig2=figure();
plot(1/1.9375:1/1.9375:size(iemg_windowed,1)/1.9375,iemg_windowed);
title('Práce signálu 8', 'FontSize', 20);
xlabel('èas (sekundy)', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
xlim([550 670])
saveas(fig2,'grafy/plot_graph2.png')
savefig('grafy/plot_graph2.fig')
%-----------------------------------------------
%2.signal - raw
fig2r=figure();
plot(time, data);
xlim([550 670])
title('neupravená data signálu 1', 'FontSize', 20);
xlabel('èas (sekundy)', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
if(save)
saveas(fig2r,'grafy/plot_graph2r.png')
savefig('grafy/plot_graph2r.fig')
end
%-----------------------------------------------
%connecting graph 17a + 17b
map17a = parseHeader("data/drive17a.hea","EMG");
data17a = read("data/drive17a.dat",map17a);
map17b = parseHeader("data/drive17b.hea","EMG");
data17b = read("data/drive17b.dat",map17b);
data17 = [data17a,data17b];
%calculations for graph 17
%a
time17a = 1/map17a('frequency'):1/map17a('frequency'):size(data17a,2) / map17a('frequency');
iemg_res17a = iemg(data17a,time17a); % iemg value from data
%b
time17b = 1/map17b('frequency'):1/map17b('frequency'):size(data17b,2) / map17b('frequency');
iemg_res17b = iemg(data17b,time17b); % iemg value from data
%a+b
iemg_res17=iemg_res17a+iemg_res17b;
time17=time17a(end)+time17b(end);


cesty_map=["data/drive01.hea" "data/drive05.hea" "data/drive06.hea" "data/drive07.hea" "data/drive08.hea" "data/drive09.hea" ...
            "data/drive10.hea" "data/drive11.hea" "data/drive12.hea" "data/drive13.hea" "data/drive14.hea" "data/drive15.hea"  ...
            "data/drive16.hea"];
cesty_dat=["data/drive01.dat" "data/drive05.dat" "data/drive06.dat" "data/drive07.dat" "data/drive08.dat" "data/drive09.dat" ...
           "data/drive10.dat" "data/drive11.dat" "data/drive12.dat" "data/drive13.dat" "data/drive14.dat" "data/drive15.dat" ...
           "data/drive16.dat"];
       
window_sizes=[992,8,8,8,8,...
                8,8,8,8,8,...
                8,8,8];

all_iemg_windowed=zeros(1,length(cesty_map+1));
all_iemg_windowed(1)=iemg_res17;
all_times=zeros(1,length(cesty_map+1));
all_times(1)=time17;

for r = 1:length(cesty_map)
        map = parseHeader(cesty_map(r),"EMG");
        data = read(cesty_dat(r),map);
        time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
        iemg_res = iemg(data,time);
        all_iemg_windowed(r+1)=iemg_res;
        all_times(r+1)=time(end);
end

fig3=figure();
scatter(all_times,all_iemg_windowed,25,'filled');
title('Celková vykonaná práce', 'FontSize', 20);
xlabel('èas (sekundy)', 'FontSize', 20)
ylabel('celková práce', 'FontSize', 20)
if(save)
saveas(fig3,'grafy/plot_prace.png')
savefig('grafy/plot_prace.fig')
end







