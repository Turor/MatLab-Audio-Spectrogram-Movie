%% Demonstration Script
f2 = figure;
f2.Units = 'normalized';
f2.OuterPosition = [0 0 1 1];
f2.Position = [0 0 1 1];
f2.Name = 'Movie!';
f2.Color = 'black';
set(gca,'visible','off')
set(gca,'OuterPosition',[.025 .15 .85 .95])
set(gca,'Position',[.025 .025 .80 .80])
play(crazyaudio)
movie(crazy,1,10)