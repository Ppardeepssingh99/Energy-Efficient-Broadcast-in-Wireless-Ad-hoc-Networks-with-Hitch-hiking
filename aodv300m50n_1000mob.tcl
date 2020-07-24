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
 set val(nn)           50                       ;# number of mobilenodes
 set val(rp)	       AODV                     ;# routing protocol
 set val(energymodel) EnergyModel               ;
 set val(initialenergy) 100			;
 set val(x)            1200
 set val(y)            1200

set ns [new Simulator]

set f [open Aodv300m.50n.1000mob.tr w]
$ns trace-all $f
set namtrace [open Aodv300m.50n.1000mob.nam w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
set f0 [open packets_received_Aodv300m.50n.1000mob.tr w]
set f1 [open packets_lost_Aodv300m.50n.1000mob.tr w]

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
set chan_26 [new $val(chan)]
set chan_27 [new $val(chan)]
set chan_28 [new $val(chan)]
set chan_29 [new $val(chan)]
set chan_30 [new $val(chan)]
set chan_31 [new $val(chan)]
set chan_32 [new $val(chan)]
set chan_33 [new $val(chan)]
set chan_34 [new $val(chan)]
set chan_35 [new $val(chan)]
set chan_36 [new $val(chan)]
set chan_37 [new $val(chan)]
set chan_38 [new $val(chan)]
set chan_39 [new $val(chan)]
set chan_40 [new $val(chan)]
set chan_41 [new $val(chan)]
set chan_42 [new $val(chan)]
set chan_43 [new $val(chan)]
set chan_44 [new $val(chan)]
set chan_45 [new $val(chan)]
set chan_46 [new $val(chan)]
set chan_47 [new $val(chan)]
set chan_48 [new $val(chan)]
set chan_49 [new $val(chan)]
set chan_50 [new $val(chan)]

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
                 # -channel $chan_26 \
                 #-channel $chan_27 \
                 #-channel $chan_28 \
                 #-channel $chan_29 \
                 #-channel $chan_30 \
                 #-channel $chan_31 \
                 #-channel $chan_32 \
                 #-channel $chan_33 \
                 #-channel $chan_34 \
                 #-channel $chan_35 \
                 #-channel $chan_36 \
                 #-channel $chan_37 \
                 #-channel $chan_38 \
                 #-channel $chan_39 \
                 #-channel $chan_40 \
                 #-channel $chan_41 \
                 #-channel $chan_42 \
                 #-channel $chan_43 \
                 #-channel $chan_44 \
                 #-channel $chan_45 \
                 #-channel $chan_46 \
                 #-channel $chan_47 \
                 #-channel $chan_48 \
                 #-channel $chan_49 \
                 #-channel $chan_50 \


proc finish {} {
	global ns f f0 f1 f2 f3 namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1
  exec xgraph packets_received_Aodv300m.50n.1000mob.tr packets_lost_Aodv300m.50n.1000mob.tr 
        exec nam -r  5m Aodv300m.50n.1000mob.nam &
	exit 0
}

proc record {} {
  global sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15 sink16 sink17 sink18 sink19 sink20 sibnk21 sink22 sink23 sink24 sink26 sink27 sink28 sink29 sink30 sink31 sink32 sink33 sink34 sink35 sink36 sink37 sink38 sink39 sink40 sink41 sink42 sink43 sink44 sink45 sink46 sink47 sink48 sink49 
 
  global  f0 f1 f2 f3
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
set n(25) [$ns node]
$ns at 0.0 "$n(25) color red"
$n(25) color "black"
$n(25) shape "circle"
set n(26) [$ns node]
$ns at 0.0 "$n(26) color blue"
$n(26) color "blue"
$n(26) shape "square"
set n(27) [$ns node]
$ns at 0.0 "$n(27) color tan"
$n(27) color "tan"
$n(27) shape "circle"
set n(28) [$ns node]
$ns at 0.0 "$n(28) color red"
$n(28) color "red"
$n(28) shape "circle"
set n(29) [$ns node]
$ns at 0.0 "$n(29) color tan"
$n(29) color "tan"
$n(29) shape "circle"
set n(30) [$ns node]
$ns at 0.0 "$n(30) color red"
$n(30) color "red"
$n(30) shape "circle"
set n(31) [$ns node]
$ns at 0.0 "$n(31) color gold"
$n(31) color "gold"
$n(31) shape "circle"
set n(32) [$ns node]
$ns at 0.0 "$n(32) color black"
$n(32) color "black"
$n(32) shape "circle"
set n(33) [$ns node]
$ns at 0.0 "$n(33) color brown"
$n(33) color "red"
$n(33) shape "circle"
set n(34) [$ns node]
$ns at 0.0 "$n(34) color tan"
$n(34) color "tan"
$n(34) shape "circle"
set n(35) [$ns node]
$ns at 0.0 "$n(35) color blue"
$n(35) color "blue"
$n(35) shape "circle"
set n(36) [$ns node]
$ns at 0.0 "$n(36) color brown"
$n(36) color "brown"
$n(36) shape "circle"
set n(37) [$ns node]
$ns at 0.0 "$n(37) color chocolate"
$n(37) color "chocolate"
$n(37) shape "circle"
set n(38) [$ns node]
$ns at 0.0 "$n(38) color tan"
$n(38) color "tan"
$n(38) shape "circle"
set n(39) [$ns node]
$ns at 0.0 "$n(39) color black"
$n(39) color "black"
$n(39) shape "circle"
set n(40) [$ns node]
$ns at 0.0 "$n(40) color red"
$n(40) color "red"
$n(40) shape "circle"
set n(41) [$ns node]
$ns at 0.0 "$n(41) color chocolate"
$n(41) color "chocolate"
$n(41) shape "circle"
set n(42) [$ns node]
$ns at 0.0 "$n(42) color blue"
$n(42) color "blue"
$n(42) shape "circle"
set n(43) [$ns node]
$ns at 0.0 "$n(43) color red"
$n(43) color "red"
$n(43) shape "circle"
set n(44) [$ns node]
$ns at 0.0 "$n(44) color green"
$n(44) color "red"
$n(44) shape "circle"
set n(45) [$ns node]
$ns at 0.0 "$n(45) color gold"
$n(45) color "gold"
$n(45) shape "circle"
set n(46) [$ns node]
$ns at 0.0 "$n(46) color tan"
$n(46) color "tan"
$n(46) shape "circle"
set n(47) [$ns node]
$ns at 0.0 "$n(47) color yellow"
$n(47) color "red"
$n(47) shape "circle"
set n(48) [$ns node]
$ns at 0.0 "$n(48) color green"
$n(48) color "black"
$n(48) shape "circle"
set n(49) [$ns node]
$ns at 0.0 "$n(49) color red"
$n(49) color "red"
$n(49) shape "circle"




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

$n(25) set X_ 0.0
$n(25) set Y_ 0.0
$n(25) set Z_ 0.0

$n(26) set X_ 0.0
$n(26) set Y_ 0.0
$n(26) set Z_ 0.0

$n(27) set X_ 0.0
$n(27) set Y_ 0.0
$n(27) set Z_ 0.0

$n(28) set X_ 0.0
$n(28) set Y_ 0.0
$n(28) set Z_ 0.0

$n(29) set X_ 0.0
$n(29) set Y_ 0.0
$n(29) set Z_ 0.0

$n(30) set X_ 0.0
$n(30) set Y_ 0.0
$n(30) set Z_ 0.0

$n(31) set X_ 0.0
$n(31) set Y_ 0.0
$n(31) set Z_ 0.0

$n(32) set X_ 0.0
$n(32) set Y_ 0.0
$n(32) set Z_ 0.0

$n(33) set X_ 0.0
$n(33) set Y_ 0.0
$n(33) set Z_ 0.0

$n(34) set X_ 0.0
$n(34) set Y_ 0.0
$n(34) set Z_ 0.0

$n(35) set X_ 0.0
$n(35) set Y_ 0.0
$n(35) set Z_ 0.0

$n(36) set X_ 0.0
$n(36) set Y_ 0.0
$n(36) set Z_ 0.0

$n(37) set X_ 0.0
$n(37) set Y_ 0.0
$n(37) set Z_ 0.0

$n(38) set X_ 0.0
$n(38) set Y_ 0.0
$n(38) set Z_ 0.0

$n(39) set X_ 0.0
$n(39) set Y_ 0.0
$n(39) set Z_ 0.0

$n(40) set X_ 0.0
$n(40) set Y_ 0.0
$n(40) set Z_ 0.0

$n(41) set X_ 0.0
$n(41) set Y_ 0.0
$n(41) set Z_ 0.0

$n(42) set X_ 0.0
$n(42) set Y_ 0.0
$n(42) set Z_ 0.0

$n(43) set X_ 0.0
$n(43) set Y_ 0.0
$n(43) set Z_ 0.0

$n(44) set X_ 0.0
$n(44) set Y_ 0.0
$n(44) set Z_ 0.0

$n(45) set X_ 0.0
$n(45) set Y_ 0.0
$n(45) set Z_ 0.0

$n(46) set X_ 0.0
$n(46) set Y_ 0.0
$n(46) set Z_ 0.0

$n(47) set X_ 0.0
$n(47) set Y_ 0.0
$n(47) set Z_ 0.0

$n(48) set X_ 0.0
$n(48) set Y_ 0.0
$n(48) set Z_ 0.0

$n(49) set X_ 0.0
$n(49) set Y_ 0.0
$n(49) set Z_ 0.0

$ns at 0.0 "$n(0) setdest 101.0 101.0 3000.0"
$ns at 0.0 "$n(1) setdest 200.0 200.0 2002.0"
$ns at 0.0 "$n(2) setdest 300.0 101.0 3000.0"
$ns at 0.0 "$n(3) setdest 500.0 800.0 3000.0"
$ns at 0.0 "$n(4) setdest 500.0 300.0 3000.0"
$ns at 0.0 "$n(5) setdest 300.0 500.0 3000.0"
$ns at 0.0 "$n(6) setdest 50.0 500.0 3000.0"
$ns at 0.0 "$n(7) setdest 700.0 700.0 3000.0"
$ns at 0.0 "$n(8) setdest 200.0 550.0 3000.0"
$ns at 0.0 "$n(9) setdest 450.0 50.0 3000.0"
$ns at 0.0 "$n(10) setdest 500.0 500.0 3000.0"
$ns at 0.0 "$n(11) setdest 05.0 101.0 3000.0"
$ns at 0.0 "$n(12) setdest 500.0 200.0 3000.0"
$ns at 0.0 "$n(13) setdest 750.0 200.0 3000.0"
$ns at 0.0 "$n(14) setdest 900.0 200.0 3000.0"
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
$ns at 0.0 "$n(25) setdest 180.0 750.0 3000.0"
$ns at 0.0 "$n(26) setdest 770.0 600.0 3000.0"
$ns at 0.0 "$n(27) setdest 975.0 850.0 3000.0"
$ns at 0.0 "$n(28) setdest 810.0 850.0 3000.0"
$ns at 0.0 "$n(29) setdest 480.0 750.0 3000.0"
$ns at 0.0 "$n(30) setdest 475.0 450.0 3000.0"
$ns at 0.0 "$n(31) setdest 680.0 480.0 3000.0"
$ns at 0.0 "$n(32) setdest 90.0 350.0 3000.0"
$ns at 0.0 "$n(33) setdest 930.0 400.0 3000.0"
$ns at 0.0 "$n(34) setdest 925.0 250.0 3000.0"
$ns at 0.0 "$n(35) setdest 780.0 250.0 3000.0"
$ns at 0.0 "$n(36) setdest 550.0 250.0 3000.0"
$ns at 0.0 "$n(37) setdest 25.0 150.0 3000.0"
$ns at 0.0 "$n(38) setdest 575.0 625.0 3000.0"
$ns at 0.0 "$n(39) setdest 475.0 101.0 3000.0"
$ns at 0.0 "$n(40) setdest 250.0 600.0 3000.0"
$ns at 0.0 "$n(41) setdest 725.0 825.0 3000.0"
$ns at 0.0 "$n(42) setdest 75.0 550.0 3000.0"
$ns at 0.0 "$n(43) setdest 350.0 550.0 3000.0"
$ns at 0.0 "$n(44) setdest 550.0 350.0 3000.0"
$ns at 0.0 "$n(45) setdest 550.0 850.0 3000.0"
$ns at 0.0 "$n(46) setdest 325.0 125.0 3000.0"
$ns at 0.0 "$n(47) setdest 250.0 250.0 3000.0"
$ns at 0.0 "$n(48) setdest 150.0 150.0 3000.0"
$ns at 0.0 "$n(49) setdest 775.0 900.0 3000.0"

$ns at 2.0 "$n(5) setdest 500.0 400.0 1000.0"
$ns at 1.5 "$n(10) setdest 350.0 400.0 1000.0"
$ns at 2.0 "$n(7) setdest 550.0 550.0 1000.0"
$ns at 2.0 "$n(3) setdest 700.0 900.0 1000.0"
$ns at 1.0 "$n(22) setdest 300.0 101.0 1000.0"
$ns at 2.5 "$n(2) setdest 750.0 500.0 1000.0"
$ns at 2.5 "$n(15) setdest 1200.0 400.0 1000.0"
$ns at 3.0 "$n(12) setdest 850.0 400.0 1000.0"
$ns at 2.5 "$n(17) setdest 500.0 550.0 1000.0"
$ns at 3.0 "$n(13) setdest 750.0 900.0 1000.0"
$ns at 3.5 "$n(23) setdest 350.0 350.0 1000.0"
$ns at 3.5 "$n(4) setdest 101.0 500.0 1000.0"
$ns at 5.0 "$n(25) setdest 1000.0 950.0 1000.0"
$ns at 5.0 "$n(45) setdest 850.0 550.0 1000.0"
$ns at 2.0 "$n(35) setdest 1100.0 500.0 1000.0"
$ns at 4.5 "$n(40) setdest 850.0 800.0 1000.0"
$ns at 2.0 "$n(37) setdest 750.0 850.0 1000.0"
$ns at 2.0 "$n(33) setdest 1000.0 900.0 1000.0"
$ns at 1.0 "$n(42) setdest 1200.0 1100.0 1000.0"
$ns at 4.5 "$n(32) setdest 950.0 1050.0 1000.0"
$ns at 2.5 "$n(45) setdest 1200.0 1200.0 1000.0"
$ns at 3.0 "$n(34) setdest 950.0 400.0 1000.0"
$ns at 2.5 "$n(27) setdest 500.0 1100.0 1000.0"
$ns at 3.0 "$n(30) setdest 1200.0 900.0 1000.0"
$ns at 3.5 "$n(49) setdest 1100.0 1100.0 1000.0"


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
set sink25 [new Agent/LossMonitor]
set sink26 [new Agent/LossMonitor]
set sink27 [new Agent/LossMonitor]
set sink28 [new Agent/LossMonitor]
set sink29 [new Agent/LossMonitor]
set sink30 [new Agent/LossMonitor]
set sink31 [new Agent/LossMonitor]
set sink32 [new Agent/LossMonitor]
set sink33 [new Agent/LossMonitor]
set sink34 [new Agent/LossMonitor]
set sink35 [new Agent/LossMonitor]
set sink36 [new Agent/LossMonitor]
set sink37 [new Agent/LossMonitor]
set sink38 [new Agent/LossMonitor]
set sink39 [new Agent/LossMonitor]
set sink40 [new Agent/LossMonitor]
set sink41 [new Agent/LossMonitor]
set sink42 [new Agent/LossMonitor]
set sink43 [new Agent/LossMonitor]
set sink44 [new Agent/LossMonitor]
set sink45 [new Agent/LossMonitor]
set sink46 [new Agent/LossMonitor]
set sink47 [new Agent/LossMonitor]
set sink48 [new Agent/LossMonitor]
set sink49 [new Agent/LossMonitor]

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
$ns attach-agent $n(25) $sink25
$ns attach-agent $n(26) $sink26
$ns attach-agent $n(27) $sink27
$ns attach-agent $n(28) $sink28
$ns attach-agent $n(29) $sink29
$ns attach-agent $n(30) $sink30
$ns attach-agent $n(31) $sink31
$ns attach-agent $n(32) $sink32
$ns attach-agent $n(33) $sink33
$ns attach-agent $n(34) $sink34
$ns attach-agent $n(35) $sink35
$ns attach-agent $n(36) $sink36
$ns attach-agent $n(37) $sink37
$ns attach-agent $n(38) $sink38
$ns attach-agent $n(39) $sink39
$ns attach-agent $n(40) $sink40
$ns attach-agent $n(41) $sink41
$ns attach-agent $n(42) $sink42
$ns attach-agent $n(43) $sink43
$ns attach-agent $n(44) $sink44
$ns attach-agent $n(45) $sink45
$ns attach-agent $n(46) $sink46
$ns attach-agent $n(47) $sink47
$ns attach-agent $n(48) $sink48
$ns attach-agent $n(49) $sink49





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
set tcp25 [new Agent/TCP]
$ns attach-agent $n(25) $tcp25
set tcp26 [new Agent/TCP]
$ns attach-agent $n(26) $tcp26
set tcp27 [new Agent/TCP]
$ns attach-agent $n(27) $tcp27
set tcp28 [new Agent/TCP]
$ns attach-agent $n(28) $tcp28
set tcp29 [new Agent/TCP]
$ns attach-agent $n(29) $tcp29
set tcp30 [new Agent/TCP]
$ns attach-agent $n(30) $tcp30
set tcp31 [new Agent/TCP]
$ns attach-agent $n(31) $tcp31
set tcp32 [new Agent/TCP]
$ns attach-agent $n(32) $tcp32
set tcp33 [new Agent/TCP]
$ns attach-agent $n(33) $tcp33
set tcp34 [new Agent/TCP]
$ns attach-agent $n(34) $tcp34
set tcp35 [new Agent/TCP]
$ns attach-agent $n(35) $tcp35
set tcp36 [new Agent/TCP]
$ns attach-agent $n(36) $tcp36
set tcp37 [new Agent/TCP]
$ns attach-agent $n(37) $tcp37
set tcp38 [new Agent/TCP]
$ns attach-agent $n(38) $tcp38
set tcp39 [new Agent/TCP]
$ns attach-agent $n(39) $tcp39
set tcp40 [new Agent/TCP]
$ns attach-agent $n(40) $tcp40
set tcp41 [new Agent/TCP]
$ns attach-agent $n(41) $tcp41
set tcp42 [new Agent/TCP]
$ns attach-agent $n(42) $tcp42
set tcp43 [new Agent/TCP]
$ns attach-agent $n(43) $tcp43
set tcp44 [new Agent/TCP]
$ns attach-agent $n(44) $tcp44
set tcp45 [new Agent/TCP]
$ns attach-agent $n(45) $tcp45
set tcp46 [new Agent/TCP]
$ns attach-agent $n(46) $tcp46
set tcp47 [new Agent/TCP]
$ns attach-agent $n(47) $tcp47
set tcp48 [new Agent/TCP]
$ns attach-agent $n(48) $tcp48
set tcp49 [new Agent/TCP]
$ns attach-agent $n(49) $tcp49


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

