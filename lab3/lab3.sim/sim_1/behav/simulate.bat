@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xsim tb_codificador_behav -key {Behavioral:sim_1:Functional:tb_codificador} -tclbatch tb_codificador.tcl -view C:/Users/Maria/Desktop/lab3/tb_mess_gen_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
