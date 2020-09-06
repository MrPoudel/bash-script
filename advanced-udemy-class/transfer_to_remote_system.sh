#!/bin/bash
#ubuntu@ubuntu  ~/hello-cross  cat create_systemd_service.sh 
set -e

# Temp dir needed to create the myService.service
# on the fly and will be deleted after copying
# it to the /etc/systemd/system/
tmp_dir="$(pwd)/temp"

# Exit trap
function cleanup {
  # cleanup code
  echo "Removing $tmp_dir"
  rm -rf $tmp_dir;
}
trap cleanup EXIT

# Create the temp dir
if [[ ! -e $tmp_dir ]]; then
    mkdir $tmp_dir
elif [[ ! -d $tmp_dir ]]; then
    echo "$dst_dir already exists but is not a directory" 1>&2; exit 1
fi

# Create the myService.service file
touch $tmp_dir/myService.service
cat << EOT > $tmp_dir/myService.service
[Unit]
Description=My Hello Service
[Service]
Type=simple
ExecStart=/home/ubuntu/myservice
Restart=on-failure
RestartSec=10
KillMode=process
[Install]
WantedBy=multi-user.target

EOT

# If the file is created succefully then transfer
# the file to /etc/systemd/seystem/

FILE=$tmp_dir/myService.service
if [ -f "$FILE" ]; then 
   cat $FILE | ssh pi@192.168.178.30 "sudo tee -a /etc/systemd/system/myservice.service"   
   #sudo scp  $FILE pi@192.168.178.30:/etc/systemd/system
else 
    echo "$FILE does not exist" 1>&2; exit 1
fi

sleep 1

rm -rf $tmp_dir
