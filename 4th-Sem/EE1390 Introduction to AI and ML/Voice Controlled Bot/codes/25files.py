import numpy as np
import soundfile as sf
new_data = np.empty([25000,]) #creating an empty array for new file to be generated from original file
y1 = np.empty([25000,])
for j in range(0,80):
	b= "back"+str(j)+".wav"
	data, samplerate = sf.read(b) #reading audio file using soundfile library
	print len(data), samplerate
	x= len(data)
	p = 25000-x
	for y in range(1 ,p,p/25):   
		for i in range(0,y-1):      #adding empty elements in the array in the start
			new_data[i] =y1[i]
		for i in range(y,25000-p+y-1):
			new_data[i] =data[i-y]
		for i in range(25000-p+y , 24999):    #adding empty elements in the array in the end 
			new_data[i] = y1[i]	
		a = "back__"+str(j) +"_"+str(y)+".wav"    #total length becomes 25000
		sf.write(a, new_data, samplerate)  #audio files are written back to harddisk
		print len(new_data)
