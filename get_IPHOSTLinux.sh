for i in {1..255} ;do
  for j in {0,1,2,3} ;do
    IP=`nmap -p22,2342 192.168.$j.$i | grep "open" | awk -F "/" '{print $1}'`
    if [ "$IP" == 22 ] || [ "$IP" == 2342 ]; then
        #echo \"192.168.$j.$i\":$IP
                ssh-keyscan -H 192.168.$j.$i >>~/.ssh/known_hosts
                echo \"192.168.$j.$i\":\"`sshpass -p "padnet" ssh -p$IP root@192.168.$j.$i uname -n`\"

    fi
    done
done