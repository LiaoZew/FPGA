
#$ErrorActionPreference = 'SilentlyContinue'

$vivado_version = "2018.3"

if (1) {
    if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
            Start-Process PowerShell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
            Exit;
        }
    }
}


# change default open vivado

#reg query HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command

# HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command
# HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Vivado.Project.1\Shell\Open\Command


#reg add HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command /ve /t REG_SZ /d 'C:\\Xilinx\Vivado\2019.2\bin\unwrapped\win64.o\vvgl.exe C:\\Xilinx\Vivado\2019.2\bin\vivado.bat \"%1\"' /f

# bak path :  D:\\xilinx\rundir\Vivado\2018.3\bin\unwrapped\win64.o\vvgl.exe D:\\xilinx\rundir\Vivado\2018.3\bin\vivado.bat "%1"
$key = Get-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command

# if(!$?) {
#     $key = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Vivado.Project.1\Shell\Open\Command 
#                                             HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Vivado.Project.1\Shell\Open\Command
# }

#$key.'(default)'

$cmd =  $key.'(default)' -replace "\d{4}.\d{1}", $vivado_version
# $cmd
$cmd2 = $cmd -replace '"' , '\"'
# $cmd2

reg add HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command /ve /t REG_SZ /d $cmd2 /f
echo "change default vivado version to v$vivado_version"

#reg query HKEY_CLASSES_ROOT\Vivado.Project.1\Shell\Open\Command


# motify env path 


$temp = $cmd -match ".*vvgl.exe"
$temp = $matches.Item(0)

$temp2 = $temp -match ".*bin"
$bin_path =  $matches.Item(0) -replace "\\\\", "\"

#$bin_path
$bin2_path = $bin_path -replace "\\", "\\"

# $all_path = reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH
# $all_path = Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' -Name Path

# $all_path = $Env:Path 
# $all_path = Get-Item -Path Env:Path
$all_path = [Environment]::GetEnvironmentVariable('Path', 'Machine')

# $all_path
# $all_path.Path


#$VIVADO_PATH = '%VIVADIO_PATH%'
#$temp3 = $all_path.Path -match $bin2_path
$temp3 = $all_path -match $bin2_path
# $temp3

# [Environment]::SetEnvironmentVariable('VIVADO_PATH', $bin_path, 'Machine')

if($temp3) {
    $tmp4 = -join ($bin2_path,";")
    $all3_path =  $all_path -replace $tmp4, ''
    $all2_path = -join ($bin_path,";",$all3_path)
#    $all2_path

} else  {
    
    $all2_path = -join ($bin_path,";",$all_path)
#    $all2_path

    #$Env:Path = $all2_path
    #Set-Item -Path Env:Path -Value $all2_path

    #[Environment]::SetEnvironmentVariable('Path', $all2_path, 'Machine')

#    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment' -Name Path -Value $all2_path
#
}

[Environment]::SetEnvironmentVariable('Path', $all2_path, 'Machine')


# Stop-Process -Name explorer -Force
# gpupdate /force /wait:0


echo "change path vivado version to v$vivado_version"

