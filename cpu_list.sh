ps -arcwwwxo  "pid pcpu pmem command" | grep -v grep | head -30 > ~/Code/Geektool/geek.ps
cat ~/Code/Geektool/geek.ps