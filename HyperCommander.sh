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
			case $option in
				0)
					echo "Farewell!"
					exit
					;;
				1)
					echo "Not implemented!" 
					main
					;;
				2)
					echo "Not implemented!"
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
