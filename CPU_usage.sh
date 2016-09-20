# get cpu usage:
myCPU=`top -l 1 | awk '/CPU usage/ {print $3}' | sed s/%//`
#echo $myCPU
# lose that less then zero
myCPU=`echo "tmp=$myCPU; tmp /= 1; tmp" | bc`
#echo $myCPU

# set mim cpu_usage



typeset -i b=2
echo "CPU Usage \t\t\c"

# color in froeground:

while [ $b -lt $myCPU ]
do
	echo "\033[1;35m▇\033[0m\c"
	b=`expr $b + 10`
done

# then color in background:

while [ $b -lt 99 ]
do
	echo "\033[1;33m▇\033[0m\c"
	b=`expr $b + 10`
done
echo "	$myCPU%\c"

unset myCPU
unset b

#============ for mem:

myUsedMem=`top -l 1 | awk '/PhysMem/ {print $2}' | sed s/M// `
myFreeMem=`top -l 1 | awk '/PhysMem/ {print $6}' | sed s/M// `
myActiveMem_0=`top -l 1 | awk '/PhysMem/ {print $4}' | sed s/M// `
myActiveMem=${myActiveMem_0#(}
myTotalMem=` expr $myUsedMem + $myFreeMem`
myUsedPer=`echo |awk '{printf ("%2.0f", f/t*100)}' f=$myActiveMem t=$myTotalMem`
echo ""
myUsedPer=`echo "tmp=$myUsedPer; tmp /= 1; tmp" | bc`
#echo $myUsedPer

typeset -i c=2
echo "Memory Usage \t\c"
while [ $c -lt $myUsedPer ]
do
        echo "\033[0;35m▇\033[0m\c"
        c=`expr $c + 10`
done
while [ $c -lt 99 ]
do
        echo "\033[1;33m▇\033[0m\c"
        c=`expr $c + 10`
done
echo "	$myUsedPer%\c"

echo "\r"

unset myUsedMem
unset myFreeMem
unset myTotalMem
unset myUsedPer
unset c


#=================================================== color code




#You can use these ANSI escape codes:

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
#And then use them like this in your script:

#RED='\033[0;31m'
#NC='\033[0m' # No Color
#printf "I ${RED}love${NC} Stack Overflow\n"
