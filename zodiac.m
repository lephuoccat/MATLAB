clear
m = input('Give your month: ');
n = input('Give your day: ');
if m==3 && n>=21 && n<=31 || m==4 && n>=1 && n<=19
    'Aries_BachDuong'
elseif m==4 & n >=20 & n<=30 | m==5 & n>=1 & n<=20
    'Taurus_KimNguu'
elseif m==5 & n>=21 & n<=31 | m==6 & n>=1 & n<= 21
    'Gemini_SongTu'
elseif m==6 & n>=22 & n<=30 | m==7 & n>=1 & n<=22
    'Cancer_CuGiai'
elseif m==7 & n>=23 & n<=31 | m==8 & n>=1 & n<=22
    'Leo_SuTu'
elseif m==8 & n>=23 & n<=31 | m==9 & n>=1 & n<=22
    'Virgo_XuNu'
elseif m==9 & n>=23 & n<=30 | m==10 & n>=1 & n<=23
    'Libra_ThienBinh'
elseif m==10 & n>=24 & n<=31 | m==11 & n>=1 & n<= 21
    'Scorpio_HoCap'
elseif m==11 & n>=22 & n<=30 | m==12 & n>=1 & n<=21
    'Sagittarius_NhanMa'
elseif m==12 & n>=22 & n<=31 | m==1 & n>=1 & n<=19
    'Capricornus_MaKet'
elseif m==1 & n>=20 & n<=31 | m==2 & n>=1 & n<=18
    'Aquarius_BaoBinh'
else
    'Pisces_SongNgu'
end
