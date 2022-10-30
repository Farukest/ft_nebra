echo 'START...'

echo 'HERŞEY BAŞTAN KURULUYOR SAKİN OL :) ...'

# ftfolder=/home/ft
# if [ -d "$ftfolder" ]; then
	# echo 'FT KLASORU SILINIYOR ...'
	# rm -rf /home/ft/
# fi

# ftfolder1=/home/ft_sensecap
# if [ -d "$ftfolder1" ]; then
	# echo 'FT KLON KLASORU SILINIYOR ...'
	# rm -rf /home/ft_sensecap/
# fi

# cd /home/ && git clone https://github.com/Farukest/ft_sense_usa_up.git ft

chmod 777 /home/ft/hs_ft_pf_conf.json
sed -i 's/replace_collector_address/'"${collector_address}"'/g' /home/ft/hs_ft_pf_conf.json

chmod 777 /home/ft/ftmiddle_configs/conf1.json
sed -i 's/"replace_listen_port_address"/'${listen_port}'/g' /home/ft/ftmiddle_configs/conf1.json

chmod 777 /home/ft/ftmiddle_configs/conf1.json
sed -i 's/"replace_gateway_id"/"'${gateway_ID}'"/g' /home/ft/ftmiddle_configs/conf1.json

sleep 1

chmod 700 /home/ft/first.sh
cd /home/ft/ && ./first.sh


echo 'Jobs adding to cron..'
cd /home/ft/ && ./addcron.sh

service cron restart

mount -o rw,remount /home/ft/logs/

echo 'SUCCESS THAT IS ALL..'

while true; do sleep 1; done