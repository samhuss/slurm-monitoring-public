#!/bin/bash
#ssh -o StrictHostKeyChecking=no $USER@$HEAD ' '
sreport cluster AccountUtilizationByUser -p -n Format=login,used | awk '!/^\|/' | awk -F"|" "{ split(\$2,item,\"/\"); print \"cpu_minutes,username=\" \$1 \" cpu_min=\" item[1] \" $(date -d "yesterday 23:59:59" '+%s')\"}"
