import pyaudio
import wave
import numpy as np
import soundfile as sf
from python_speech_features import mfcc
CHUNK = 1024 
FORMAT = pyaudio.paInt16 #paInt8
CHANNELS = 1
RATE = 8000 #sample rate
RECORD_SECONDS = 3
WAVE_OUTPUT_FILENAME = "testab.wav"

p = pyaudio.PyAudio()

stream = p.open(format=FORMAT,channels=CHANNELS,rate=RATE,input=True,frames_per_buffer=CHUNK) #buffer
print("* recording")
frames = []
for i in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
    data = stream.read(CHUNK)
    frames.append(data) # 2 bytes(16 bits) per channel
print("* done recording")
stream.stop_stream()
stream.close()
p.terminate()
wf = wave.open(WAVE_OUTPUT_FILENAME, 'wb')
wf.setnchannels(CHANNELS)
wf.setsampwidth(p.get_sample_size(FORMAT))
wf.setframerate(RATE)
wf.writeframes(b''.join(frames))
wf.close()
b =WAVE_OUTPUT_FILENAME

data, samplerate = sf.read(b)
x= len(data)
p = 25000-x
l =0
tests = np.empty([200,4043])
new_data = np.empty([25000,])
y1 = np.empty([25000,])	

y = p/2;

for i in range(0,y-1):
	new_data[i] = y1 [i]
for i in range(y,25000-p+y-1):
	new_data[i] = data[i-y]
for i in range(25000-y,24999):
    new_data[i] = y1[i]
data1 = mfcc(new_data,samplerate)
data = data1
data = data.reshape(4043,)

nIn = 4043
nOut = 5
x = data


def sigmoid(x):
    x = np.array(x,dtype=np.float128)
    x = x.reshape(nOut,1)
    x = x
    for  i in range (0,5):
	if x[i] < -700:
	    x[i]=0
	else:
	    x[i] = 1/(1+np.exp(-x[i]))	
    x=x.reshape(-1,nOut)
    return x


def nn_forward(X, W1, b):
    x = X.reshape(-1, nIn)
    #print x.shape
    layer2 = np.dot(x,W1) + b
    out= sigmoid(layer2)
    #losses1.append(loss)
    return out

W1 = np.loadtxt('W1.out',delimiter = ',')
b = np.loadtxt('b.out',delimiter = ',')
q = np.empty([5,])


pred = np.argmax(nn_forward(data, W1, b))
print nn_forward(data, W1, b)

q[pred] +=1 
 
print("Prediction: Type {}".format(pred))

   
pred = np.argmax(q)

if(pred==0):
	print pred,'back'
if(pred==1):
	print pred,'forward'
if(pred==2):
	print pred,'left'
if(pred==3):
	print pred,'right'
if(pred==4):
	print pred,'stop'			
	




