1.Browse to the directory where the files 'inp-params.txt' ,'SrcAssgn2-tas-cs17btech11040.cpp', 'SrcAssgn2-cas-cs17btech11040', 'SrcAssgn2-cas-bounded-cs17btech11040' are located.
2.Open the terminal at this location.
3.Compile with g++ by following the instructions
	g++ <file_name>.cpp -lpthread
	For eg: For running the TAS algorithm you will have to compile it with g++ SrcAssgn2-tas-cs17btech11040.cpp -lpthread
5.Run the compiled object file with ./a.out
6.The log is written to a file called <filename>-log.txt and stats are written to a file called <filename>-stats.txt