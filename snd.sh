echo sending $(basename $1) to $2
echo $(basename $1)/$(hostname -I | cut -d' ' -f1) > /tmp/filename_snd
cat /tmp/filename_snd
nc -w 0 $2 12345 < /tmp/filename_snd
cat $1 | bzip2 | nc -l 12345
