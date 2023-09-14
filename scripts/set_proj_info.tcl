set i 0
while {$i < $argc} {
    set arg [lindex $argv $i]
    puts "$i $arg"
    eval $arg
    incr i 1
}

