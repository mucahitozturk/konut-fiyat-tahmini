% Soru 1
%
% PROGRAM ÇALIÞTIRMA:
%       - Yukarýdaki "RUN" tuþuna basýn
%
%--------------------------------------------
% BAÞLANGIÇ
clear; clc;

%% SABÝTTLER
DosyaAdi='but_data1.xlsx';

%% VERÝ OKUNMASI
Data=xlsread(DosyaAdi);
X=Data(:,1:end-1);
Y=Data(:,end);
clear Data DosyaAdi

%% LÝNEER REGRESYON UYGULAMASI
mdl = fitlm(X,Y);
Tahmin=predict(mdl,X);
Hata=Y-Tahmin;
OrtHata=mean(sqrt(Hata.^2));

% Sonucun yazýlmasý
fprintf(1,'\n');
fprintf(1,'                Veri uzunluðu: %.2f\n',length(Tahmin));
fprintf(1,'Ortalama Hata Karekök miktarý: %.2f\n',OrtHata);
fprintf(1,'\n');

% Sonuç grafiði
h1= plot(Y,'-b','LineWidth',1.5); hold on;
h2= plot(Tahmin,'-r','LineWidth',1.5); hold off;
xlim([0 length(Tahmin)+100])
grid on

xlabel('Ev')
ylabel('Gerçek/Tahmini Ev Fiyatý')
legend([h1 h2 ],'Gerçek deðer','Tahmini deðer','Location','southwest')

% Txt dosyasýna yazýlmasý
DosyaAdi='Soru1_Sonuc.txt';
fid=fopen(DosyaAdi,'wt');
fprintf(fid,'\n');
fprintf(fid,'PARAMETRELER: \n');
fprintf(fid,' y = median house value\n');
fprintf(fid,'x1 = median income\n');
fprintf(fid,'x2 = housing median age\n');
fprintf(fid,'x3 = total rooms\n');
fprintf(fid,'x4 = total bedrooms\n');
fprintf(fid,'x5 = population\n');
fprintf(fid,'x6 = households\n');
fprintf(fid,'x7 = latitude\n');
fprintf(fid,'x8 = longitude\n');	
fprintf(fid,'\n');
fprintf(fid,'Linear regression model:\n'); 
fprintf(fid,'y = c1*x1 + c2*x2 + c3*x3 + c4*x4 + c5*x5 + c6*x6 + c7*x7 + c8*x8 + c9 \n');

c1=mdl.Coefficients.Estimate(2);
c2=mdl.Coefficients.Estimate(3);
c3=mdl.Coefficients.Estimate(4);
c4=mdl.Coefficients.Estimate(5);
c5=mdl.Coefficients.Estimate(6);
c6=mdl.Coefficients.Estimate(7);
c7=mdl.Coefficients.Estimate(8);
c8=mdl.Coefficients.Estimate(9);
c9=mdl.Coefficients.Estimate(1);

fprintf(fid,'\n');
fprintf(fid,'y = %.2f*x1 + %.2f*x2 + %.2f*x3 + %.2f*x4 + %.2f*x5 + %.2f*x6 + %.2f*x7 + %.2f*x8 + %.2f \n',c1,c2,c3,c4,c5,c6,c7,c8,c9);
fprintf(fid,'\n');

fprintf(fid,'                Veri uzunluðu: %.2f\n',length(Tahmin));
fprintf(fid,'Ortalama Hata Karekök miktarý: %.2f\n',OrtHata);
fprintf(fid,'\n');

fclose(fid);

