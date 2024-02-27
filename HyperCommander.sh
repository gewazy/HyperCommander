#! /bin/bash

menu="------------------------------
| Hyper Commander            |
| 0: Exit                    |
| 1: OS info                 |
| 2: User info               |
| 3: File and Dir operations |
| 4: Find Executables        |
------------------------------"


main() {
	echo ''
	echo "$menu"
	read option

	while true
		do
			echo ''
			case $option in
				0)
					echo "Farewell!"
					exit
					;;
				1)
					uname -on 
					main
					;;
				2)
					whoami
					main
					;;
				3) 
					echo "Not implemented!"
					main
					;;
				4)
					echo "Not implemented!"
					main
					;;
				*)
					echo "Invalid option!"
					main
					;;
			esac
		done
			
}


echo "Hello ${USER}!"
main
