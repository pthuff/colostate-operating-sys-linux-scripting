#04-hello-1
#!/bin/bash
#Paul Huff
#Displays hello and date

echo "Hello. "
echo `date`

#04-hello-2
#!/bin/bash
#Paul Huff
#Receives an input of a name, displays name and date

date=`date "+%d %b %Y"`
echo -e "Hello, $1! \nToday is $date."

#04-hello-3
#!/bin/bash
#Paul Huff
#Receives an input of a name, displays name and date

if [ $# -eq 1 ]
then
date=`date "+%d %b, of %Y"`
echo -e "Hello, $1! \nToday is $date."
else
echo -e "USAGE: 04-hello-3 <name>\nWhere <name> is the name of the person running the script.\nEx: hello-3 Sally"
fi

#05-month-name
#!/bin/bash
#Paul Huff
#Receives an input of a month number, displays associated month name

if [ "$#" -ne 1 ]
then
echo -e "USAGE: 05-month-name <month num>\nEx: 05-month-num Nov"
exit 1
else

if [ "$1" = 1 ]
then
echo "The name of month $1 is Jan."

elif [ "$1" = 2 ]
then
echo "The name of month $1 is Feb."

elif [ "$1" = 3 ]
then
echo "The name of month $1 is Mar."

elif [ "$1" = 4 ]
then
echo "The name of month $1 is Apr."

elif [ "$1" = 5 ]
then
echo "The name of month $1 is May."

elif [ "$1" = 6 ]
then
echo "The name of month $1 is Jun."

elif [ "$1" = 7 ]
then
echo "The name of month $1 is Jul."

elif [ "$1" = 8 ]
then
echo "The name of month $1 is Aug."

elif [ "$1" = 9 ]
then
echo "The name of month $1 is Sep."

elif [ "$1" = 10 ]
then
echo "The name of month $1 is Oct."

elif [ "$1" = 11 ]
then
echo "The name of month $1 is Nov."

elif [ "$1" = 12 ]
then
echo "The name of month $1 is Dec."

else
echo "Bad month number. <month number> must be an integer in the range 1-12."

fi
fi

#05-month-num
#!/bin/bash
#Paul Huff
#Receives an input of a month name, displays associated month number
if [ "$#" -ne 1 ]
then
echo -e "USAGE: 05-month-num <month name>\nEx: 05-month-num Nov"
exit 1
else

case $1 in
"January" | "Jan")
echo "The month number for $1 is 1."
;;

"February" | "Feb")
echo "The month number for $1 is 2."
;;

"March" | "Mar")
echo "The month number for $1 is 3."
;;

"April" | "Apr")
echo "The month number for $1 is 4."
;;

"May")
echo "The month number for $1 is 5."
;;

"June" | "Jun")
echo "The month number for $1 is 6."
;;

"July" | "Jul")
echo "The month number for $1 is 7."
;;

"August" | "Aug")
echo "The month number for $1 is 8."
;;

"September" | "Sep")
echo "The month number for $1 is 9."
;;

"October" | "Oct")
echo "The month number for $1 is 10."
;;

"November" | "Nov")
echo "The month number for $1 is 11."
;;

"December" | "Dec")
echo "The month number for $1 is 12."
;;

*)
echo -e "Bad month name. <month name> must be one of the following: \n“January”, “February”, “March”, “April”, “May”, “June”, \n“July”, “August”, “September”, “October”, “November”, or “December”, \nor the first 3 characters of any of these names (Ex: “Nov”)."
;;

esac
fi

#06-permissions
#!/bin/bash
#Paul Huff
#Receives an input file or directory, validates if the file/directory exists and persmissions assigned

if [ "$#" -ne 1 ]
then
echo -e "USAGE: 06-permissions <file> \nWhere <file> is the name of the file or directory the script should access.\nEx: 06-permissions ~turk/NetworkingClass/sampleNames"
exit 1
else
echo "thePath=["$1"]"

if [ ! -e "$1" ]
then
echo "That path does not exist."
exit 2
else
exists=1

if [ -d "$1" ]
then
directory=1
else
directory=0
fi

if [ -f "$1" ]
then
regFile=1
else
regFile=0
fi

if [ -s "$1" ]
then
size=1
else
size=0
fi

if [ -r "$1" ]
then
read=1
else
read=0
fi

if [ -w "$1" ]
then
write=1
else
write=0
fi

if [ -x "$1" ]
then
execute=1
else
execute=0
fi

echo -e "exists="$exists"\ndirectory="$directory"\nregFile="$regFile"\nsize="$size"\nread="$read"\nwrite="$write"\nexecute="$execute
fi
fi

#07-listWithLineNumbers
#!/bin/bash
#Paul Huff
#Receives an input file of x lines, assigns a line number to each line

if [ "$#" -ne 1 ]
then
echo -e "USAGE: 07-listWithLineNumbers <file> \nWhere <file> is the name of the file or directory the script should access.\nEx: 07-listWithLineNumbers ~turk/NetworkingClass/people"
exit 1
else

if [ ! -e "$1" ]
then
echo "That path does not exist."
exit 2
else
exists=1

if [ -f "$1" -a exists=1 ]
then
thePath=$1
lineCount=1
cat $thePath | \

while read line; do
echo $lineCount':' "'"$line"'"
((lineCount++))
done
fi
fi
fi

#08-numMajors
#!/bin/bash
#Paul Huff
#Receives an input file of enrollments, displays the number of students for each major

if [ "$#" -ne 1 ]
then
echo -e "USAGE: 08-numMajors <file> \nWhere <file> is the name of the file or directory the script should access.\nEx: 08-numMajors ~turk/NetworkingClass/08-ClassEnrollment-CIS350.txt"
exit 1
else

if [ ! -e "$1" ]
then
echo "ERROR: file '$1' does not exist."
exit 2
else
exists=1

if [ -f "$1" -a exists=1 ]
then
sort --key 3 -t, $1 | cut -d"," -f3 | uniq -c  > sortedEnrollments

cat sortedEnrollments | \
while read line; do
if [[ $line =~ 1 ]]
then
echo "There is "$line" major."
elif [[ $line =~ 0 ]]
then
echo "There are no "$line" majors."
else
echo "There are "$line" majors."
fi
done
rm sortedEnrollments
fi
fi
fi

#09-firstLastLogout
#!/bin/bash
#Paul Huff
#Receives an input file of wtmp log file, displays first and last logged in

if [ "$#" -eq 0 ]
then
last > tmp
last $USER > tmpMe

elif [ "$#" -ge 2 ]
then
echo -e "ERROR: Incorrect number of parameters.\nUSAGE: 09-firstLastLogout [ <wtmp file path> ]\nEx: 09-firstLastLogout ~turk/NetworkingClass/var_log_wtmp-20161109131200"
exit 1

elif [ ! -e "$1" -a "$#" -ne 0 ]
then
echo "ERROR: file '$1' does not exist."
exit 2

else
exists=1
last -f $1 > tmp
last -f $1 $USER > tmpMe
fi

if [ -f "$1" -a exists=1 ] || [ "$#" -eq 0 ]
then
grep -vwE "(reboot|gone|still|begins)" tmp > tmpWtmp
grep -vwE "(reboot|gone|still|begins)" tmpMe > tmpWtmpMe
lastLogin=$(head -1 tmpWtmp)
lastLName=$(head -n1 tmpWtmp | cut -d" " -f1)
lastDate=$(head -n1 tmpWtmp | cut -d" " -f19-21)
lastTimeout=$(head -n1 tmpWtmp | cut -d" " -f24)
firstLogin=$(tail -n2 tmpWtmp | head -n1)
firstLName=$(tail -n2 tmpWtmp | head -n1 | cut -d" " -f1)
firstDate=$(tail -n2 tmpWtmp | head -n1 | cut -d" " -f19-21)
firstTimeout=$(tail -n2 tmpWtmp | head -n1 | cut -d" " -f24)
meLogin=$(head -1 tmpWtmpMe)
meLName=$(head -n1 tmpWtmpMe | cut -d" " -f1)
meDate=$(head -n1 tmpWtmpMe | cut -d" " -f19-21)
meTimeout=$(head -n1 tmpWtmpMe | cut -d" " -f24)
totalUsers=$(sort --key 1 -t, tmpWtmp | cut -d" " -f1 | wc -l)
uniqueUsers=$(sort --key 1 -t, tmpWtmp | cut -d" " -f1 | uniq -c | wc -l)
startDate=$(tail -n1 tmp | cut -d" " -f3-8)
endDate=$(head -n1 tmpWtmp | cut -d" " -f19-21,24-24)

echo "Script: '09-firstLastLogout' at ""'"`date`"'."
echo "Input: '$1'."
echo "Running: 'last -f $1'."
echo -e "\nThere were $uniqueUsers unique users logged on \nout of $totalUsers logins/outs \nduring the time period covered in the wtmp data \n('$1'), \n'$startDate' to '$endDate'."
echo -e "\nThe analysis below does not include those who were still logged on or those who were gone but had not logged out when this log was captured, nor does it include any "'"reboot"'" records."
echo -e "\nThe first person to log out was:\n\n'$firstLogin'.\nLOGINNAME='$firstLName'.\nREALNAME='$firstLName'.\nDATE='$firstDate'.\nTIMEOUT='$firstTimeout'."
echo -e "\nThe last person to log out was:\n\n'$lastLogin'.\nLOGINNAME='$lastLName'.\nREALNAME='$lastLName'.\nDATE='$lastDate'.\nTIMEOUT='$lastTimeout'."
echo -e "\nYou last logged out:\n\n'$meLogin'.\nLOGINNAME='$meLName'.\nREALNAME='$meLName'.\nDATE='$meDate'.\nTIMEOUT='$meTimeout'."
rm tmp
rm tmpMe
rm tmpWtmp
rm tmpWtmpMe
fi

#10-liveHosts-ping
#!/bin/bash
#Paul Huff
#Receives an input of range of IP addresses, pings each address

if [ "$#" -ne 3 ]
then
echo -e "USAGE: 10-liveHosts-ping <IP range> \nWhere <IP range> is a range of IP addresses to ping.\nEx: 10-liveHosts-ping 10.3.50 18 23"
exit 1
else

network=$1
alive=0
dead=0
range=""

for i in $(seq $2 $3);
do range+=" ${i}";
done
echo "Checking: $network.$range"

echo "Live hosts:"
for i in $(seq $2 $3);
do ping -c 1 "$network.${i}" > /dev/null;
if [ $? -eq 0 ];
then
echo -e "\t$network.$i"
((alive++))
else
((dead++))
fi
done

echo -e "\nThere were:"
echo -e "\t$alive alive hosts"
echo -e "\t$dead not alive hosts"
echo -e "\tfound through the use of 'ping'."
fi

#10-liveHosts-nmap
#!/bin/bash
#Paul Huff
#Receives an input of subnet range, scans each address

if [ "$#" -ne 2 ]
then
echo -e "USAGE: 10-liveHosts-nmap <subnet range> \nWhere <subnet range> is the range in / notation.\nEx: 10-liveHosts-nmap 10.3.50.0 /24"
exit 1
else

network=$1
subnet=$2

echo "Checking: $network.$subnet"

nmap -sn -n -v $network$subnet -oG -> nmapTmp
grep -vwE "(scan|done|Ports|Down)" nmapTmp > nmapHosts
sed -i 's/^/\t/' nmapHosts
alive=$(grep -r "Up" nmapTmp | wc -l)
dead=$(grep -r "Down" nmapTmp | wc -l)

echo -e "\nLive hosts:"
echo -e "$(cat nmapHosts)"
echo -e "\nThere were:"
echo -e "\t$alive alive hosts"
echo -e "\t$dead not alive hosts"
echo -e "\tfound through the use of 'nmap'."
rm nmapTmp
rm nmapHosts
fi
