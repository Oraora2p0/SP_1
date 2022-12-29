#!/bin/bash
echo "Программа проверки контрольных сумм CD-дисков"
echo "С помощью данной программы можно проверить контрольную сумму CD-диска"
echo "Разработчик Солопов Никита гр. 728-1"
echo "Файлы в монтированной папке: "
ls /mnt/mydata/


#echo "Были созданы файлы: 1.iso 2.iso 3.iso"
while :
do
echo "Укажите путь к образу, который необходимо проверить"

read -r path
if !(checkisomd5 $path); then
		echo "У файла нет корректной контрольной суммы, делаем?"
	echo -n "y/n: "
	read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
	    if !(implantisomd5 $path); then
	    	echo "Такого файла не существует, проверьте правильность пути и повторите попытку"
	    	fi
	else
	    echo "Ок"
	fi
	echo "Ещё один?"
	echo -n "y/n: "
	read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
	    echo "ещё один!!"
	else
	    echo "До свидания!"
	    exit
	fi
else
	echo "Ещё один?"
	echo -n "y/n: "
	read answer
	if [ "$answer" != "${answer#[Yy]}" ] ;then
		echo "ещё один!!"
	else
		echo "До свидания!"
	exit
fi
fi
done
