T = readtable('C:\Users\ggallagh\Desktop\StifnessData\NonVisual\002\002_0.4_NonVisual.csv');

pistonRef = T.refIsOne;
answer = T.Answer;

pistonOneIntensity = T.Piston1MaxIntensity;
pistonTwoIntensity = T.Piston2MaxIntensity;




A = reshape(pistonOneIntensity,30,1);
B = reshape(pistonTwoIntensity,30,1);

maxIntensity= [];
minIntensity=[];

for i=1:30
    maxIntensity(i,1) = max(pistonOneIntensity(i),pistonTwoIntensity(i));
end

for j=1:30
    minIntensity(j,1) = min(A(j),B(j));
end



s1 = "TRUE";
s2 = "FALSE";

incorrectIntensities = [];

for x =1:30
    
    if (strcmp((pistonRef(x)),s1)==1 && strcmp((answer(x)),s1)==1 && pistonOneIntensity(x) < pistonTwoIntensity(x))
               incorrectIntensities = [incorrectIntensities; pistonTwoIntensity(x)] ;
    end
    
    if (strcmp((pistonRef(x)),s1)==1 && strcmp((answer(x)),s2)==1 && pistonTwoIntensity(x) < pistonOneIntensity(x))
               incorrectIntensities = [incorrectIntensities; pistonTwoIntensity(x)] ;
    end 
     
    if (strcmp((pistonRef(x)),s2)==1 && strcmp((answer(x)),s2)==1 && pistonOneIntensity(x) > pistonTwoIntensity(x))
               incorrectIntensities = [incorrectIntensities; pistonOneIntensity(x)] ;
    end
    
    if (strcmp((pistonRef(x)),s2)==1 && strcmp((answer(x)),s1)==1 && pistonOneIntensity(x) <pistonTwoIntensity(x))
               incorrectIntensities = [incorrectIntensities; pistonOneIntensity(x)] ;
    end
end





trials = 6.0;


% for k= 1:numberIncorrect
%     
%     if maxIntensity(IncorrectIndexes(k)) == 0.4   
%     incorrectIntensities(1,k) = minIntensity(IncorrectIndexes(k));
%     else
%     incorrectIntensities(1,k) = maxIntensity(IncorrectIndexes(k));
%     end
%     
% end

%Total Incorrect for each Intensity
IncTotalZerotTwo = sum(incorrectIntensities == 0.2);
IncTotalZerotThree = sum(incorrectIntensities == 0.3);
IncTotalZerothreeFive = sum(incorrectIntensities == 0.35);
IncTotalZerotFourFive = sum(incorrectIntensities == 0.45);
IncTotalZeroFive = sum(incorrectIntensities == 0.5);
IncTotalZerotSix = sum(incorrectIntensities == 0.6);


%Total Correct for Each Intensity
CorTotalZerotTwo = trials - IncTotalZerotTwo;
CorTotalZerotThree = trials - IncTotalZerotThree;
CorTotalZerotThreeFive = trials - IncTotalZerothreeFive;
CorTotalZerotFourFive = trials - IncTotalZerotFourFive;
CorTotalZerotFive = trials - IncTotalZeroFive;
CorTotalZerotSix = trials - IncTotalZerotSix;





%The data to be used in the plot
%Intensities, NumberCorrect, NumberOfTrials
data =    [...
    0.05,   CorTotalZerotThreeFive + CorTotalZerotFourFive,   trials*2;...
    0.1,   CorTotalZerotFive+CorTotalZerotThree ,   trials*2;...
    0.2,   CorTotalZerotSix+CorTotalZerotTwo,   trials*2];
   

options             = struct;   


options.expType     = '2AFC';  
options.sigmoidName = 'norm';



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


