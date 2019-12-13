#set xlabel 's'
#set ylabel 'Power absorption density (MW/m3)'
unset key
plot [:] [0:2] 'f71_DT_15_last' u 2:($4/1e6) w l title 'Tritium15' 
replot 'f71_DT_15_last' u 2:($7/1e6) w l title 'Electrons15'
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($4/1e6) w l title 'Tritium25'
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($7/1e6) w l title 'Electrons25'
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($4/1e6) w l title 'Tritium35'
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($7/1e6) w l title 'Electrons35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Pabsprofile_DT_all.svg'
replot
reset
unset terminal

#set xlabel 's'
#set ylabel 'Collisional power density (MW/m3)'
unset key
plot 'f71_DT_15_last' u 2:($8/1e6) w l title 'Ion-Ion15' 
replot 'f71_DT_15_last' u 2:($9/1e6) w l title 'Ion-Electrons15'
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($8/1e6) w l title 'Ion-Ion25'
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($9/1e6) w l title 'Ion-Electrons25'
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($8/1e6) w l title 'Ion-Ion35'
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($9/1e6) w l title 'Ion-Electrons35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Pcollprofile_DT_all.svg'
replot
reset
unset terminal

#set xlabel 'Time (s)'
#set ylabel 'Collisional Power (MW)'
unset key
plot 'f70_DT_15' u 1:($7/1e6) w l title 'Ions15' 
replot 'f70_DT_15' u 1:($8/1e6) w l title 'Electrons15'
replot 'f70_DT_15' u 1:($6/1e6) w l title 'DElectron15'
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($7/1e6) w l title 'Ions25'
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($8/1e6) w l title 'Electrons25'
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($6/1e6) w l title 'DElectron25'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($7/1e6) w l title 'Ions35'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($8/1e6) w l title 'Electrons35'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($6/1e6) w l title 'DElectron35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Pcoll_DT_all.svg'
replot
reset
unset terminal

#set xlabel 'Time (s)'
#set ylabel 'Power absorption (MW)'
unset key
plot [:] [0:5] 'f70_DT_15' u 1:($3/1e6) w l title 'Ions15' 
replot 'f70_DT_15' u 1:($6/1e6) w l title 'Electrons15'
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($3/1e6) w l title 'Ions25'
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($6/1e6) w l title 'Electrons25'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($3/1e6) w l title 'Ions35'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($6/1e6) w l title 'Electrons35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Pabs_DT_all.svg'
replot
reset
unset terminal

#set xlabel 'Time (s)'
#set ylabel 'Fast ion energy (MJ)'
unset key
plot [:] [0:4] 'f70_DT_15' u 1:($15/1e6) w l title '15' 
replot '../pion92398_DT_25_2/f70_DT_25' u 1:($15/1e6) w l title '25'
replot '../pion92398_DT_35_2/f70_DT_35' u 1:($15/1e6) w l title '35' 
set terminal svg enhanced font 'Helvetica, 20'
set output 'Fastenergy_DT_all.svg'
replot
reset
unset terminal

#set xlabel 'Time (s)'
#set ylabel 'Fast ion energy density (MJ/m3)'
unset key
plot [:] [0:0.4] 'f71_DT_15_last' u 2:($19/1e6) w l title '' 
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($19/1e6) w l title '25' 
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($19/1e6) w l title '35' 
set terminal svg enhanced font 'Helvetica, 20'
set output 'Fastenergyprofile_DT_all.svg'
replot
reset
unset terminal

#set xlabel 's'
#set ylabel 'Average energy per fast particle (keV)'
unset key
plot [:] [0:450] 'f71_DT_15_last' u 2:($19/$17/1.6e-19/1e3) w l title '' 
replot '../pion92398_DT_25_2/f71_DT_25_last' u 2:($19/$17/1.6e-19/1e3) w l title '25' 
replot '../pion92398_DT_35_2/f71_DT_35_last' u 2:($19/$17/1.6e-19/1e3) w l title '35' 
set terminal svg enhanced font 'Helvetica, 20'
set output 'AverageFastenergyprofile_DT_all.svg'
replot
reset
unset terminal

#set xlabel 'Energy (MeV)'
#set ylabel 'ln(F)'
unset key
plot [0:9] [-40:-25] 'DFunction_2_1_DT_15' u ($1/1e6):2 w l title 's = 0.0-15' 
replot 'DFunction_2_6_DT_15' u ($1/1e6):2 w l title 's = 0.25-15'
replot '../pion92398_DT_25_2/DFunction_2_1_DT_25' u ($1/1e6):2 w l title 's = 0.0-25'
replot '../pion92398_DT_25_2/DFunction_2_6_DT_25' u ($1/1e6):2 w l title 's = 0.25-25'
replot '../pion92398_DT_35_2/DFunction_2_1_DT_35' u ($1/1e6):2 w l title 's = 0.0-35'
replot '../pion92398_DT_35_2/DFunction_2_6_DT_35' u ($1/1e6):2 w l title 's = 0.25-35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Function_DT_15_all.svg'
replot
reset
unset terminal

set xlabel 'Energy (MeV)'
set ylabel 'ln(F)'
plot [0.1:9] [:] 'DFunction_2_1_DT_15' u ($1/1e6):(exp($2)) w l title 's = 0.0-15' 
replot 'DFunction_2_6_DT_15' u ($1/1e6):(exp($2)) w l title 's = 0.25-15'
replot '../pion92398_DT_25_2/DFunction_2_1_DT_25' u ($1/1e6):(exp($2)) w l title 's = 0.0-25'
replot '../pion92398_DT_25_2/DFunction_2_6_DT_25' u ($1/1e6):(exp($2)) w l title 's = 0.25-25'
replot '../pion92398_DT_35_2/DFunction_2_1_DT_35' u ($1/1e6):(exp($2)) w l title 's = 0.0-35'
replot '../pion92398_DT_35_2/DFunction_2_6_DT_35' u ($1/1e6):(exp($2)) w l title 's = 0.25-35'
set terminal svg enhanced font 'Helvetica, 20'
set output 'Function_DT_15_all_prova.svg'
replot
reset
unset terminal
