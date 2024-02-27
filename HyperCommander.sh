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

file_dir_opr() {
    echo 'The list of files and directories:'
    dir_content=$(ls $1)
    for i in $dir_content
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
                    echo "Not implemented!"
                    ;;
                *)
                    if [[ -e "$selection" ]]; then
                        echo "Not implemented!"
                    else
                        echo "Invalid input!"
                    fi
                    ;;
            esac
            echo ''
            file_dir_opr $1
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
                    main
                    ;;
                2)
                    whoami
                    main
                    ;;
                3)
                    file_dir_opr .
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




# execute program

echo "Hello ${USER}!"
main
