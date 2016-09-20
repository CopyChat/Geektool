df -alh | awk '{print $1"\t", $2"\t", $3"\t", $4"\t\t", $5"\t\t ", "     "$9}' | awk 'NR==2,NR==5'
