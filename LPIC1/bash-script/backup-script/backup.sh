#!/bin/bash

#set -x

ls_cmd='/usr/bin/ls'
mkdir_cmd='/usr/bin/mkdir'
mv_cmd='/usr/bin/mv'
rm_cmd='/usr/bin/rm'
find_cmd='/usr/bin/find'
tar_cmd='/usr/bin/tar'
tar_arc_opts='czf'
tar_ext_opts='xzf'
backup_dir='/tmp/backup'
desktop='Desktop'
date_ext=$(date +'%s')
backup_dst_file="Desktop_backup_$date_ext.tar.gz"

function pick_an_operation {
        printf '
        Press the corresponding key to select a task
    [B]ackup your ~/Desktop
    [D]elete old backups
    [R]estore a backup
    [Q]uit
        '
        read -n 1 -p "[B/D/R/Q] " operation
        echo ""
}
function run_the_operation {
    case $operation in
        [Bb])
                echo "'B' selected => Making a backup..."
                backup
                ;;
        [Dd])
                echo "'D' selected => Removing old backups..."
                tidyup
                ;;
        [Rr])
                echo "'R' selected => Restoring a backup..."
                restore
                ;;
        [Qq])
                echo "Operation cancelled"
                exit 1
                ;;
        *)
                echo "Nothing selected"
                exit 1
                ;;
    esac

}

function backup {
        if [ ! -d $backup_dir ];then
                echo "Creating the $backup_dir directory"
                $mkdir_cmd $backup_dir
        fi
        $tar_cmd -$tar_arc_opts $backup_dir/$backup_dst_file $desktop
}

function tidyup {
        $find_cmd $backup_dir -name ".tar.gz" -mtime +7 -exec $rm_cmd {} \;
}

function restore {
        $mv_cmd $desktop $desktop.$date_ext.off
        $mkdir_cmd $desktop
        latest_backup=$($ls_cmd -t $backup_dir | head -1)
        echo "restoring $latest_backup..."
        $tar_cmd -$tar_ext_opts $backup_dir/$latest_backup -C $desktop --strip-components 1

}

pick_an_operation
run_the_operation
