echo Waiting..
echo $HOSTNAME | nc -l 12345 > /tmp/filename_rcv; cat /tmp/filename_rcv
echo Raw information : $(cat /tmp/filename_rcv)
file_to_rcv=$(cat /tmp/filename_rcv | cut -d'/' -f1)
ip_of_sndr=$(cat /tmp/filename_rcv | cut -d'/' -f2)
echo Receiving $file_to_rcv from $ip_of_sndr
nc -w 1 $ip_of_sndr 12345 | bunzip2 -c > ~/Téléchargements/$file_to_rcv
