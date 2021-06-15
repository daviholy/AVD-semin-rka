addpath('./funkce');
%-----------------------------------------------
%2 chosen signals
%--------
%1.signal - integrated
map = parseHeader("data/drive01.hea","EMG");
data = read("data/drive01.dat",map);
time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
iemg_res = iemg(data,time); % iemg value from data
iemg_windowed = window(data,time,256); % windowed IEMG
fig1=figure()
plot(iemg_windowed);
title('Integrovaný signál 1', 'FontSize', 20);
xlabel('čas', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
xlim([1.53e4 1.55e4])
%saveas(fig1,'plot_graph1.png')
%savefig('plot_graph1_fig.fig')
%--------
%1.signal - raw data
fig1r=figure()
plot(data)
xlim([1.53e4 1.55e4])
title('Raw data signálu 1', 'FontSize', 20);
xlabel('čas', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
saveas(fig1r,'plot_graph1r.png')
savefig('plot_graph1r_fig.fig')
%--------
%2.signal
map = parseHeader("data/drive08.hea","EMG");
data = read("data/drive08.dat",map);
time = 1/map('frequency'):1/map('frequency'):size(data,2) / map('frequency');
iemg_res = iemg(data,time); % iemg value from data
iemg_windowed = window(data,time,4); % windowed IEMG
fig2=figure()
plot(iemg_windowed);
title('Práce signálu 8', 'FontSize', 20);
xlabel('čas', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
xlim([0.36e4 0.4e4])
%saveas(fig2,'plot_graph2.png')
%savefig('plot_graph2_fig.fig')
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
       
window_sizes=[512,4,4,4,4,...
                4,4,4,4,4,...
                4,4,4];

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

fig3=figure()
scatter(all_times,all_iemg_windowed,25,'filled');
title('Celková práce', 'FontSize', 20);
xlabel('čas', 'FontSize', 20)
ylabel('práce', 'FontSize', 20)
%saveas(fig3,'plot_prace.png')
%savefig('plot_prace_fig.fig')







