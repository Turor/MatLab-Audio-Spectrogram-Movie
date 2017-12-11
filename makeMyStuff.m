function [ myMovie ] = makeMyStuff(audiosignal, windowlength, framerate, figurehandle, ...
    samplerate,ydata,t0,tf,duration)
%makeMyStuff plots my three plots at once and captures them at a set
%framerate!
%   Ugh.
samplerange = windowlength*samplerate;
length = duration*framerate
time = 0:1/framerate:tf;
scanincrement=samplerate/framerate;
framelength = framerate*windowlength;
myMovie(length(1,1)) = struct('cdata',[],'colormap',[]);
audioarray = zeros(length(1),1);
for i=1:length
    audioarray(i) = ydata(i);
end

for i=1:length
    figure(figurehandle)
    audioindex = round(scanincrement*i);
    if i<= framelength
        if i == 1
            subplot(4,6,[1,2,3,7,8,9,13,14,15])
            spectrogram(audiosignal(1:samplerange),512,256,samplerate, 'minThreshold', -110)
            view([120 55]);
            hold on
            subplot(4,6,[4,5,6,10,11,12,16,17,18])
            spectrogram(audiosignal(1:samplerange),512,256,samplerate, 'minThreshold', -110)
            view([0 90])
            hold on
            subplot(4,6,19:24)
            plot(time(1:i),ydata(1:i))
            xlim([0 windowlength])
        else
            subplot(4,6,19:24)
            plot(time(1:i),ydata(1:i))
            xlim([0 windowlength])
        end
    else
        subplot(4,6,[1,2,3,7,8,9,13,14,15])
        spectrogram(audiosignal(audioindex-samplerange+1:audioindex),512, ...
            256,512,samplerate,'minThreshold', -110)
        view([120 55])
        hold on
        subplot(4,6,[4,5,6,10,11,12,16,17,18])
        spectrogram(audiosignal(audioindex-samplerange+1:audioindex),512, ...
            256,512,samplerate, 'minThreshold', -110)
        view([0 90])
        hold on
        subplot(4,6,19:24)
        plot(time(i-framelength:i),ydata(i-framelength:i))
        xlim([(i-framelength)/framerate i/framerate])
    end
    myMovie(i)= getframe(gcf);
end

end

