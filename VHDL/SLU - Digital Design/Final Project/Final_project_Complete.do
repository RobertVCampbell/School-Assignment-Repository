restart

# Power on reset
force  reset  0 0     
run 5ns
force  reset  1 0
run 5ns
force clk 0 0, 1 {1000 ps} -r 2ns
run 5ns
force        H 1 0
run 5ns
force    X 00000 0
run 5ns
force         H 0
run 10ns

# Reset state , test 1
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0     
run 10ns
# Reset state

# Reset state , test 2
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 10ns
force    X(4) 1 0     
run 5ns
force    X 00000 0  
run 10ns
# Reset state

# Reset state , test 3
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0     
run 10ns
# Reset state

# Reset state test 4
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0     
run 5ns
force    X 00000 0    
run 10ns
# Reset state

# Reset state test 5
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns   
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0   
run 10ns
# Lock state


# lock state test 6
force    X(2) 1 0     
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0  
run 10ns
# Lock state


# lock state test 7
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0 
run 10ns   
# Lock state


# lock state   test 8
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0 
run 10ns   
# Lock state

# lock state test 9
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns   
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0  
run 10ns
# Lock state

# lock state test 10
force    X(2) 1 0    
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns   
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0 
run 10ns
# Lock state


# lock state test 11
force    X(2) 1 0 
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0   
run 10ns
# Lock state


# lock state test 12
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0   
run 10ns
# Lock state

# lock state test 13
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns
force    X 00000 0   
run 10ns
# Lock state

# lock state test 14
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns 
# lock state


# alarm state test 15
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 16
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 17
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 18
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 19
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 20
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 21
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 22
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 23
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 24
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 10ns 
# alarm state

# reset state test 25
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 26
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 27
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(2) 1 0
run 5ns
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 28
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 29
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 30
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 31
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

# lock state test 32
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

# alarm state test 33
force    X(1) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 34
force    X(3) 1 0
run 5ns
force    X 00000 0
run 10ns
# alarm state

# alarm state test 35
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 36
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 37
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns 
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 38
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 39
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# alarm state test 40
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 10ns
# alarm state

# reset state test 41
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

#
force    H 1
run 5ns
#

# reset state test 42
force    X(2) 1 0
run 5ns
force    X 00000 0
run 10ns
# reset state

# reset state test 43
force    X(3) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state

#
force    H 0 
run 5ns
#

# reset state test 44
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    H 1
run 10ns 
#reset state

#
force    H 0 
run 10ns
#

# reset state test 45
force    X(2) 1 0   
run 5ns
force    X 00000 0
run 5ns
force    X(0) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0   
run 5ns
force    X(1) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    H 1
run 10ns 
# reset state

#
force    H 0 
run 10ns
#

# lock state test 46
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# lock state

#
force    H 1
run 5ns
# alarm state

# alarm state test 47
force    X(2) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(0) 1 0
run 5ns 
force    X 00000 0
run 5ns 
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(3) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(1) 1 0
run 5ns
force    X 00000 0
run 5ns
force    X(4) 1 0
run 5ns 
force    X 00000 0
run 10ns
# reset state