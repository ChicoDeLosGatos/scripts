#!/bin/bash
clear
echo "Se van a realizar cambios en las redes del sistema. Espero que sepas lo que estás haciendo."
echo -e "Para continuar elige una en qué máquina estás:\n\n[0] - Salir del asistente\n[1] - RCO-NoX\n[2] - RCO-X"
echo ""
read -p 'Elige una opción: ' option 
echo ""
case $option in
0) echo "No se ha configurado nada".
echo ""
exit
;;
1) mkdir -p ~/.tmp-files #Estamos en RCO-NoX
echo "Se va a realizar la configuración necesaria para RCO-NoX."
echo 'TYPE="Ethernet"' > ~/.tmp-files/ens33-new.conf 
echo 'PROXY_METHOD="none"' >> ~/.tmp-files/ens33-new.conf 
echo 'BROWSER_ONLY="no"' >> ~/.tmp-files/ens33-new.conf 
echo 'BOOTPROTO="dhcp"' >> ~/.tmp-files/ens33-new.conf 
echo 'DEFROUTE="yes"' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV4_FAILURE_FATAL="no"' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6INIT="no"' >> ~/.tmp-files/ens33-new.conf 
echo '#IPV6_AUTOCONF="yes"' >> ~/.tmp-files/ens33-new.conf 
echo '#IPV6_DEFROUTE="yes"' >> ~/.tmp-files/ens33-new.conf 
echo '#IPV6_FAILURE_FATAL="no"' >> ~/.tmp-files/ens33-new.conf 
echo '#IPV6_ADDR_GEN_MODE="stable-privacy"' >> ~/.tmp-files/ens33-new.conf 
echo 'NAME="ens33"' >> ~/.tmp-files/ens33-new.conf 
echo 'UUID="3b0c93eb-7c90-4170-8514-e1ac53069254"' >> ~/.tmp-files/ens33-new.conf 
echo 'DEVICE="ens33"' >> ~/.tmp-files/ens33-new.conf 
echo 'ONBOOT="yes"' >> ~/.tmp-files/ens33-new.conf 
cp /etc/sysconfig/network-scripts/ifcfg-ens33 ~/.tmp-files/ens33-old.conf 

echo 'TYPE="Ethernet"' > ~/.tmp-files/ens37-new.conf 
echo 'PROXY_METHOD="none"' >> ~/.tmp-files/ens37-new.conf 
echo 'BROWSER_ONLY="no"' >> ~/.tmp-files/ens37-new.conf 
echo 'BOOTPROTO="none"' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV4_FAILURE_FATAL="no"' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV6INIT="no"' >> ~/.tmp-files/ens37-new.conf 
echo 'NAME="ens37"' >> ~/.tmp-files/ens37-new.conf 
echo 'DEVICE="ens37"' >> ~/.tmp-files/ens37-new.conf 
echo 'ONBOOT="yes"' >> ~/.tmp-files/ens37-new.conf 
echo 'IPADDR=10.22.101.2' >> ~/.tmp-files/ens37-new.conf 
echo '#GATEWAY=10.22.101.1' >> ~/.tmp-files/ens37-new.conf 
echo 'DNS1=8.8.8.8' >> ~/.tmp-files/ens37-new.conf 
echo 'DNS2=8.8.4.4' >> ~/.tmp-files/ens37-new.conf 
echo 'PREFIX=24' >> ~/.tmp-files/ens37-new.conf 
echo 'UUID="c5b60d3c-f3f5-4e8d-8267-da3c24dfec47"' >> ~/.tmp-files/ens37-new.conf 
cp /etc/sysconfig/network-scripts/ifcfg-ens37 ~/.tmp-files/ens37-old.conf 

echo '127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4' > ~/.tmp-files/hosts-new.conf 
echo '::1         localhost localhost.localdomain localhost6 localhost6.localdomain6' >> ~/.tmp-files/hosts-new.conf 
echo '' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 rco-nox.redescorporativas.es rco-nox' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 w001.redescorporativas.es' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 x001.redescorporativas.es' >> ~/.tmp-files/hosts-new.conf 
echo '' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.140 rco-x.redescorporativas.es rco-x' >> ~/.tmp-files/hosts-new.conf 
cp /etc/hosts ~/.tmp-files/hosts-old.conf 

echo "-------------------------------------------"
echo "        CONFIGURACIÓN ACTUAL (NoX):"
echo "-------------------------------------------"
echo "         INTERFAZ ENS33 (NoX)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens33-old.conf 
echo "-------------------------------------------"
echo "         INTERFAZ ENS37 (NoX)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens37-old.conf 
echo "-------------------------------------------"
echo ""
echo ""
echo "-------------------------------------------"
echo "        NUEVA CONFIGURACIÓN (NoX):"
echo "-------------------------------------------"
echo "         INTERFAZ ENS33 (NoX)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens33-new.conf 
echo "-------------------------------------------"
echo "         INTERFAZ ENS37 (NoX)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens37-new.conf 
echo "-------------------------------------------"
echo ""
echo ""
echo "-------------------------------------------"
echo "         ANTIGUOS HOSTS (NoX):"
echo "-------------------------------------------"
cat ~/.tmp-files/hosts-old.conf
echo "-------------------------------------------"
echo "" 
echo ""
echo "-------------------------------------------"
echo "         NUEVOS HOSTS (NoX):"
echo "-------------------------------------------"
cat ~/.tmp-files/hosts-new.conf
echo "-------------------------------------------"
echo ""
echo ""
echo "Es recomendable revisar la configuración actual y la que se aplicará al finalizar el asistente. Aquí tienes toda la información."
echo ""
read -p 'Pulsa cualquier botón para continuar con la actualización, o escapa el comando con Ctrl-C.' pause
;;
2) mkdir -p ~/.tmp-files  #Estamos en RCO-X
echo "Se va a realizar la configuración necesaria para RCO-X."
echo 'TYPE=Ethernet' > ~/.tmp-files/ens33-new.conf 
echo 'PROXY_METHOD=none' >> ~/.tmp-files/ens33-new.conf 
echo 'BROWSER_ONLY=no' >> ~/.tmp-files/ens33-new.conf 
echo 'BOOTPROTO=dhcp' >> ~/.tmp-files/ens33-new.conf 
echo 'DEFROUTE=yes' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV4_FAILURE_FATAL=no' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6INIT=yes' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6_AUTOCONF=yes' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6_DEFROUTE=yes' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6_FAILURE_FATAL=no' >> ~/.tmp-files/ens33-new.conf 
echo 'IPV6_ADDR_GEN_MODE=stable-privacy' >> ~/.tmp-files/ens33-new.conf 
echo 'NAME=ens33' >> ~/.tmp-files/ens33-new.conf 
echo 'UUID=62b6f018-9b36-4ad3-b13c-ba10b8978351' >> ~/.tmp-files/ens33-new.conf 
echo 'DEVICE=ens33' >> ~/.tmp-files/ens33-new.conf 
echo 'ONBOOT=yes' >> ~/.tmp-files/ens33-new.conf 
cp /etc/sysconfig/network-scripts/ifcfg-ens33 ~/.tmp-files/ens33-old.conf 

echo 'TYPE=Ethernet' > ~/.tmp-files/ens37-new.conf 
echo 'PROXY_METHOD=none' >> ~/.tmp-files/ens37-new.conf 
echo 'BROWSER_ONLY=no' >> ~/.tmp-files/ens37-new.conf 
echo 'BOOTPROTO=none' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV4_FAILURE_FATAL=no' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV6INIT=no' >> ~/.tmp-files/ens37-new.conf 
echo 'NAME=ens37' >> ~/.tmp-files/ens37-new.conf 
echo 'DEVICE=ens37' >> ~/.tmp-files/ens37-new.conf 
echo 'ONBOOT=yes' >> ~/.tmp-files/ens37-new.conf 
echo 'DEFROUTE=yes' >> ~/.tmp-files/ens37-new.conf 
echo 'UUID=4a5516a4-dfa4-24af-b1c4-e843e312e2fd' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV6_DEFROUTE=yes' >> ~/.tmp-files/ens37-new.conf 
echo 'IPV6_FAILURE_FATAL=no' >> ~/.tmp-files/ens37-new.conf 
echo 'IPADDR=10.22.101.102' >> ~/.tmp-files/ens37-new.conf 
echo 'PREFIX=24' >> ~/.tmp-files/ens37-new.conf 
echo 'PEERDNS=no' >> ~/.tmp-files/ens37-new.conf 
cp /etc/sysconfig/network-scripts/ifcfg-ens37 ~/.tmp-files/ens37-old.conf 

echo '127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4' > ~/.tmp-files/hosts-new.conf 
echo '::1         localhost localhost.localdomain localhost6 localhost6.localdomain6' >> ~/.tmp-files/hosts-new.conf 
echo '' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 rco-nox.redescorporativas.es rco-nox' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 w001.redescorporativas.es' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.139 x001.redescorporativas.es' >> ~/.tmp-files/hosts-new.conf 
echo '' >> ~/.tmp-files/hosts-new.conf 
echo '192.168.18.140 rco-x.redescorporativas.es rco-x' >> ~/.tmp-files/hosts-new.conf 
cp /etc/hosts ~/.tmp-files/hosts-old.conf 

echo "-------------------------------------------"
echo "        CONFIGURACIÓN ACTUAL (X):"
echo "-------------------------------------------"
echo "         INTERFAZ ENS33 (X)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens33-old.conf 
echo "-------------------------------------------"
echo "         INTERFAZ ENS37 (X)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens37-old.conf 
echo "-------------------------------------------"
echo ""
echo ""
echo "-------------------------------------------"
echo "        NUEVA CONFIGURACIÓN (X):"
echo "-------------------------------------------"
echo "         INTERFAZ ENS33 (X)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens33-new.conf 
echo "-------------------------------------------"
echo "         INTERFAZ ENS37 (X)"
echo "-------------------------------------------"
cat ~/.tmp-files/ens37-new.conf 
echo "-------------------------------------------"
echo ""
echo ""
echo "-------------------------------------------"
echo "         ANTIGUOS HOSTS (X):"
echo "-------------------------------------------"
cat ~/.tmp-files/hosts-old.conf
echo "-------------------------------------------"
echo "" 
echo ""
echo "-------------------------------------------"
echo "         NUEVOS HOSTS (X):"
echo "-------------------------------------------"
cat ~/.tmp-files/hosts-new.conf
echo "-------------------------------------------"
echo ""
echo ""
echo "Es recomendable revisar la configuración actual y la que se aplicará al finalizar el asistente. Aquí tienes toda la información."
echo ""
read -p 'Pulsa cualquier botón para continuar con la actualización, o escapa el comando con Ctrl-C.' pause
;;
esac
echo ""
#Si para cuando se llega aquí, el usuario no ha pulsado Ctrl-C significa que se deben aplicar los cambios.
echo -ne "Actualizando interfaz ens33"
for i in {1..5}
do
   echo -ne "."
   sleep 1
done
cat ~/.tmp-files/ens33-new.conf > /etc/sysconfig/network-scripts/ifcfg-ens33
rm ~/.tmp-files/ens33-new.conf
echo "Interfaz ens33 actualizada."
echo -ne "Actualizando interfaz ens37"
for i in {1..5}
do
   echo -ne "."
   sleep 1
done
cat ~/.tmp-files/ens37-new.conf > /etc/sysconfig/network-scripts/ifcfg-ens37
rm ~/.tmp-files/ens37-new.conf
echo "Interfaz ens37 actualizada."
echo -ne "Actualizando hosts"
for i in {1..3}
do
   echo -ne "."
   sleep 1
done
cat ~/.tmp-files/hosts-new.conf > /etc/hosts
rm ~/.tmp-files/hosts-new.conf
echo "Hosts actualizados."
echo ""
echo "Configuración realizada."
echo ""
echo "Se ha realizado una copia de seguridad de las antiguas configuraciones de las interfaces y los hosts en el directorio: ~/.tmp-files"
echo ""
echo "Se va a cerrar el asistente. Que tengas un buen dia y bebe mucha agüita."
echo ""
exit
