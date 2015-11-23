%Group E
%Matthew Wyant, Venkat Garapati, Matt Capitelli, David Huang
%John Schrock, 12:40
clear all;
close all;
delete(instrfindall);
clc;
% Declarations
%a = arduino('COM3');
a = arduino_sim();
a.servoAttach(1);
%a.servoStatus;
rLED = 14;
lLED = 15;
a.pinMode(rLED,'output');
a.pinMode(lLED,'output');
approach = 2;
departure = 3;
diameter = 22.5;
% Commands
a.motorRun(1,'forward')
a.motorSpeed(1,255)

% Loop to run train and gather time
lap_time = [];
while 1
    if a.analogRead(approach) > 200
        tic;
    end
    
    if a.analogRead(departure) > 200
        lap_time = toc;
         % Time for half loop
        fprintf('The time to travel half a loop is %5.2f seconds\n',lap_time);

        % Speed Calculation
        speed = diameter/2/lap_time;
        SpeedTrain = (speed * 3600)/(5280*12);
        fprintf('The speed of the train is %5.2f mph and %5.2f in/sec\n',SpeedTrain,speed);
    end
    
end
% Time for half loop
fprintf('The time to travel half a loop is %5.2f seconds\n',timeValue);

% Speed Calculation
speed = diameter/2/timeValue;
SpeedTrain = (speed * 3600)/(5280*12);
fprintf('The speed of the train is %5.2f mph and %5.2f in/sec\n',SpeedTrain,speed);

a.motorRun(1,'release');
