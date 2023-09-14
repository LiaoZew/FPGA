



VIVADO:= vivado -mode batch -source
FLAGS:= -tclargs

.ONESHELL:

.PHONY: all clean

all: create_proj

# -tclargs

create_proj:

	$(VIVADO)	../../scripts/set_proj_info.tcl \
				../../scripts/vivado_operation.tcl \
				./hello.tcl \
	$(FLAGS) 	"set TARGET_DEVICE      xc7vx330tffg1157-3" \
				"set PROJECT_NAME       test2"	\
				"set BUILD_DIR        	."



clean:
	rm -rf *.jou *.log *.xpr .Xil *.cache *.hw *.ip_user_files *.sim *.str



