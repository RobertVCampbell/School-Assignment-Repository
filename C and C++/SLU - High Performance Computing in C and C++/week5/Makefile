CC=g++
CFLAGS=-Wall -fopenmp

all:
	$(CC) $(CFLAGS) -o pi_cal_ser pi_cal_ser.cpp
	$(CC) $(CFLAGS) -o pi_cal_red pi_cal_red.cpp
	$(CC) $(CFLAGS) -o pi_cal_at pi_cal_at.cpp

pi_cal_ser: pi_cal_ser.cpp
	$(CC) $(CFLAGS) -o pi_cal_ser pi_cal_ser.cpp

red: pi_cal_red.cpp
	$(CC) $(CFLAGS) -o pi_cal_red pi_cal_red.cpp

at: pi_cal_at.cpp
	$(CC) $(CFLAGS) -o pi_cal_at pi_cal_at.cpp

clean:
	rm -f pi_cal_ser
	rm -f pi_cal_red
	rm -f pi_cal_at
