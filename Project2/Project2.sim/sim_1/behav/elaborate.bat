@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 77111ff4209e4689b83333c865a4a963 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testFiveStagePipeline_behav xil_defaultlib.testFiveStagePipeline -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
