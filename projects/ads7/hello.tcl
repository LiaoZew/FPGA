
# global TARGET_DEVICE
# set TARGET_DEVICE       xc7vx330tffg1157-3

# set PROJECT_NAME        test1

puts "hello ne5:)"

vivado_create_proj



# if { [string match *.xpr* [exec ls]] } {
#     puts "project is created."
# } else {
#     create_project -part $::TARGET_DEVICE  $::PROJECT_NAME $::BUILD_DIR -force
# }

