%% Useful Constants
filename = 'Starwars.mp3';
plotpoints = 10; %Number of plot points taken a second.
starttime = 0;
playtime = 130;
windowlength = 5;
reducF = 5;
duration = playtime-starttime;
%% Function Calls

audiopack2 = readMyAudio(filename,playtime,starttime);
signalplotdata = retrieveSignalData(plotpoints, audiopack2);
mitigated = reduceSampleRate(reducF,audiopack2);
msamplerate = audiopack2.SampleRate/reducF;

%% Create Audio Player
player = audioplayer(audiopack2.Signal,audiopack2.SampleRate);
%% Define Figures
f1 = figure;
f1.Units = 'normalized';
f1.OuterPosition = [.02 .05 .95 .95];
f1.Name = 'Spectrogram';


%% Spectrogram Stuff
filtered=lowpassfilter(mitigated);
% figure(f1)
% spectrogram(filtered,512,256,1024,msamplerate)
% view([130 50])
% viewangle = [0 90];
% spectromovie1 = makeMySpectrogram(filtered, windowlength, plotpoints, f1, viewangle,...
%     msamplerate);
% viewangle = [130 50];
% spectromovie2 = makeMySpectrogram(filtered, windowlength, plotpoints, f1, viewangle,...
%     msamplerate);

%% Create Signal Movie
% signalmovie = makeMyMovie(signalplotdata(:,1), signalplotdata(:,2),plotpoints,...
%      windowlength,f1);
 
 %% Make my Stuff please function
plotmovie = makeMyStuff(mitigated, windowlength, plotpoints, f1, msamplerate, signalplotdata(:,2),...
    starttime, playtime,duration);
 
pause()
f2 = figure;
f2.Units = 'normalized';
f2.OuterPosition = [.02 .05 .95 .95];
f2.Name = 'Movie!';
axes.Units = 'normalized';
axes.Position = [-.1 -.1 1 1];
play(player)
movie(plotmovie,1,10)

%  %% Video Writer
%  samplesperframe = audiopack2.SampleRate/50;
%  myVideo = VideoWriter('audiovisualization.avi');
%  open(myVideo);
% writeVideo(myVideo,signalmovie);
 