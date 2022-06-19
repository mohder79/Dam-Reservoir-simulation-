# Dam simulation
![dam](https://user-images.githubusercontent.com/102425717/174498979-2df05c2f-0a55-4a78-b67a-7d3e825706df.JPG)




 
![وروی اب](https://user-images.githubusercontent.com/102425717/174499084-d0af71e9-65fc-4f1b-8aab-2c1e06f8c793.png)


میزان آب ورودی به مخزن به مدت یک سال
 همانطور که مشاهده میکنید مقادیر ورودی آب از اپریل تا اوگست مقدار ناچیزی است به علت تمام شدن سال ابی و شروع تابستان




 

میزان دما در روز های مختلف سال 
 همانطور که مشاهده میکنید میزان دما به علت شروع شدن تابستان از اپریل مقدار سعودی به خود گرفته پس انتظار میرود میزان تبخیر آب در این زمان بیشتر باشد

 

حجم مخزن در روز های مختلف سال
همانطور که مشاهده میکنید حجم مخزن از یک مقدار اولیه شروع میشود ور در اواخر ماه جان به مقدار مینیموم کار کرد توربین ها میرسد. از شروع اپریل دما افزایش پیدا میکند و به علت افزایش تبخیر و کم شدن میزان ورودی آب شیب تندی از تخلیه مخزن داریم . میزان حجم مخزن در جولای برابر صفر قرار میگیرد. از شروع اوگست میزان ورودی آب افزایش یافته و شیب سعودی به خود میگیرد. در اواخر نوامبر میزان حجم آب مخزن به حالت ماکس خود میرسد و به علت شروع به کار شدن سرریز های سد حجم مخزن در حالت ماکس خود قرار میگیرد

 

حجم خروجی آب از توربین ها در روز های مختلف سال
همانطور که مشاهده میکنید هر زمان که حجم مخزن از حالت مینیموم کمتر بوده (خط نارنجی در مخزن) توربین ها به حالت غیر فعال در آمدند

 

میزان تبخیر در روز های مختلف
همانطور که مشاهده میکنید میزان تبخیر آب به علت دمای پایین با میزان کمی شروع شده و رفته رفته در اپریل به علت افزایش دما میزان تبخیر بیشتر شده تا جولای به مقدار صفر رسیده به این علت که دیگر آبی در مخزن وجود ندارد و در اوایل اگوست به علت شروع سال آبی و کاهش دما افزایش یافته 


سرریز های سد
همانطور که مشاهده میکنید در اواخر نوامبر به علت رسیدن حجم آب مخزن به ارتفاع کنترل سیلاب ها از مقدار صفر افزایش یافته

 

ارتفاع مخزن در روز های مختلف
همانطور که مشاهده میکنید نمودار ارتفاع  تابعی از حجم مخزن هست و نمودار آن فرقی با نمودار حجم مخزن ندارد

 

توان توربین
همانطور که مشاهده میکنید توان توربین تابعی از حجم خروجی آب از توربین ها است و نمودار آن فرقی ندارد و تنها تفاوت نمایش میزان توان تولیدی توربین هاست

 
نمودار کمبود فشار بخار در دما و رطوبت های مختلف
 
توربین فرانسیس




اطلاعات ارتفاعی، حجمی، خروجی های توربین و سریزها و توان و تعداد توربین ها همانند اطلاعات در دسترس سد کرخه در نظر گرفته شده اند







clear
clc
%///////////%مشخصات سد///////////

max_Height=127;% ارتفاع سد از پی
max_Height_Floodwater=124; % ارتفاع سد تا محل کنترل سیل اب
min_Height=62; % کمترین ارتفاع مخزن سد برای کار کرد توربین
now_Height=130; % ارتفاع اولیه سد
Length_and_width=12000*3872; %طول و عرض مخزن سد

%///////////محاسبات حجم مخزن در حالت های مختلف///////////

max_Vol=Length_and_width*max_Height; %بیشترین حجم مخزن 
res_vol_fol=Length_and_width*max_Height_Floodwater; %حجم مخزن تا محل نگهداری سیل اب 
min_vol=Length_and_width*min_Height;  % کمترین حجم مخزن برای کار کرد توربین ها
mow_Vol=Length_and_width*now_Height;  %حجم اولیه مخزن

%///////////توربین سد همانند توربین های سد کرخه در نظر گرفته شده///////////
%kind=(HLA696-LJ-450)Francis_with_vertical_axis  
Number=3; %تعداد توربین
max_Had=106.5;  %بیشترین ارتفاع کار کرد
Ratd_Had=93; %ارتفاع نامی کار کرد
min_Had=62; %کمترین ارتفاع کارکرد
max_Tur_out=159.54; %بیشترین خروجی اب از توربین بر ثانیه
Ratd_Tur_out=158.42;%خروجی نامی اب از توربین برثانیه
min_Tur_out=127.95; %کمترین خروجی اب از تووبین بر ثانیه
Ratd_Power=136; %توان نامی توربین 
Max_Power=156;% بیشترین توان توربین 
min_Power=70;%کمترین توان توربین 

به دلیل نداشتن اطلاعات نموداری ارتفاع و خروجی اب برای محاسبه دقیق تر از اطلاعات موجود استفاده گرفتیم و میانیگن انها رو به دست اوردیم برای واقعی تر کردن خروجی توربین ها

Bet_max_and_rat_had=((max_Had-Ratd_Had)/2)+Ratd_Had;%محاسبه ارتفاع بین بیشترین ارتفاع و نامی 
Bet_rat_and_min_had=((Ratd_Had-min_Had)/2)+min_Had;% محاسبه ارتفاع بین ارتفاع و نامی و کمترین ارتفاع 


%///////////محاسبات خروجی توبین در حال های مختلف///////////
Ove_for_Flo=18260*86400 ;%m3 محاسبه میزان خروجی سریز های سد در روز
xx=3*86400; % تبدیل لازم برای محاسبه ۳ توربین در روز
max_Turbine_out=159.54*xx ;%بیشترین خروجی توربین ضرب در ۳ توربین و تعداد ثانیه های یک روز جهت تبدیل به روز
Ratd_Turbine_out=158.42*xx; %خروجی نامی اب سه توربین بر روز
min_Turbine_out=127.95*xx; %کمترین خروجی اب سه توربین بر روز
Bet_max_and_rat_out=(((max_Turbine_out-Ratd_Turbine_out)/2)+Ratd_Turbine_out); %محاسبه خروجی اب بین حالت بیشترین و نامی
Bet_rat_and_min_out=(((Ratd_Turbine_out-min_Turbine_out)/2)+min_Turbine_out); %محاسبه خروجی اب بین حالت نامی و کمترین

%///////////تبخیر سطی اب در اندیمشک///////////
%E=0.35*(e_s-e_d)*(0.5+U_2/100); فرمول استفاده شده
%E=Evaporation mm
U_2=3;% سرعت باد در نظر گرفته شده از سطح ۲ متری اب بر ثانیه
%e_s= فشار بخار اشباع
%e_d= فشار بخار
%e_s-e_d=کمبود فشار بخار
%Relhum=50.3; متوسط سالانه رطوبت هوا در اندیمشک
e_s_e_d_betwin_10_14= 0.7;    % کمبود فشار بخار در دما ۱۰ تا ۱۴ در جه در رطوبت ۵۰
e_s_e_d_betwin_15_19 =1;   % کمبود فشار بخار در دما ۱۵ تا۱۹ در جه در رطوبت ۵۰
e_s_e_d_betwin_20_24=1.3; % کمبود فشار بخار در دما ۲۰ تا ۲۴ در جه در رطوبت ۵۰
e_s_e_d_betwin_25_29=1.8; % کمبود فشار بخار در دما ۲۵ تا ۲۹ در جه در رطوبت ۵۰
e_s_e_d_betwin_30_34=2.4; % کمبود فشار بخار در دما ۳۰ تا ۳۴ در جه در رطوبت ۵۰
e_s_e_d_betwin_35_39=3.1; % کمبود فشار بخار در دما ۳۵ تا ۳۹ در جه در رطوبت ۵۰
e_s_e_d_betwin_40_44=4.1; % کمبود فشار بخار در دما ۴۰ تا ۴۴ در جه در رطوبت ۵۰
e_s_e_d_betwin_45_49=5.3; % کمبود فشار بخار در دما ۴۵ تا ۴۹ در جه در رطوبت ۵۰
e_s_e_d_betwin_50_abov=6.5; %  کمبود فشار بخار در دمای بالاتر از ۵۰ درجه


%///////////Database///////////
data= 'dam_data365.mat'; %ادرس دهی دیتا بیس
load(data) %فرخوانی دیتا بیس

%///////////اطلاعات برگشتی برای حلقه و رسم نمودار///////////
 %zeros ماتریسی  از صفر به سایز زمان مون برمیگردونه
vol_reservoir = zeros(size(time)); %حجم مخزن
vol_reservoir1 = zeros(size(time)); %حجم مخزن برای محاسبه برخی اطلاعات مجبور شدم دوبار حجم مخزن رو بدست بیارم
outflow_discharge = zeros(size(time)); %خروجی کلی اب
vap_per_def = zeros(size(time)); %کمبود فشار بخار
Evaporation = zeros(size(time));  %تبیخر سطی اب
min_vol_tur=zeros(size(time)); %کمترین حجم کارکرد مخزن
max_Vol_res=zeros(size(time)); %بیشترین حجم مخزن
Height=zeros(size(time)); %ارتفاع لحظه ای
Overflow=zeros(size(time));%خروجی اب از توربین ها
Power=zeros(size(time)); %توان هر توربین
%///////////تعریف مقادریر اولیه ///////////
vol_reservoir(1)=mow_Vol;  % حجم اولیه مخزن
vol_reservoir1(1)=mow_Vol; % حجم اولیه مخزن
min_vol_tur(1)=min_vol; % حجم اولیه خروجی از توربین
max_Vol_res(1)=max_Vol; % مقدار بیشترین حجم اولیه مخزن
Height(1)=now_Height; % ارتفاع اولیه 
%///////////فرخوانی اطلاعات از دیتابیس///////////
inflow_discharge=inflow; % حجم ورودی اب 
temp=Temperature; % دما

%///////////حلقه///////////

%%

for i = 2:length(time)    % حلقه به طول زمان در نظر گرفته شده که به صورت دیتابیس هستش . ما از اطلاعات روز دوم برای شروع به کار سد استفاده میکنیم روز اول اطلاعات اولیه ما برای محاسبات هستن

 %///////////انتخاب مقدار درست کمبود فشار بخار با توجه دما///////////
   
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
    

    %///////////محاسبات///////////

    Evaporation(i)=((0.35*(vap_per_def(i)))*(0.5+(U_2/100)))*Length_and_width; 
%محاسبه میزان تبخیر اب در روز مورد نظر
%Evaporation calculation E=0.35*(e_s-e_d)*(0.5+U_2/100)
    vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i)-outflow_discharge(i-1)-Evaporation(i); %محاسبه میزان حج اب مخزن. حجم روز قبل بعلاوه حجم روز جاری منهای خروجی اب روز قبل
    Height(i)=(vol_reservoir(i))/Length_and_width; %محاسبه میزان ارتفاع لحظه ای با توجه به طول و عرض و میزان حجم اب پشت سد

    %///////////انتخاب میزان خروجی اب از توربین ها با توجه به ارتفاع بدست امده  ///////////

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

%///////////محاسبه توان توبین///////////
   
    %P=n*p*g*h*q فرمول توان 
    n=0.9;  %بازده
    p=997 ; %چگالی اب
    g=9.82; %شتاب گرانشی
    h=Height(i); %ارتفاع
    q=(outflow_discharge(i-1)/xx)*0.000001;  %میزان خروجی اب  روز قبل
    Power(i)=n*p*g*h*q;  % محاسبه توان توبین
%//////////////////////

    

    if vol_reservoir(i) <=Evaporation(i) 
        Evaporation(i)=inflow_discharge(i); %اگر ارتفاع اب کوچک تر میزان تبخیر شد . میزان تبیخر اب را برابر با میزان اب ورودی قرار بده.اگر اینکار نکنیم مقداریر منفی بدست میاد 
    end

    if vol_reservoir(i) <=0
        vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i); %اگر حجم اب مخزن کمتر یا برابر با صفر شد حجم مخزن برابر با حجم قبلی بعلاوه میزان اب ورودی قرار بده
    end
    
    Overflow(i)=vol_reservoir(i)-res_vol_fol; %محاسبه میزان اب سریز شده
    if Overflow(i)<=0
         Overflow(i)=0; %اگر میزان سریز کوچک تر یا برابر با صفر قرار گرفت  مقدار ان را برابر با صفر قرار بده این شرط برای جلوگیری از مقادیر منفی قرار داده شده
    end

    if Overflow(i)>Ove_for_Flo  
         beep  %اگر میزان سیلاب بیشتر از مقادیر سریز شد هشدار بده و بوق بزن

    end
    if vol_reservoir(i) >res_vol_fol      
        vol_reservoir(i)=vol_reservoir(i-1)+inflow_discharge(i)-outflow_discharge(i)-Overflow(i); %اگر حجم مخزن بزرگ تر از میازن حجم نگهداری سیلاب شد محاسبات حجم مخزن تغییر بده و به ان میزان خروجی سریز ها را اضافه کن    end

    if vol_reservoir(i) >=max_Vol
        vol_reservoir(i)=max_Vol; % اگر میزان اب بزرگتر از بیشتر حجم مخزن شد میزان حجم مخزن را برابر با حالت ماکس قرار بده
    end
	
    if Height(i)<=0
        Height(i)=0; %اگر ارتفاع کمتر از صفر شد ان را برابر صفر قرار بده این شرط برای جلوگیری از مقدایر منفی قرار داده شده
    end


min_vol_tur(i)=min_vol;  %کمترین حجم مخزن برای رسم خط و نشان دادن از در نمودار
max_Vol_res(i)=max_Vol;  % بیشترین حجم مخزن برای رسم خط و نشان دادن از در نمودار
end
%%

%///////////دستورات رسم نمودار///////////

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





