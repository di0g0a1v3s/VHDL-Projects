@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto baecbbd2298b458dbae939f766ce0668 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SimulDataPath_behav xil_defaultlib.SimulDataPath -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
