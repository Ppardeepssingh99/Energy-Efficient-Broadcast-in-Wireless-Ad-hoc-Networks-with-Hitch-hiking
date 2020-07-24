# ======================================================================
# Define options
# ======================================================================
 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       50                       ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           25                       ;# number of mobilenodes
 set val(rp)	       AODV                     ;# routing protocol
 set val(energymodel) EnergyModel               ;
 set val(initialenergy) 100			;
 set val(x)            1200
 set val(y)            1200

set ns [new Simulator]

set f [open Aodv300m.25n.1000mob.tr w]
$ns trace-all $f
set namtrace [open Aodv300m.25n.1000mob.nam w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
set f0 [open packets_received_Aodv300m.25n.1000mob.tr w]
set f1 [open packets_lost_Aodv300m.25n.1000mob.tr w]
 

set topo [new Topography]
$topo load_flatgrid 1800 1800

create-god $val(nn)

set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
set chan_3 [new $val(chan)]
set chan_4 [new $val(chan)]
set chan_5 [new $val(chan)]
set chan_6 [new $val(chan)]
set chan_7 [new $val(chan)]
set chan_8 [new $val(chan)]
set chan_9 [new $val(chan)]
set chan_10 [new $val(chan)]
set chan_11 [new $val(chan)]
set chan_12 [new $val(chan)]
set chan_13 [new $val(chan)]
set chan_14 [new $val(chan)]
set chan_15 [new $val(chan)]
set chan_16 [new $val(chan)]
set chan_17 [new $val(chan)]
set chan_18 [new $val(chan)]
set chan_19 [new $val(chan)]
set chan_20 [new $val(chan)]
set chan_21 [new $val(chan)]
set chan_22 [new $val(chan)]
set chan_23 [new $val(chan)]
set chan_24 [new $val(chan)]
set chan_25 [new $val(chan)]


# CONFIGURE AND CREATE NODES

$ns node-config  -adhocRouting $val(rp) \
 		 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
		-energyModel $val(energymodel) \
		-initialEnergy $val(initialenergy) \
		-rxPower 35.28e-3 \
		-txPower 31.32e-3 \
		-idlePower 712e-6 \
		-sleepPower 144e-9\
                 #-channelType $val(chan) \
                 -topoInstance $topo \
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON \
                 -movementTrace ON \
                 -channel $chan_1 \
                 -channel $chan_2 \
                 -channel $chan_3 \
                 -channel $chan_4 \  
                 #-channel $chan_5 \
                 -channel $chan_6 \
                 -channel $chan_7 \
                 -channel $chan_8 \
                 -channel $chan_9 \
                 -channel $chan_10 \ 
                 #-channel $chan_11 \ 
                # -channel $chan_12 \ 
                 #-channel $chan_13 \ 
                 #-channel $chan_14 \ 
                 #-channel $chan_15 \ 
                 #-channel $chan_16 \ 
                 #-channel $chan_17 \ 
                 #-channel $chan_18 \ 
                 #-channel $chan_19 \ 
                 #-channel $chan_20 \ 
                 #-channel $chan_21 \ 
                 #-channel $chan_22 \ 
                 #-channel $chan_23 \ 
                 #-channel $chan_24 \ 
                 #-channel $chan_25 \ 
		


proc finish {} {
	global ns f f0 f1 f2 f3 namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1
        
  exec xgraph packets_received_Aodv300m.25n.1000mob.tr packets_lost_Aodv300m.25n.1000mob.tr 
        exec nam -r  5m Aodv300m.25n.1000mob.nam &
	exit 0
}

proc record {} {
  global sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15 sink16 sink17 sink18 sink19 sink20 sibnk21 sink22 sink23 sink24
  global  f0 f1 f2 f3 idlePower
   #Get An Instance Of The Simulator
   set ns [Simulator instance]
   
   #Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
   #How Many Bytes Have Been Received By The Traffic Sinks?
   set bw0 [$sink2 set npkts_]
   set bw1 [$sink2 set nlost_]
    
   #Get The Current Time
   set now [$ns now]
   
   #Save Data To The Files
   puts $f0 "$now [expr $bw0]"
   puts $f1 "$now [expr $bw1]"   
   
    
   #Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  }
 
# define color index
$ns color 0 blue
$ns color 1 red
$ns color 2 chocolate
$ns color 3 red
$ns color 4 brown
$ns color 5 tan
$ns color 6 gold
$ns color 7 black

Phy/WirelessPhy set Pt_ 0.5832; #300m
                 
set n(0) [$ns node]
$ns at 0.0 "$n(0) color red"
$n(0) color "black"
$n(0) shape "circle"
set n(1) [$ns node]
$ns at 0.0 "$n(1) color blue"
$n(1) color "blue"
$n(1) shape "square"
set n(2) [$ns node]
$ns at 0.0 "$n(2) color tan"
$n(2) color "tan"
$n(2) shape "circle"
set n(3) [$ns node]
$ns at 0.0 "$n(3) color red"
$n(3) color "red"
$n(3) shape "circle"
set n(4) [$ns node]
$ns at 0.0 "$n(4) color tan"
$n(4) color "tan"
$n(4) shape "circle"
set n(5) [$ns node]
$ns at 0.0 "$n(5) color red"
$n(5) color "red"
$n(5) shape "circle"
set n(6) [$ns node]
$ns at 0.0 "$n(6) color gold"
$n(6) color "gold"
$n(6) shape "circle"
set n(7) [$ns node]
$ns at 0.0 "$n(7) color black"
$n(7) color "black"
$n(7) shape "circle"
set n(8) [$ns node]
$ns at 0.0 "$n(8) color brown"
$n(8) color "red"
$n(8) shape "circle"
set n(9) [$ns node]
$ns at 0.0 "$n(9) color tan"
$n(9) color "tan"
$n(9) shape "circle"
set n(10) [$ns node]
$ns at 0.0 "$n(10) color blue"
$n(10) color "blue"
$n(10) shape "circle"
set n(11) [$ns node]
$ns at 0.0 "$n(11) color brown"
$n(11) color "brown"
$n(11) shape "circle"
set n(12) [$ns node]
$ns at 0.0 "$n(12) color chocolate"
$n(12) color "chocolate"
$n(12) shape "circle"
set n(13) [$ns node]
$ns at 0.0 "$n(13) color tan"
$n(13) color "tan"
$n(13) shape "circle"
set n(14) [$ns node]
$ns at 0.0 "$n(14) color black"
$n(14) color "black"
$n(14) shape "circle"
set n(15) [$ns node]
$ns at 0.0 "$n(15) color red"
$n(15) color "red"
$n(15) shape "circle"
set n(16) [$ns node]
$ns at 0.0 "$n(16) color chocolate"
$n(16) color "chocolate"
$n(16) shape "circle"
set n(17) [$ns node]
$ns at 0.0 "$n(17) color blue"
$n(17) color "blue"
$n(17) shape "circle"
set n(18) [$ns node]
$ns at 0.0 "$n(18) color red"
$n(18) color "red"
$n(18) shape "circle"
set n(19) [$ns node]
$ns at 0.0 "$n(19) color green"
$n(19) color "red"
$n(19) shape "circle"
set n(20) [$ns node]
$ns at 0.0 "$n(20) color gold"
$n(20) color "gold"
$n(20) shape "circle"
set n(21) [$ns node]
$ns at 0.0 "$n(21) color tan"
$n(21) color "tan"
$n(21) shape "circle"
set n(22) [$ns node]
$ns at 0.0 "$n(22) color yellow"
$n(22) color "red"
$n(22) shape "circle"
set n(23) [$ns node]
$ns at 0.0 "$n(23) color green"
$n(23) color "black"
$n(23) shape "circle"
set n(24) [$ns node]
$ns at 0.0 "$n(24) color red"
$n(24) color "red"
$n(24) shape "circle"


for {set i 0} {$i < $val(nn)} {incr i} {
	$ns initial_node_pos $n($i) 50+i*10
}




$n(0) set X_ 0.0
$n(0) set Y_ 0.0
$n(0) set Z_ 0.0

$n(1) set X_ 0.0
$n(1) set Y_ 0.0
$n(1) set Z_ 0.0

$n(2) set X_ 0.0
$n(2) set Y_ 0.0
$n(2) set Z_ 0.0

$n(3) set X_ 0.0
$n(3) set Y_ 0.0
$n(3) set Z_ 0.0

$n(4) set X_ 0.0
$n(4) set Y_ 0.0
$n(4) set Z_ 0.0

$n(5) set X_ 0.0
$n(5) set Y_ 0.0
$n(5) set Z_ 0.0

$n(6) set X_ 0.0
$n(6) set Y_ 0.0
$n(6) set Z_ 0.0

$n(7) set X_ 0.0
$n(7) set Y_ 0.0
$n(7) set Z_ 0.0

$n(8) set X_ 0.0
$n(8) set Y_ 0.0
$n(8) set Z_ 0.0

$n(9) set X_ 0.0
$n(9) set Y_ 0.0
$n(9) set Z_ 0.0

$n(10) set X_ 0.0
$n(10) set Y_ 0.0
$n(10) set Z_ 0.0

$n(11) set X_ 0.0
$n(11) set Y_ 0.0
$n(11) set Z_ 0.0

$n(12) set X_ 0.0
$n(12) set Y_ 0.0
$n(12) set Z_ 0.0

$n(13) set X_ 0.0
$n(13) set Y_ 0.0
$n(13) set Z_ 0.0

$n(14) set X_ 0.0
$n(14) set Y_ 0.0
$n(14) set Z_ 0.0

$n(15) set X_ 0.0
$n(15) set Y_ 0.0
$n(15) set Z_ 0.0

$n(16) set X_ 0.0
$n(16) set Y_ 0.0
$n(16) set Z_ 0.0

$n(17) set X_ 0.0
$n(17) set Y_ 0.0
$n(17) set Z_ 0.0

$n(18) set X_ 0.0
$n(18) set Y_ 0.0
$n(18) set Z_ 0.0

$n(19) set X_ 0.0
$n(19) set Y_ 0.0
$n(19) set Z_ 0.0


$n(20) set X_ 0.0
$n(20) set Y_ 0.0
$n(20) set Z_ 0.0

$n(21) set X_ 0.0
$n(21) set Y_ 0.0
$n(21) set Z_ 0.0

$n(22) set X_ 0.0
$n(22) set Y_ 0.0
$n(22) set Z_ 0.0

$n(23) set X_ 0.0
$n(23) set Y_ 0.0
$n(23) set Z_ 0.0

$n(24) set X_ 0.0
$n(24) set Y_ 0.0
$n(24) set Z_ 0.0


$ns at 0.0 "$n(0) setdest 100.0 100.0 3000.0"
$ns at 0.0 "$n(1) setdest 201.0 201.0 2000.0"
$ns at 0.0 "$n(2) setdest 300.0 100.0 3000.0"
$ns at 0.0 "$n(3) setdest 502.0 800.0 3000.0"
$ns at 0.0 "$n(4) setdest 502.0 300.0 3000.0"
$ns at 0.0 "$n(5) setdest 300.0 502.0 3000.0"
$ns at 0.0 "$n(6) setdest 50.0 502.0 3000.0"
$ns at 0.0 "$n(7) setdest 700.0 700.0 3000.0"
$ns at 0.0 "$n(8) setdest 201.0 550.0 3000.0"
$ns at 0.0 "$n(9) setdest 450.0 50.0 3000.0"
$ns at 0.0 "$n(10) setdest 502.0 502.0 3000.0"
$ns at 0.0 "$n(11) setdest 05.0 100.0 3000.0"
$ns at 0.0 "$n(12) setdest 502.0 201.0 3000.0"
$ns at 0.0 "$n(13) setdest 750.0 201.0 3000.0"
$ns at 0.0 "$n(14) setdest 900.0 201.0 3000.0"
$ns at 0.0 "$n(15) setdest 900.0 350.0 3000.0"
$ns at 0.0 "$n(16) setdest 259.0 350.0 3000.0"
$ns at 0.0 "$n(17) setdest 70.0 300.0 3000.0"
$ns at 0.0 "$n(18) setdest 650.0 450.0 3000.0"
$ns at 0.0 "$n(19) setdest 450.0 400.0 3000.0"
$ns at 0.0 "$n(20) setdest 450.0 700.0 3000.0"
$ns at 0.0 "$n(21) setdest 780.0 800.0 3000.0"
$ns at 0.0 "$n(22) setdest 950.0 800.0 3000.0"
$ns at 0.0 "$n(23) setdest 750.0 550.0 3000.0"
$ns at 0.0 "$n(24) setdest 170.0 700.0 3000.0"

$ns at 2.0 "$n(5) setdest 502.0 400.0 1000.0"
$ns at 1.5 "$n(10) setdest 350.0 400.0 1000.0"
$ns at 2.0 "$n(7) setdest 550.0 550.0 1000.0"
$ns at 2.0 "$n(3) setdest 700.0 900.0 1000.0"
$ns at 1.0 "$n(22) setdest 300.0 100.0 1000.0"
$ns at 2.5 "$n(2) setdest 700.0 470.0 1000.0"
$ns at 2.5 "$n(15) setdest 1200.0 400.0 1000.0"
$ns at 3.0 "$n(12) setdest 850.0 400.0 1000.0"
$ns at 2.5 "$n(17) setdest 502.0 550.0 1000.0"
$ns at 3.0 "$n(13) setdest 750.0 900.0 1000.0"
$ns at 3.5 "$n(23) setdest 350.0 350.0 1000.0"
$ns at 3.5 "$n(4) setdest 100.0 502.0 1000.0"



# CONFIGURE AND SET UP A FLOW


set sink0 [new Agent/LossMonitor]
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
set sink3 [new Agent/LossMonitor]
set sink4 [new Agent/LossMonitor]
set sink5 [new Agent/LossMonitor]
set sink6 [new Agent/LossMonitor]
set sink7 [new Agent/LossMonitor]
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink10 [new Agent/LossMonitor]
set sink11 [new Agent/LossMonitor]
set sink12 [new Agent/LossMonitor]
set sink13 [new Agent/LossMonitor]
set sink14 [new Agent/LossMonitor]
set sink15 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink22 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]

$ns attach-agent $n(0) $sink0
$ns attach-agent $n(1) $sink1
$ns attach-agent $n(2) $sink2
$ns attach-agent $n(3) $sink3
$ns attach-agent $n(4) $sink4
$ns attach-agent $n(5) $sink5
$ns attach-agent $n(6) $sink6
$ns attach-agent $n(7) $sink7
$ns attach-agent $n(8) $sink8
$ns attach-agent $n(9) $sink9
$ns attach-agent $n(10) $sink10
$ns attach-agent $n(11) $sink11
$ns attach-agent $n(12) $sink12
$ns attach-agent $n(13) $sink13
$ns attach-agent $n(14) $sink14
$ns attach-agent $n(15) $sink15
$ns attach-agent $n(16) $sink16
$ns attach-agent $n(17) $sink17
$ns attach-agent $n(18) $sink18
$ns attach-agent $n(19) $sink19
$ns attach-agent $n(20) $sink20
$ns attach-agent $n(21) $sink21
$ns attach-agent $n(22) $sink22
$ns attach-agent $n(23) $sink23
$ns attach-agent $n(24) $sink24



#$ns attach-agent $sink2 $sink3
set tcp0 [new Agent/TCP]
$ns attach-agent $n(0) $tcp0
set tcp1 [new Agent/TCP]
$ns attach-agent $n(1) $tcp1
set tcp2 [new Agent/TCP]
$ns attach-agent $n(2) $tcp2
set tcp3 [new Agent/TCP]
$ns attach-agent $n(3) $tcp3
set tcp4 [new Agent/TCP]
$ns attach-agent $n(4) $tcp4
set tcp5 [new Agent/TCP]
$ns attach-agent $n(5) $tcp5
set tcp6 [new Agent/TCP]
$ns attach-agent $n(6) $tcp6
set tcp7 [new Agent/TCP]
$ns attach-agent $n(7) $tcp7
set tcp8 [new Agent/TCP]
$ns attach-agent $n(8) $tcp8
set tcp9 [new Agent/TCP]
$ns attach-agent $n(9) $tcp9
set tcp10 [new Agent/TCP]
$ns attach-agent $n(10) $tcp10
set tcp11 [new Agent/TCP]
$ns attach-agent $n(11) $tcp11
set tcp12 [new Agent/TCP]
$ns attach-agent $n(12) $tcp12
set tcp13 [new Agent/TCP]
$ns attach-agent $n(13) $tcp13
set tcp14 [new Agent/TCP]
$ns attach-agent $n(14) $tcp14
set tcp15 [new Agent/TCP]
$ns attach-agent $n(15) $tcp15
set tcp16 [new Agent/TCP]
$ns attach-agent $n(16) $tcp16
set tcp17 [new Agent/TCP]
$ns attach-agent $n(17) $tcp17
set tcp18 [new Agent/TCP]
$ns attach-agent $n(18) $tcp18
set tcp19 [new Agent/TCP]
$ns attach-agent $n(19) $tcp19
set tcp20 [new Agent/TCP]
$ns attach-agent $n(20) $tcp20
set tcp21 [new Agent/TCP]
$ns attach-agent $n(21) $tcp21
set tcp22 [new Agent/TCP]
$ns attach-agent $n(22) $tcp22
set tcp23 [new Agent/TCP]
$ns attach-agent $n(23) $tcp23
set tcp24 [new Agent/TCP]
$ns attach-agent $n(24) $tcp24

proc attach-CBR-traffic { node sink size interval } {
   #Get an instance of the simulator
   set ns [Simulator instance]
   #Create a CBR  agent and attach it to the node
   set cbr [new Agent/CBR]
   $ns attach-agent $node $cbr
   $cbr set packetSize_ $size
   $cbr set interval_ $interval

   #Attach CBR source to sink;
   $ns connect $cbr $sink
   return $cbr
  }

set cbr0 [attach-CBR-traffic $n(0) $sink2 100 .015]

$ns at 0.0 "record"
$ns at 1.0 "$cbr0 start"


$ns at 10.0 "finish"

puts "Start of simulation.."
$ns run

