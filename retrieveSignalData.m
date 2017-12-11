function [ plotdata ] = retrieveSignalData(plotpoints,info)
%retrieveSignalData takes an audio filename and returns data points to plot
%the signal.
%   Inputs: Filename(string) plotPoints(int32) audioSignal 
%   Outputs: Plot Data 
totalsamples = round(size(info.Signal,1),-2);
samplerate = info.SampleRate;
duration = round(totalsamples/samplerate);
numpoints = duration*plotpoints;
increment = totalsamples/numpoints;
length = numpoints;
sample = zeros(length,1);
sample(1) = 0;
audio = sample;
audio(1) = info.Signal(1,1);
% index = 1;
% for i=increment:increment:size(info.Signal(:,1)) %For a cool design, change the step size to 5!
%     if mod(i,increment)== 0
%         index = index + 1;
%         sample(index) = sample(index-1) + .01;
%         audio(index) = info.Signal(i,1);
%     end
% end
% plotdata = [sample,audio];
for i=2:numpoints
    sample(i) = sample(i-1) + 1/plotpoints;
    audio(i) = info.Signal(i*increment,1);
end
plotdata = [sample,audio];
end

