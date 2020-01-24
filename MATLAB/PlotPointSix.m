T = readtable('C:\Users\ggallagh\Desktop\StifnessData\NonVisual\002\002_0.6_NonVisual.csv');

pistonRef = T.refIsOne;
answer = T.Answer;

pistonOneIntensity = T.Piston1MaxIntensity;
pistonTwoIntensity = T.Piston2MaxIntensity;


s1 = "TRUE";
s2 = "FALSE";

incorrectIntensities = [];

for x =1:30
    
    if (strcmp((pistonRef(x)),s1) && strcmp((answer(x)),s1) && pistonOneIntensity(x) < pistonTwoIntensity(x))
              disp(x)
               incorrectIntensities = [incorrectIntensities; pistonTwoIntensity(x)] ;
    end
    
    if (strcmp((pistonRef(x)),s1)==1 && strcmp((answer(x)),s2)==1 && pistonTwoIntensity(x) < pistonOneIntensity(x))
              disp(x)
               incorrectIntensities = [incorrectIntensities; pistonTwoIntensity(x)] ;
    end 
     
    if (strcmp((pistonRef(x)),s2)==1 && strcmp((answer(x)),s2)==1 && pistonOneIntensity(x) > pistonTwoIntensity(x))
              disp(x)
               incorrectIntensities = [incorrectIntensities; pistonOneIntensity(x)] ;
    end
    
    if (strcmp((pistonRef(x)),s2)==1 && strcmp((answer(x)),s1)==1 && pistonOneIntensity(x) <pistonTwoIntensity(x))
              disp(x)
               incorrectIntensities = [incorrectIntensities; pistonOneIntensity(x)] ;
    end
end

trials = 6.0;

%Total Incorrect for each Intensity
IncTotalZeroFour = sum(incorrectIntensities == 0.4);
IncTotalZeroFive = sum(incorrectIntensities == 0.5);
IncTotalZeroFiveFive = sum(incorrectIntensities == 0.55);
IncTotalZeroSixFive = sum(incorrectIntensities == 0.65);
IncTotalZerotSeven = sum(incorrectIntensities == 0.7);
IncTotalZerotEight = sum(incorrectIntensities == 0.8);


%Total Correct for Each Intensity
CorTotalZeroFour = trials - IncTotalZeroFour;
CorTotalZeroFive = trials - IncTotalZeroFive;
CorTotalZeroFiveFive = trials - IncTotalZeroFiveFive;
CorTotalZeroSix = trials - IncTotalZeroSixFive;
CorTotalZerotSeven = trials - IncTotalZerotSeven;
CorTotalZerotEight = trials - IncTotalZerotEight;





%The data to be used in the plot
%Intensities, NumberCorrect, NumberOfTrials
data =    [...

    0.05,   CorTotalZeroFiveFive+CorTotalZeroSix,   trials*2;...
    0.1,   CorTotalZerotSeven+CorTotalZeroFive,   trials*2;...
    0.2,   CorTotalZerotEight+CorTotalZeroFour,   trials*2];


options             = struct;   


options.sigmoidName = 'norm';
options.expType     = '2AFC';   

result = psignifit(data,options);

%result.Fit
%result.conf_Intervals

%Plot

plotOptions             = struct;   % initialize as an empty struct
plotOptions.aspectRatio    = true; 
plotOptions.plotPar        = false; %Threshold 
plotOptions.extrapolLength = 0;  %Extrapolation Length Standard .2

plotPsych(result, plotOptions);
%plotBayes(result)
%plotMarginal(result,1,plotOptions);


