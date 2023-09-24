#!/bin/bash

error() {
	echo "------------------------------------------------------------------"
	echo "Comparte la señal entrante por un dispositivo en otro, por ejemplo"
	echo "WLAN0 de la wifi hacia la eth0 o tarjeta de red"
	echo "------------------------------------------------------------------"
  echo "Uso: <Dispositivo Internet o Senal Entrante> <Dispositivo que compartira la senal entrante o Internet>"
}

habilitaforward() {
	sudo sysctl -w net.ipv4.ip_forward=1
}

internet () {
	sudo iptables --table nat --append POSTROUTING --out-interface $1 -j MASQUERADE
	sudo iptables -t nat -I POSTROUTING -o $1 -j MASQUERADE
	echo "Configurado Senal Entrante o Internet $1"
}

compartido () {
	sudo iptables --append FORWARD --in-interface $1 -j ACCEPT
	echo "Configurado Dispositivo que Compartira $1"
}


#Ensure we have the quantity specified on the CLI
if [ -z "$2" ]; then ARG_ERR=ERR; fi
if [ -z "$1" ]; then ARG_ERR=ERR; fi
if [ -n "$ARG_ERR" ];
then
		error
    exit
else
	habilitaforward
	internet $1
	compartido $2
fi
