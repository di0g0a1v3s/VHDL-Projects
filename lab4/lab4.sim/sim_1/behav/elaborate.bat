@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 52847066ba1b43da9d52da12dd7f8550 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_float_reg_behav xil_defaultlib.tb_float_reg -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
