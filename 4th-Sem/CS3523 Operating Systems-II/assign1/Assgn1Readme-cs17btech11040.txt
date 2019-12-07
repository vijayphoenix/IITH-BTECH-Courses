1) Create a file "inp.txt". Give the processes data in the file named inp.txt
    Format to be followed is :

    n(number of processes)
    then n lines follow where ith line is :
    pid[i] t[i] p[i] k[i]
    
    Example:
    2
    1 25 50 3
    2 35 80 4


2)
    a) Compile the RMS file by executing following command:
    g++ Assign1-RMScs16btech11022.cpp -o rms

    b) Compile the EDF file by executing following commands:
    g++ Assign1-EDFcs16btech11022.cpp -o edf


3) 
    a) Run the RMS file by executing :
    ./rms

    b) Run the EDF file by executing :
    ./edf

4) Check RMS-Log.txt file for logs of RMS while check EDF-Log.txt file for logs of EDF.

5) Average and waiting time is present in Average_times.txt

6) Deadline miss stats are present in RMS-Stats.txt and EDF-Stats.txt for rms and edf respectively.