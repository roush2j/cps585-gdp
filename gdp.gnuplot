# rGDP
set terminal png size 600,400
set output "img/rgdp.png"

set title "U.S. Real GDP" font "sans, 16"
set style line 1 lc rgb 'blue' pt 7 ps 0.3
set style line 2 lc rgb 'red' pt 7 ps 0.3
set key top left reverse Left
set datafile separator ","

set xlabel "Quarter" font "sans, 12"
set xdata time
set timefmt '%d%b%Y'
set xtics format '%Y'
set xtics "01JAN1965", 315576000
set xrange ["01JAN1965":"01JAN2015"]

set ylabel "rGDP (Trillion USD)" font "sans, 12"
set yrange [0:]
set ytics nomirror

plot 'prjdata.txt' every ::1 using 1:(10**($2-12)) with linespoints ls 1 notitle;

# Model fit
set output "img/model1-rgdp-fit.png"

set title "U.S. Real GDP - Model Fit" font "sans, 16"

plot 'prjdata.txt' every ::1 using 1:(10**($2-12)) with line ls 1 title "rGDP",  \
    'prjdata.txt' every 4::7 using 1:(10**($3-12)):(10**($6-12)):(10**($7-12)) with yerrorlines ls 2 title "Model";

# LOG rGDP
set output "img/log-rgdp.png"

set title "LOG Real GDP" font "sans, 16"

set ylabel "LOG(rGDP)" font "sans, 12"
set autoscale y

plot 'prjdata.txt' every ::1 using 1:2 with linespoints ls 1 notitle;

# First difference of LOG rGDP
set output "img/fd-log-rgdp.png"

set title "First Difference of LOG Real GDP" font "sans, 16"

set ylabel "LOG'(rGDP)" font "sans, 12"
d(y) = ($0 == 0) ? (y1 = y, 1/0) : (y2 = y1, y1 = y, y1-y2)

plot 'prjdata.txt' every ::1 using 1:(d($2)) with linespoints ls 1 notitle;

# rGDP Forecast
set output "img/model1-rgdp-forecast.png"

set title "U.S. Real GDP - Model Forecast" font "sans, 16"

set ylabel "rGDP (Trillion USD)" font "sans, 12"

set xtics "01JAN2010", 31557600
set xrange ["01JAN2010":"01JAN2018"]

plot 'prjdata.txt' every ::1 using 1:(10**($2-12)) with line ls 1 title "rGDP",  \
    'prjdata.txt' every ::7 using 1:(10**($3-12)):(10**($6-12)):(10**($7-12)) with yerrorlines ls 2 title "Model";