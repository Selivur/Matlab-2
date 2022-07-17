clear;
Data = [15.75085      20.59001      26.77078      34.56885      44.25651       56.0632      70.12089      86.40162      104.6631      124.4255           145      165.5745      185.3369      203.5984      219.8791      233.9368      245.7435      255.4312      263.2292        269.41      274.2492]
Data1 = [20.59001      26.77078      34.56885      44.25651       56.0632      70.12089      86.40162      104.6631      124.4255           145      165.5745      185.3369      203.5984      219.8791      233.9368      245.7435      255.4312      263.2292        269.41      274.2492]
R = [10  12  14  16  18  20  22  24  26  28  30  32  34  36  38  40  42  44  46  48  50]
R1 = [12  14  16  18  20  22  24  26  28  30  32  34  36  38  40  42  44  46  48  50]

poh = diff(Data) ./ diff(R)
poh2 = diff(R) ./ diff(Data)

TVC = 100 * R
TFC = 1000 * ones(size(TVC))
TC = TVC + TFC

AVC = TVC ./ Data
AFC = TFC ./ Data
ATC = TC ./ Data
MC = 100 * poh2

avg_avc = min(AVC)
avg_atc = min(ATC)
avg_mc = min(MC)

figure;
hold on;

xlabel('R');

plot(R, Data, '-o');
plot(R1, poh, '-o');

legend('Q', 'dQ / dR');

hold off;

figure;
hold on;

xlabel('Q');

plot(Data, TVC,  '-o')
plot(Data, TFC,  '-o')
plot(Data, TC,  '-o')

legend('TVC', 'TFC', 'TC');

hold off;

figure;
hold on;

xlabel('Q');

plot(Data, AVC, '-o')
plot(Data, AFC, '-o')
plot(Data, ATC, '-o')
plot(Data1, MC, '-o')

legend('AVC', 'AFC', 'ATC', 'MC');