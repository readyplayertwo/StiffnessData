
pathfour =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\beta2_0.4_NonVisual.csv";
pathsix =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\beta2_0.6_NonVisual.csv";
patheight =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\beta2_0.8_NonVisual.csv";



A = readtable(pathfour);
B = readtable(pathsix);
C = readtable(patheight);

pistonRefA = A.refIsOne;
answerA = A.Answer;

pistonOneIntensityA = A.Piston1MaxIntensity;
pistonTwoIntensityA = A.Piston2MaxIntensity;

pistonRefB = B.refIsOne;    
answerB = B.Answer;

pistonOneIntensityB = B.Piston1MaxIntensity;
pistonTwoIntensityB = B.Piston2MaxIntensity;

pistonRefC = C.refIsOne;
answerC = C.Answer;

pistonOneIntensityC = C.Piston1MaxIntensity;
pistonTwoIntensityC = C.Piston2MaxIntensity;



s1 = "TRUE";
s2 = "FALSE";


% %IncorrectMinusIntensities
% incorrectMinusFiveA = [];
% incorrectMinusFiveB = [];
% incorrectMinusFiveC = [];
% %
% incorrectMinusTenA = [];
% incorrectMinusTenB = [];
% incorrectMinusTenC = [];
% 
% %
% incorrectMinusTwentyA = [];
% incorrectMinusTwentyB = [];
% incorrectMinusTwentyC = [];
% 
% %IncorrectPlusIntensities
% incorrectPlusFiveA = [];
% incorrectPlusFiveB = [];
% incorrectPlusFiveC = [];
% %
% incorrectPlusTenA = [];
% incorrectPlusTenB = [];
% incorrectPlusTenC = [];
% 
% %
% incorrectPlusTwentyA = [];
% incorrectPlusTwentyB = [];
% incorrectPlusTwentyC = [];


incorrectIntensitiesA = [];
incorrectIntensitiesB = [];
incorrectIntensitiesC = [];


CorrectIntensitiesA = [];
CorrectIntensitiesB = [];
CorrectIntensitiesC = [];

%A
for x =1:30
    
    %%HigherIncorrect
    %%1 is Ref, answered Ref but other was higher
    if (strcmp((pistonRefA(x)),s1) && strcmp((answerA(x)),s1) && pistonOneIntensityA(x) < pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonTwoIntensityA(x)] ;
    end
    
    
    %%LowerIncorrect
    %%1 is ref, answered 2 and ref is higher
    if (strcmp((pistonRefA(x)),s1)==1 && strcmp((answerA(x)),s2)==1 && pistonTwoIntensityA(x) < pistonOneIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonTwoIntensityA(x)] ;
    end 
    
    %%HigherIncorrect
    %%ref is 2, answered ref and piston 1 was greater
    if (strcmp((pistonRefA(x)),s2)==1 && strcmp((answerA(x)),s2)==1 && pistonOneIntensityA(x) > pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonOneIntensityA(x)] ;
    end
    
    %LowerIncorrect
    %ref is 2, answered 1 and 1 is less than ref
    if (strcmp((pistonRefA(x)),s2)==1 && strcmp((answerA(x)),s1)==1 && pistonOneIntensityA(x) <pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonOneIntensityA(x)] ;
    end
end


%B
for x =1:30
    
    %%HigherIncorrect
    %%1 is Ref, answered Ref but other was higher
    if (strcmp((pistonRefB(x)),s1) && strcmp((answerB(x)),s1) && pistonOneIntensityB(x) < pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonTwoIntensityB(x)] ;
    end
    
    %%LowerIncorrect
    %%1 is ref, answered 2 and ref is higher
    if (strcmp((pistonRefB(x)),s1)==1 && strcmp((answerB(x)),s2)==1 && pistonTwoIntensityB(x) < pistonOneIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonTwoIntensityB(x)] ;
    end 
    
    %%HigherIncorrect
    %%ref is 2, answered ref and piston 1 was greater
    if (strcmp((pistonRefB(x)),s2)==1 && strcmp((answerB(x)),s2)==1 && pistonOneIntensityB(x) > pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonOneIntensityB(x)] ;
    end
    
    %LowerIncorrect
    %ref is 2, answered 1 and 1 is less than ref
    if (strcmp((pistonRefB(x)),s2)==1 && strcmp((answerB(x)),s1)==1 && pistonOneIntensityB(x) <pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonOneIntensityB(x)] ;
    end
end

%C
for x =1:30
    
    %%HigherIncorrect
    %%1 is Ref, answered Ref but other was higher
    if (strcmp((pistonRefC(x)),s1) && strcmp((answerC(x)),s1) && pistonOneIntensityC(x) < pistonTwoIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonTwoIntensityC(x)] ;
    end
    
     %%LowerIncorrect
    %%1 is ref, answered 2 and ref is higher
    if (strcmp((pistonRefC(x)),s1)==1 && strcmp((answerC(x)),s2)==1 && pistonTwoIntensityC(x) < pistonOneIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonTwoIntensityC(x)] ;
    end 
    
    %%HigherIncorrect
    %%ref is 2, answered ref and piston 1 was greater
    if (strcmp((pistonRefC(x)),s2)==1 && strcmp((answerC(x)),s2)==1 && pistonOneIntensityC(x) > pistonTwoIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonOneIntensityC(x)] ;
    end
    
     %LowerIncorrect
    %ref is 2, answered 1 and 1 is less than ref
    if (strcmp((pistonRefC(x)),s2)==1 && strcmp((answerC(x)),s1)==1 && pistonOneIntensityC(x) <pistonTwoIntensityC(x))
              disp(x)
                incorrectIntensitiesC = [incorrectIntensitiesC; pistonOneIntensityC(x)] ;
    end
end



trials = 5.0;


%Total Incorrect for each Intensity A
IncTotalZeroFourA = sum(incorrectIntensitiesA == 0.32);
IncTotalZeroFiveA = sum(incorrectIntensitiesA == 0.36);
IncTotalZeroFiveFiveA = sum(incorrectIntensitiesA == 0.38);
IncTotalZeroSixFiveA = sum(incorrectIntensitiesA == 0.42);
IncTotalZerotSevenA = sum(incorrectIntensitiesA == 0.44);
IncTotalZerotEightA = sum(incorrectIntensitiesA == 0.48);


%Total Correct for Each IntensityA
CorTotalZeroFourA = trials - IncTotalZeroFourA;
CorTotalZeroFiveA = trials - IncTotalZeroFiveA;
CorTotalZeroFiveFiveA = trials - IncTotalZeroFiveFiveA;
CorTotalZeroSixA = trials - IncTotalZeroSixFiveA;
CorTotalZerotSevenA = trials - IncTotalZerotSevenA;
CorTotalZerotEightA = trials - IncTotalZerotEightA;


%Total Incorrect for each Intensity B
IncTotalZeroFourB = sum(incorrectIntensitiesB == 0.48);
IncTotalZeroFiveB = sum(incorrectIntensitiesB == 0.54);
IncTotalZeroFiveFiveB = sum(incorrectIntensitiesB == 0.57);
IncTotalZeroSixFiveB = sum(incorrectIntensitiesB == 0.63);
IncTotalZerotSevenB = sum(incorrectIntensitiesB == 0.66);
IncTotalZerotEightB = sum(incorrectIntensitiesB == 0.72);


%Total Correct for Each IntensityB
CorTotalZeroFourB = trials - IncTotalZeroFourB;
CorTotalZeroFiveB = trials - IncTotalZeroFiveB;
CorTotalZeroFiveFiveB = trials - IncTotalZeroFiveFiveB;
CorTotalZeroSixB = trials - IncTotalZeroSixFiveB;
CorTotalZerotSevenB = trials - IncTotalZerotSevenB;
CorTotalZerotEightB = trials - IncTotalZerotEightB;


%Total Incorrect for each Intensity C
IncTotalZeroFourC = sum(incorrectIntensitiesC == 0.64);
IncTotalZeroFiveC = sum(incorrectIntensitiesC == 0.72);
IncTotalZeroFiveFiveC = sum(incorrectIntensitiesC == 0.76);
IncTotalZeroSixFiveC = sum(incorrectIntensitiesC == 0.84);
IncTotalZerotSevenC = sum(incorrectIntensitiesC == 0.88);
IncTotalZerotEightC = sum(incorrectIntensitiesC == 0.96);


%Total Correct for Each Intensity C
CorTotalZeroFourC = trials - IncTotalZeroFourC;
CorTotalZeroFiveC = trials - IncTotalZeroFiveC;
CorTotalZeroFiveFiveC = trials - IncTotalZeroFiveFiveC;
CorTotalZeroSixC = trials - IncTotalZeroSixFiveC;
CorTotalZerotSevenC = trials - IncTotalZerotSevenC;
CorTotalZerotEightC = trials - IncTotalZerotEightC;


%Add up correct

% Correct 0.4 Plus Five
correctPlusFive04 = IncTotalZeroFiveFiveA ;
correctPlusFive06 = IncTotalZeroFiveFiveB; 
correctPlusFive08 = IncTotalZeroFiveFiveC; 

% Incorrecr 0.4 Minus Five
IncorrectMinusFive04 = CorTotalZeroSixA ;
IncorrectMinusFive06 = CorTotalZeroSixB; 
IncorrectMinusFive08 = CorTotalZeroSixC; 

%0.6 Plus Ten
correctPlusTen04 =  IncTotalZeroFiveA;
correctPlusTen06 =  IncTotalZeroFiveB;
correctPlusTen08 =  IncTotalZeroFiveC;

%0.6 Minus Ten
IncorrectMinusTen04 = CorTotalZerotSevenA; 
IncorrectMinusTen06 = CorTotalZerotSevenB;
IncorrectMinusTen08 = CorTotalZerotSevenC;

%0.8 Plus Twenty
correctPlusTwenty04 = CorTotalZerotEightA;
correctPlusTwenty06 = CorTotalZerotEightB;
correctPlusTwenty08 = CorTotalZerotEightC;

%0.8 Minus Twenty
IncorrectMinusTwenty04 = IncTotalZeroFourA;
IncorrectMinusTwenty06 = IncTotalZeroFourB;
IncorrectMinusTwenty08 = IncTotalZeroFourC;


CombinedMinusFive = IncorrectMinusFive04 +IncorrectMinusFive06 + IncorrectMinusFive08;
CombinedPlusFive = correctPlusFive04 +correctPlusFive06 + correctPlusFive08;
CombinedMinusTen = IncorrectMinusTen04 +IncorrectMinusTen06 + IncorrectMinusTen08;
CombinedPlusTen = correctPlusTen04 +correctPlusTen06 + correctPlusTen08;
CombinedMinusTwenty = IncorrectMinusTwenty04 +IncorrectMinusTwenty06 + IncorrectMinusTwenty08;
CombinedPlusTwenty = correctPlusTwenty04 +correctPlusTwenty06 + correctPlusTwenty08;




correctZeroFive = CorTotalZeroFiveFiveA+CorTotalZeroSixA+CorTotalZeroFiveFiveB+CorTotalZeroSixB+CorTotalZeroFiveFiveC+CorTotalZeroSixC;
correctZeroOne  = CorTotalZeroFiveA+CorTotalZerotSevenA+CorTotalZeroFiveB+CorTotalZerotSevenB+CorTotalZerotSevenC+CorTotalZeroFiveC;
correctZeroTwo  = CorTotalZeroFourA+CorTotalZerotEightA+CorTotalZerotEightB+CorTotalZeroFourB+CorTotalZerotEightC+CorTotalZeroFourC;

%The data to be used in the plot
%Intensities, NumberCorrect, NumberOfTrials
dataZeroFour =    [...

    -0.05,   IncorrectMinusFive04,    5 ;...
    +0.05,   correctPlusFive04,     5 ;...
    -0.10,   IncorrectMinusTen04,     5 ;...
    +0.10,   correctPlusTen04,      5 ;...
    -0.20,   IncorrectMinusTwenty04,  5 ;...
    +0.20,   correctPlusTwenty04,   5];

dataZeroSix =    [...

    -0.05,   IncorrectMinusFive06,    5 ;...
    +0.05,   correctPlusFive06,     5 ;...
    -0.10,   IncorrectMinusTen06,     5 ;...
    +0.10,   correctPlusTen06,      5 ;...
    -0.20,   IncorrectMinusTwenty06,  5 ;...
    +0.20,   correctPlusTwenty06,   5];

dataZeroEight =    [...

    -0.05,   IncorrectMinusFive08,    5 ;...
    +0.05,   correctPlusFive08,     5;...
    -0.10,   IncorrectMinusTen08,     5 ;...
    +0.10,   correctPlusTen08,      5;...
    -0.20,   IncorrectMinusTwenty08,  5 ;...
    +0.20,   correctPlusTwenty08,   5];

dataCombined =    [...

    -0.05,   CombinedMinusFive,    15 ;...
    +0.05,   CombinedPlusFive,     15 ;...
    -0.10,   CombinedMinusTen,     15 ;...
    +0.10,   CombinedPlusTen,      15 ;...
    -0.20,   CombinedMinusTwenty,  15 ;...
    +0.20,   CombinedPlusTwenty,   15];


% dataCombined =    [...
% 
%     -0.05,   CombinedMinusFive,    15 ;...
%     +0.05,   CombinedPlusFive,     15 ;...
%     -0.10,   CombinedMinusTen,     15 ;...
%     +0.10,   CombinedPlusTen,      15 ;...
%     -0.20,   CombinedMinusTwenty,  15 ;...
%     +0.20,   CombinedPlusTwenty,   15];

dataCombinedZeroFour =    [...

    -0.05,   24,    100 ;...
    +0.05,   68,     100 ;...
    -0.10,   19,     100;...
    +0.10,   81,      100 ;...
    -0.20,   6,      100;...
    +0.20,   92,      100];

dataCombinedZeroSix =    [...

    -0.05,   45,    100 ;...
    +0.05,   52,     100 ;...
    -0.10,   34,     100 ;...
    +0.10,   81,      100 ;...
    -0.20,   16,      100;...
    +0.20,   72,      100];


dataCombinedZeroEight =    [...

    -0.05,   47,    100 ;...
    +0.05,   53,     100 ;...
    -0.10,   36,     100 ;...
    +0.10,   81,      105 ;...
    -0.20,   27,      100;...
    +0.20,   58,      100];



dataCombinedAllRefs  =    [...

    -0.05,   116,    300 ;...
    +0.05,   173,     300 ;...
    -0.10,   89,     300 ;...
    +0.10,   243,      300 ;...
    -0.20,   49,      300 ;...
    +0.20,   222,      300];


options             = struct;   
options.sigmoidName = 'norm';
options.expType     = 'YesNo'; 



resultZeroFour = psignifit(dataZeroFour,options);
resultZeroSix = psignifit(dataZeroSix,options);
resultZeroEight = psignifit(dataZeroEight,options);
% resultCombined = psignifit(dataCombined,options);
% 
% 
% resultZeroFourAll = psignifit(dataCombinedZeroFour,options);
% resultZeroSixAll = psignifit(dataCombinedZeroSix,options);
% resultZeroEightAll = psignifit(dataCombinedZeroEight,options);
% resultZeroCombinedAll = psignifit(dataCombinedAllRefs,options);


% resultZeroFourAll.Fit;
% resultZeroSixAll.Fit;
% resultZeroEightAll.Fit;


%result.Fit
%result.conf_Intervals

%Plot

plotOptionsA            = struct;   % initialize as an empty struct
plotOptionsA.aspectRatio    = true; 
plotOptionsA.plotPar        = true; %Threshold 
plotOptionsA.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsA.xLabel         = 'Stimulus Level - Reference 0.4'; 


plotOptionsB            = struct;   % initialize as an empty struct
plotOptionsB.aspectRatio    = true; 
plotOptionsB.plotPar        = true; %Threshold 
plotOptionsB.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsB.xLabel         = 'Stimulus Level - Reference 0.6'; 

plotOptionsC             = struct;   % initialize as an empty struct
plotOptionsC.aspectRatio    = true; 
plotOptionsC.plotPar        = true; %Threshold 
plotOptionsC.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsC.xLabel         = 'Stimulus Level - Reference 0.8'; 

plotOptionsD             = struct;   % initialize as an empty struct
plotOptionsD.aspectRatio    = true; 
plotOptionsD.plotPar        = true; %Threshold 
plotOptionsD.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsD.xLabel         = 'Stimulus Level - Combined'; 


plotOptionsE             = struct;   % initialize as an empty struct
plotOptionsE.aspectRatio    = true; 
plotOptionsE.plotPar        = true; %Threshold 
plotOptionsE.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsE.xLabel         = 'Stimulus Level - 0.4 All'; 

plotOptionsF             = struct;   % initialize as an empty struct
plotOptionsF.aspectRatio    = true; 
plotOptionsF.plotPar        = true; %Threshold 
plotOptionsF.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsF.xLabel         = 'Stimulus Level - 0.6 All'; 

plotOptionsG             = struct;   % initialize as an empty struct
plotOptionsG.aspectRatio    = true; 
plotOptionsG.plotPar        = true; %Threshold 
plotOptionsG.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsG.xLabel         = 'Stimulus Level - 0.8 All'; 

plotOptionsH             = struct;   % initialize as an empty struct
plotOptionsH.aspectRatio    = true; 
plotOptionsH.plotPar        = true; %Threshold 
plotOptionsH.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsH.xLabel         = 'Stimulus Level - Combined All'; 

plotOptionsI            = struct;   % initialize as an empty struct
%plotOptionsI.aspectRatio    = true; 
plotOptionsI.plotPar        = true; %Threshold 
plotOptionsI.extrapolLength = 0.0;  %Extrapolation Length Standard .2
%plotOptionsI.xLabel         = 'Stimulus Level - Reference 0.4'; 


%getThreshold(resultZeroFourAll,0.75)
%getThreshold(resultZeroFourAll,0.75,1)
%plotPsych(resultZeroFour, plotOptionsA);
%plotPsych(resultZeroSix, plotOptionsB);
%plotPsych(resultZeroEight, plotOptionsC);
%plotPsych(resultCombined, plotOptionsD);

%plotPsych(resultZeroFourAll, plotOptionsE);
%plotPsych(resultZeroSixAll, plotOptionsF);
%plotPsych(resultZeroEightAll, plotOptionsG);
%plotPsych(resultZeroCombinedAll, plotOptionsH);

%plotsModelfit(resultZeroSixAll);
% resFastfour = psignifitFast(dataCombinedZeroFour,options);
% resFastsix = psignifitFast(dataCombinedZeroSix,options);
% resFasteight = psignifitFast(dataCombinedZeroEight,options);



%Individual 3 Refs
plotOptionsI.dataColor = [0,0,0];  % colour of the data points
[hline,hdata] = plotPsych(resultZeroFour,plotOptionsI);
plotOptionsI.lineColor = [1,0,0];
plotOptionsI.dataColor = [1,0,0];  % colour of the data points
hold on
[hline2,hdata2] = plotPsych(resultZeroSix,plotOptionsI);
plotOptionsI.lineColor = [0,1,0];
plotOptionsI.dataColor = [0,1,0];
hold on
[hline3,hdata3] = plotPsych(resultZeroEight,plotOptionsI);
legend([hline,hline2,hline3],'0.4','0.6','0.8')

%Combined 3 refs
% plotOptionsI.dataColor = [0,0,0];  % colour of the data points
% [hline,hdata] = plotPsych(resultZeroFourAll,plotOptionsI);
% plotOptionsI.lineColor = [1,0,0];
% plotOptionsI.dataColor = [1,0,0];  % colour of the data points
% hold on
% [hline2,hdata2] = plotPsych(resultZeroSixAll,plotOptionsI);
% plotOptionsI.lineColor = [0,1,0];
% plotOptionsI.dataColor = [0,1,0];
% hold on
% [hline3,hdata3] = plotPsych(resultZeroEightAll,plotOptionsI);
% legend([hline,hline2,hline3],'0.4','0.6','0.8')


%  x = [-0.20; -0.10; -0.05; +0.05; +0.10; + 0.20];
%  
% 
%  rzerofour = [6;19;24;68;81;92];
%  rzerosix = [16;34;45;52;81;72];
%  rzeroeight = [27;36;47;53;81;58];
% 
%  
%  m =[100;100;100;100;100;100];
% % 
% % scatter(xaxis, yaxisZeroFour);
% 
% r = rzeroeight;
% figure; plot( x, r ./ m, 'k.','MarkerSize', 20); axis([-0.20 +0.20 -0.02 1]); axis square;
% 
% 
% degpol = 1; % Degree of the polynomial
% b = binomfit_lims( r, m, x, degpol, 'probit' );
% numxfit = 999; % Number of points to be generated minus 1
% xfit = [min( x ):(max(x)-min(x))/numxfit:max( x )]';
% % Plot the fitted curve
% pfit = binomval_lims( b, xfit, 'probit' );
% hold on, plot( xfit, pfit, 'k' );
% 
% % 
% % [ b, K ] = binom_weib( r, m, x );
% % guessing = 0; % guessing rate
% % lapsing = 0; % lapsing rate
% % % Plot the fitted curve
% % pfit = binomval_lims( b, xfit, 'weibull', guessing, lapsing, K );
% % hold on, plot( xfit, pfit, 'r' );
% % 
% % 
% % b = binomfit_lims( r, m, x, degpol, 'logit' );
% % % Plot the fitted curve
% % pfit = binomval_lims( b, xfit, 'logit' );
% % hold on, plot( xfit, pfit, 'b' );
% % r = rzeroeight;









