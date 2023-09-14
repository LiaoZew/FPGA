
proc vivado_create_proj {} {
    if { [string match *.xpr* [exec ls $::BUILD_DIR]] } {
        puts "project is created."
    } else {
        create_project -part $::TARGET_DEVICE  $::PROJECT_NAME $::BUILD_DIR -force
    }
}









