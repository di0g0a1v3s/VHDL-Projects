
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: dfb3f291
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:46 ; elapsed = 00:01:54 . Memory (MB): peak = 1059.961 ; gain = 73.2852default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: dfb3f291
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:46 ; elapsed = 00:02:00 . Memory (MB): peak = 1062.758 ; gain = 76.0822default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: dfb3f291
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:46 ; elapsed = 00:02:01 . Memory (MB): peak = 1069.789 ; gain = 83.1132default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: dfb3f291
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:46 ; elapsed = 00:02:01 . Memory (MB): peak = 1069.789 ; gain = 83.1132default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 1b7bfc529
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:47 ; elapsed = 00:02:12 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=7.396  | TNS=0.000  | WHS=0.005  | THS=0.000  |
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 1e7a89391
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:47 ; elapsed = 00:02:12 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
B
-Phase 3 Initial Routing | Checksum: d281ce44
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:13 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 4.1.1 Update Timing | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=7.147  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 231527c4b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 1a6f3a62f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:14 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=7.241  | TNS=0.000  | WHS=0.306  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 1a6f3a62f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:15 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 1a6f3a62f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:15 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1a6f3a62f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:15 . Memory (MB): peak = 1072.938 ; gain = 86.2622default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1a6f3a62f
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:15 . Memory (MB): peak = 1073.438 ; gain = 86.7622default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 158be4ec5
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:15 . Memory (MB): peak = 1073.438 ; gain = 86.7622default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=7.241  | TNS=0.000  | WHS=0.306  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 158be4ec5
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:48 ; elapsed = 00:02:16 . Memory (MB): peak = 1073.438 ; gain = 86.7622default:defaulth px? 
=
Router Completed Successfully
16*routeZ35-16h px? 
?

%s
*constraints2p
\Time (s): cpu = 00:01:49 ; elapsed = 00:02:16 . Memory (MB): peak = 1073.438 ; gain = 86.7622default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
502default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:552default:default2
00:02:242default:default2
1073.4382default:default2
86.7622default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2
00:00:012default:default2
1073.4382default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2N
:C:/Users/Maria/Desktop/lab4/lab4.runs/impl_1/sd_routed.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:002default:default2
00:00:062default:default2
1073.4382default:default2
0.0002default:defaultZ17-268h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
>C:/Users/Maria/Desktop/lab4/lab4.runs/impl_1/sd_drc_routed.rpt>C:/Users/Maria/Desktop/lab4/lab4.runs/impl_1/sd_drc_routed.rpt2default:default8Z2-168h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:112default:default2
00:00:282default:default2
1080.3912default:default2
6.9532default:defaultZ17-268h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
JC:/Users/Maria/Desktop/lab4/lab4.runs/impl_1/sd_methodology_drc_routed.rptJC:/Users/Maria/Desktop/lab4/lab4.runs/impl_1/sd_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:012default:default2
00:00:062default:default2
1080.3912default:default2
0.0002default:defaultZ17-268h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
Command: %s
53*	vivadotcl2r
^report_power -file sd_power_routed.rpt -pb sd_power_summary_routed.pb -rpx sd_power_routed.rpx2default:defaultZ4-113h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
602default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:022default:default2
00:00:052default:default2
1100.9062default:default2
20.5162default:defaultZ17-268h px? 


End Record