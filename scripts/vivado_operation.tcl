
proc vivado_create_proj {} {
    if { [string match *.xpr* [exec ls $::BUILD_DIR]] } {
        puts "project is created."
    } else {
        create_project -part $::TARGET_DEVICE  $::PROJECT_NAME $::BUILD_DIR -force
    }
}


proc vivado_add_file {args} {
    if { [string match *.xpr* [exec ls $::BUILD_DIR]] } {

    } else {
        puts "project is not created."
    }
}






