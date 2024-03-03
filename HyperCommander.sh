#! /bin/bash

menu="
------------------------------
| Hyper Commander            |
| 0: Exit                    |
| 1: OS info                 |
| 2: User info               |
| 3: File and Dir operations |
| 4: Find Executables        |
------------------------------"

file_menu="
---------------------------------------------------
| 0 Main menu | 'up' To parent | 'name' To select |
---------------------------------------------------"

file_operation_menu="
---------------------------------------------------------------------
| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |
---------------------------------------------------------------------
"


exe_opration() {
    echo -e "Enter an executable name:\n"
    read exe_name
    if [[ $(which $exe_name 2>/dev/null) ]]; then
        echo -e "\nLocated in: $(which $exe_name)\n"
        echo "Enter arguments:/n"
        read args
        ${exe_name} ${args}
    else
        echo "The executable with that name does not exist!"
    fi
}


file_operation() {
    echo "$file_operation_menu"
    echo $1
    read operation
    while true;
        do
            case $operation in
                0)
                    break;;
                1)
                    rm -f $1
                    echo "$1 has been deleted."
                    break
                    ;;
                2)
                    read -p "Enter the new file name: " new_name
                    mv $1 $new_name
                    echo "$1 has been renamed as $new_name"
                    break
                    ;;
                3)
                    chmod 666 $1
                    echo "Permissions have been updated."
                    ls -l $1
                    break
                    ;;
                4)
                    chmod 664 $1
                    echo "Permissions have been updated."
                    ls -l $1
                    break
                    ;;
                *)
                    echo "Invalid input!"
                    file_operation $1
            esac
        done
}


file_dir_opr() {
    echo 'The list of files and directories:'
    for i in *
        do
            if [[ -f "$i" ]]; then
                echo "F $i"
            elif [[ -d "$i" ]]; then
                echo "D $i"
            else
                echo "$i"
            fi
        done
    echo "$file_menu"

    read selection

    while true
        do
            case $selection in
                0)
                    main
                    ;;
                'up')
                    cd ..
                    ;;
                *)
                    if [[ -d "$selection" ]]; then
                        cd $selection
                    elif [[ -f "$selection" ]]; then
                        file_operation $selection
                    else
                        echo "Invalid input!"
                    fi
                    ;;
            esac
            echo ''
            file_dir_opr
        done
}


main() {
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
                    ;;
                2)
                    whoami
                    ;;
                3)
                    file_dir_opr
                    ;;
                4)
                    exe_opration
                    ;;
                *)
                    echo "Invalid option!"
                    ;;
            esac
            main
        done
}

# execute program
echo "Hello ${USER}!"
main
