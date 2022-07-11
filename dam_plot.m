%mohamad deris shalhe
%970092552
%University:Islamic Azad ahwaz
%Number:09034568778
%emile: mohder1379@gmail.com
%my website:mohder.com

clear
clc
%///////////%Dam specification///////////

max_Height=127;% maximum Reservoir Height from the foundation
max_Height_Floodwater=124; %between max_Height_Floodwater & max_Height , for control Floodwater
min_Height=62; % minimum Reservoir Height from the foundation Height if min_Height<now_Height Turbines not working
now_Height=40; % initial Reservoir Height from the foundation
Length_and_width=12000*3872; %Length and width of the Reservoir

%///////////Dam volume///////////

max_Vol=Length_and_width*max_Height; %maximum reservoir volume m3 
res_vol_fol=Length_and_width*max_Height_Floodwater; %Floodwater reservoir 
min_vol=Length_and_width*min_Height;  %minimum reservoir volume m3. if min.vol<mow_Vol Turbines not working
mow_Vol=Length_and_width*now_Height;  %initial reservoir volume m3

%///////////Turbine specifications like Karkheh Dam///////////
%kind=(HLA696-LJ-450)Francis_with_vertical_axis
Number=3; %devices
max_Had=106.5;
Ratd_Had=93;
min_Had=62;
max_Tur_out=159.54; %maximum turbine outflow
Ratd_Tur_out=158.42;%Ratd turbine outflow
min_Tur_out=127.95; %minimum turbine outflow
Ratd_Power=136; %megawatt 
Max_Power=156;%megawatt 
min_Power=70;%megawatt 
Runaway_speed=288; %per min. wikipedia description: The runaway speed of a water turbine is its speed at full flow, and no shaft load. The turbine will be designed to survive the mechanical forces of this speed. The manufacturer will supply the runaway speed rating.
%direction_rotation=Clockwise_from_above The direction of rotation of the turbine
%i found this information from http://www.esig.blogfa.com/post/7 for more
%information visit blog

Bet_max_and_rat_had=((max_Had-Ratd_Had)/2)+Ratd_Had;%berween max_Had & Ratd_Had
Bet_rat_and_min_had=((Ratd_Had-min_Had)/2)+min_Had;%berween Ratd_Had & min_Had

%///////////Discharge specifications of 3 turbine and overflow///////////
Ove_for_Flo=18260*86400 ;%m3 Overflow for Floodwater
xx=3*86400; % 3 turbine * 1 day . change per second to per day
max_Turbine_out=159.54*xx ;%m3 per day outflow
Ratd_Turbine_out=158.42*xx; %m3 per day outflow
min_Turbine_out=127.95*xx; %m3 per day outflow
Bet_max_and_rat_out=(((max_Turbine_out-Ratd_Turbine_out)/2)+Ratd_Turbine_out); %berween max_Turbine_out & Ratd_Turbine_out     m3 per day outflow
Bet_rat_and_min_out=(((Ratd_Turbine_out-min_Turbine_out)/2)+min_Turbine_out); %berween Ratd_Turbine_out & min_Turbine_out  m3 per day outflow

%///////////Evaporation IN Andimeshk Khuzestan///////////
%E=0.35*(e_s-e_d)*(0.5+U_2/100);
%E=Evaporation mm
U_2=3;% Wind speed m/s IN Andimeshk now
%e_s=Vapour pressure of water
%e_d=Vapor pressure
%e_s-e_d=Vapour-pressure deficit
%Relhum=50.3; Relative humidity IN Andimeshk Khuzestan
e_s_e_d_betwin_10_14= 0.7;
e_s_e_d_betwin_15_19 =1;
e_s_e_d_betwin_20_24=1.3;
e_s_e_d_betwin_25_29=1.8;
e_s_e_d_betwin_30_34=2.4;
e_s_e_d_betwin_35_39=3.1;
e_s_e_d_betwin_40_44=4.1;
e_s_e_d_betwin_45_49=5.3;
e_s_e_d_betwin_50_abov=6.5;
%i found this informations from
%https://waterse.ir/methods-of-estimating-evaporation-free-surface-water/ 
%https://fa.wikipedia.org/wiki/%DA%A9%D9%85%D8%A8%D9%88%D8%AF_%D9%81%D8%B4%D8%A7%D8%B1_%D8%A8%D8%AE%D8%A7%D8%B1
%https://medium.com/fasalapp/vapour-pressure-deficit-vpd-a-powerful-weapon-for-smart-farming-30753b42cd52
%http://khzmet.ir/image/climakh.pdf
%https://poweren.ir/tag/%D8%AF%D8%A7%D9%86%D9%84%D9%88%D8%AF-%DA%A9%D8%AA%D8%A7%D8%A8-%D8%A8%D9%87%D8%B1%D9%87-%D8%A8%D8%B1%D8%AF%D8%A7%D8%B1%DB%8C-%D8%A7%D8%B2-%D8%B3%DB%8C%D8%B3%D8%AA%D9%85-%D9%87%D8%A7%DB%8C-%D9%82%D8%AF




%///////////Database///////////
data= 'dam_data365.mat';
load(data)

%///////////initialize return values for loop///////////
vol_reservoir = zeros(size(time)); %reservoir volume
vol_reservoir1 = zeros(size(time)); %reservoir volume  vol_reservoir1 like vol_reservoir. I need calculate reservoir volume twice
outflow_discharge = zeros(size(time)); %total outflow
vap_per_def = zeros(size(time)); %Vapour-pressure deficit
Evaporation = zeros(size(time));  %Evaporation IN Andimeshk Khuzestan
min_vol_tur=zeros(size(time)); %minimum volume to turbine working
max_Vol_res=zeros(size(time)); %%maximum volume reservoir
Height=zeros(size(time)); %real-time Height
Overflow=zeros(size(time));%Overflow from turbine
Power=zeros(size(time)); %Power for each turbine
%///////////initial conditions reservoir for loop///////////
vol_reservoir(1)=mow_Vol;  % initial reservoir volume m3
vol_reservoir1(1)=mow_Vol; % initial reservoir volume m3
min_vol_tur(1)=min_vol; % initial minimum volume to turbine working
max_Vol_res(1)=max_Vol; % initial maximum volume reservoir
Height(1)=now_Height; % initial dam Height
%///////////Calling information from Database///////////
inflow_discharge=inflow; % inflow Discharge 
temp=Temperature; % Temperature

%///////////for loop///////////

%%

for i = 2:length(time)

 %///////////Choose the right temperature for Evaporation///////////
   
    vap_per_def(i)=temp(i);
    if vap_per_def(i)<=9 
        vap_per_def(i)=0.5;    
    elseif vap_per_def(i)>=10 && vap_per_def(i)<=14
        vap_per_def(i)=0.7;
    elseif vap_per_def(i)>=15 && vap_per_def(i)<=19
        vap_per_def(i)=1;
    elseif vap_per_def(i)>=20 && vap_per_def(i)<=24
        vap_per_def(i)=1.3;
    elseif vap_per_def(i)>=25 && vap_per_def(i)<=29
        vap_per_def(i)=1.8;
    elseif vap_per_def(i)>=30 && vap_per_def(i)<=34
        vap_per_def(i)=2.4;
    elseif vap_per_def(i)>=35 && vap_per_def(i)<=39
        vap_per_def(i)=3.1;
    elseif vap_per_def(i)>=40 && vap_per_def(i)<=44
        vap_per_def(i)=4.1;
    elseif vap_per_def(i)>=45 && vap_per_def(i)<=49
        vap_per_def(i)=5.3; 
    elseif vap_per_def(i)>=50 
        vap_per_def(i)=6.5;
    end
    

    %///////////calculation///////////

    Evaporation(i)=((0.35*(vap_per_def(i)))*(0.5+(U_2/100)))*Length_and_width; %Evaporation calculation E=0.35*(e_s-e_d)*(0.5+U_2/100)
    vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i)-outflow_discharge(i-1)-Evaporation(i); %reservoir volume calculation
    Height(i)=(vol_reservoir(i))/Length_and_width; %real-time Height calculation

    %///////////Choose the right outflow for turbine///////////

    if Height(i)<=0
        outflow_discharge(i)=0;
    elseif Height(i)<=min_Had
        outflow_discharge(i)=0;
    elseif Height(i)>min_Had && Height(i)<=Bet_rat_and_min_had
        outflow_discharge(i)=min_Turbine_out;
    elseif Height(i)>Bet_rat_and_min_had && Height(i)<=Ratd_Had
        outflow_discharge(i)=Bet_rat_and_min_out;
    elseif Height(i)>Ratd_Had && Height(i)<=Bet_max_and_rat_had
        outflow_discharge(i)=Ratd_Turbine_out;        
    elseif Height(i)>Bet_max_and_rat_had && Height(i)<=max_Had
        outflow_discharge(i)=Bet_max_and_rat_out;  
    elseif Height(i)>max_Had 
        outflow_discharge(i)=max_Turbine_out;
    end

%///////////Power calculation///////////
   
    %P=n*p*g*h*q
    n=0.9;  %Efficiency
    p=997 ; %Density
    g=9.82; %Gravitational acceleration
    h=Height(i);
    q=(outflow_discharge(i-1)/xx)*0.000001; 
    Power(i)=n*p*g*h*q;
%//////////////////////

    

    if vol_reservoir(i) <=Evaporation(i) 
        Evaporation(i)=inflow_discharge(i); %if Evaporation(i)=!inflow_discharge(i) , Evaporation(i)>inflow_discharge(i) & vol_reservoir(i)<0
    end

    if vol_reservoir(i) <=0
        vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i); % cant be vol_reservoir(i)<0
    end
    
    Overflow(i)=vol_reservoir(i)-res_vol_fol; %reservoir volume calculation
    if Overflow(i)<=0
         Overflow(i)=0;  %Overflow1 cant be <0
    end

    if Overflow(i)>Ove_for_Flo  
         beep  %when floodwater>Ove_for_Flo We hear this warning

    end
    if vol_reservoir(i) >res_vol_fol      
        vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i)-outflow_discharge(i)-Overflow(i);  % if vol_reservoir(i) >res_vol_fol we change vol_reservoir(i) calculation for Dnot allow more than res_vol_fol   
    end

    if vol_reservoir(i) >=max_Vol
        vol_reservoir(i)=max_Vol; % we change vol_reservoir(i) calculation for Dnot allow more max_Vol
    end
	
    if Height(i)<=0
        Height(i)=0; 
    end


min_vol_tur(i)=min_vol;  %minimum volume to turbine working
max_Vol_res(i)=max_Vol;  %maximum volume reservoir
end
%%

%///////////plot///////////

subplot(6,1,1)
plot(time,vol_reservoir,'r-',time,min_vol_tur,time,max_Vol_res)
ylabel('reservoir volume')
legend('reservoir volume')

subplot(7,1,2)
plot(time,Overflow,'g-')
ylabel('Overflow volume')
legend('volume')

subplot(7,1,3)
plot(time,outflow_discharge,'c--')
ylabel('outflow')
legend('outflw volume')

subplot(7,1,4)
plot(time,Evaporation,'b-')
ylabel('Evaporation')
legend('Evaporation volume')

subplot(7,1,5)
plot(time,Height,'b-')
ylabel('real-time Height')
legend('Height m')

subplot(7,1,6)
plot(time,Power,'b-')
ylabel('Power')
legend('Power MW')

subplot(7,2,13)
plot(time,temp,'-.')
ylabel('Temperature')
legend('Temperature °C')

subplot(7,2,14)
plot(time,inflow_discharge,'-.')
ylabel('inflow')
legend('inflow volume')

