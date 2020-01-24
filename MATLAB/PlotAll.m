

correctPlusFive04 = 0;
correctPlusFive06 = 0;
correctPlusFive08 = 0;

IncorrectMinusFive04 = 0;
IncorrectMinusFive06 = 0;
IncorrectMinusFive08 =0;


correctPlusTen04 = 0;
correctPlusTen06 = 0;
correctPlusTen08 = 0;

IncorrectMinusTen04 = 0;
IncorrectMinusTen06 = 0;
IncorrectMinusTen08 = 0;

correctPlusTwenty04 = 0;
correctPlusTwenty06 = 0;
correctPlusTwenty08 = 0;

IncorrectMinusTwenty04 = 0;
IncorrectMinusTwenty06 = 0;
IncorrectMinusTwenty08 = 0;



I = 22;
for c = 1:I
chr = int2str(c); 

%Individual Variables of correctness 

 if c == 15 || c == 17
     continue
 end
 
 
%0.4
genvarname('four_Minus_Five_',  num2str(c));
genvarname('four_Minus_Ten_',  num2str(c));
genvarname('four_Minus_Twenty_',  num2str(c));
genvarname('four_Plus_Five_',  num2str(c));
genvarname('four_Plus_Ten_',  num2str(c));
genvarname('four_Plus_Twenty_',  num2str(c));


%0.6
genvarname('six_Minus_Five_',  num2str(c));
genvarname('six_Minus_Ten_',  num2str(c));
genvarname('six_Minus_Twenty_',  num2str(c));
genvarname('six_Plus_Five_',  num2str(c));
genvarname('six_Plus_Ten_',  num2str(c));
genvarname('six_Plus_Twenty_',  num2str(c));


%0.8
genvarname('eight_Minus_Five_',  num2str(c));
genvarname('eight_Minus_Ten_',  num2str(c));
genvarname('eight_Minus_Twenty_',  num2str(c));
genvarname('eight_Plus_Five_',  num2str(c));
genvarname('eight_Plus_Ten_',  num2str(c));
genvarname('eight_Plus_Twenty_',  num2str(c));




pathfour =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\" +chr +"\"+chr +"_0.4_NonVisual.csv";
pathsix =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\" +chr +"\"+chr +"_0.6_NonVisual.csv";
patheight =   "C:\Users\ggallagh\Desktop\StifnessData\NonVisual\" +chr +"\"+chr +"_0.8_NonVisual.csv";



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
incorrectIntensitiesA = [];
incorrectIntensitiesB = [];
incorrectIntensitiesC = [];


%A
for x =1:30
    
    %%Answered Ref but other was higher
    if (strcmp((pistonRefA(x)),s1) && strcmp((answerA(x)),s1) && pistonOneIntensityA(x) < pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonTwoIntensityA(x)] ;
    end
    
    %%1 is ref, answered 2 and ref is higher
    if (strcmp((pistonRefA(x)),s1)==1 && strcmp((answerA(x)),s2)==1 && pistonTwoIntensityA(x) < pistonOneIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonTwoIntensityA(x)] ;
    end 
    
    %%ref is 2, answered ref and piston 1 was greater
    if (strcmp((pistonRefA(x)),s2)==1 && strcmp((answerA(x)),s2)==1 && pistonOneIntensityA(x) > pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonOneIntensityA(x)] ;
    end
    
    %ref is 2, answered 1 and 1 is less than ref
    if (strcmp((pistonRefA(x)),s2)==1 && strcmp((answerA(x)),s1)==1 && pistonOneIntensityA(x) <pistonTwoIntensityA(x))
               incorrectIntensitiesA = [incorrectIntensitiesA; pistonOneIntensityA(x)] ;
    end
end


%B
for x =1:30
    
    if (strcmp((pistonRefB(x)),s1) && strcmp((answerB(x)),s1) && pistonOneIntensityB(x) < pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonTwoIntensityB(x)] ;
    end
    
    if (strcmp((pistonRefB(x)),s1)==1 && strcmp((answerB(x)),s2)==1 && pistonTwoIntensityB(x) < pistonOneIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonTwoIntensityB(x)] ;
    end 
     
    if (strcmp((pistonRefB(x)),s2)==1 && strcmp((answerB(x)),s2)==1 && pistonOneIntensityB(x) > pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonOneIntensityB(x)] ;
    end
    
    if (strcmp((pistonRefB(x)),s2)==1 && strcmp((answerB(x)),s1)==1 && pistonOneIntensityB(x) <pistonTwoIntensityB(x))
              disp(x)
               incorrectIntensitiesB = [incorrectIntensitiesB; pistonOneIntensityB(x)] ;
    end
end

%C
for x =1:30
    
    if (strcmp((pistonRefC(x)),s1) && strcmp((answerC(x)),s1) && pistonOneIntensityC(x) < pistonTwoIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonTwoIntensityC(x)] ;
    end
    
    if (strcmp((pistonRefC(x)),s1)==1 && strcmp((answerC(x)),s2)==1 && pistonTwoIntensityC(x) < pistonOneIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonTwoIntensityC(x)] ;
    end 
     
    if (strcmp((pistonRefC(x)),s2)==1 && strcmp((answerC(x)),s2)==1 && pistonOneIntensityC(x) > pistonTwoIntensityC(x))
              disp(x)
               incorrectIntensitiesC = [incorrectIntensitiesC; pistonOneIntensityC(x)] ;
    end
    
    if (strcmp((pistonRefC(x)),s2)==1 && strcmp((answerC(x)),s1)==1 && pistonOneIntensityC(x) <pistonTwoIntensityC(x))
              disp(x)
                incorrectIntensitiesC = [incorrectIntensitiesC; pistonOneIntensityC(x)] ;
    end
end



trials = 5.0;


%Total Incorrect for each Intensity A
IncTotalZeroFourA = sum(incorrectIntensitiesA == 0.2);
IncTotalZeroFiveA = sum(incorrectIntensitiesA == 0.3);
IncTotalZeroFiveFiveA = sum(incorrectIntensitiesA == 0.35);
IncTotalZeroSixFiveA = sum(incorrectIntensitiesA == 0.45);
IncTotalZerotSevenA = sum(incorrectIntensitiesA == 0.5);
IncTotalZerotEightA = sum(incorrectIntensitiesA == 0.6);


%Total Correct for Each IntensityA
CorTotalZeroFourA = trials - IncTotalZeroFourA;
CorTotalZeroFiveA = trials - IncTotalZeroFiveA;
CorTotalZeroFiveFiveA = trials - IncTotalZeroFiveFiveA;
CorTotalZeroSixA = trials - IncTotalZeroSixFiveA;
CorTotalZerotSevenA = trials - IncTotalZerotSevenA;
CorTotalZerotEightA = trials - IncTotalZerotEightA;


%Total Incorrect for each Intensity B
IncTotalZeroFourB = sum(incorrectIntensitiesB == 0.4);
IncTotalZeroFiveB = sum(incorrectIntensitiesB == 0.5);
IncTotalZeroFiveFiveB = sum(incorrectIntensitiesB == 0.55);
IncTotalZeroSixFiveB = sum(incorrectIntensitiesB == 0.65);
IncTotalZerotSevenB = sum(incorrectIntensitiesB == 0.7);
IncTotalZerotEightB = sum(incorrectIntensitiesB == 0.8);


%Total Correct for Each IntensityB
CorTotalZeroFourB = trials - IncTotalZeroFourB;
CorTotalZeroFiveB = trials - IncTotalZeroFiveB;
CorTotalZeroFiveFiveB = trials - IncTotalZeroFiveFiveB;
CorTotalZeroSixB = trials - IncTotalZeroSixFiveB;
CorTotalZerotSevenB = trials - IncTotalZerotSevenB;
CorTotalZerotEightB = trials - IncTotalZerotEightB;


%Total Incorrect for each Intensity C
IncTotalZeroFourC = sum(incorrectIntensitiesC == 0.6);
IncTotalZeroFiveC = sum(incorrectIntensitiesC == 0.7);
IncTotalZeroFiveFiveC = sum(incorrectIntensitiesC == 0.75);
IncTotalZeroSixFiveC = sum(incorrectIntensitiesC == 0.85);
IncTotalZerotSevenC = sum(incorrectIntensitiesC == 0.9);
IncTotalZerotEightC = sum(incorrectIntensitiesC == 1);


%Total Correct for Each Intensity C
CorTotalZeroFourC = trials - IncTotalZeroFourC;
CorTotalZeroFiveC = trials - IncTotalZeroFiveC;
CorTotalZeroFiveFiveC = trials - IncTotalZeroFiveFiveC;
CorTotalZeroSixC = trials - IncTotalZeroSixFiveC;
CorTotalZerotSevenC = trials - IncTotalZerotSevenC;
CorTotalZerotEightC = trials - IncTotalZerotEightC;


%Add up correct Total
    
% Correct 0.4 Plus Five
correctPlusFive04 = correctPlusFive04 + CorTotalZeroSixA ;
correctPlusFive06 = correctPlusFive06 + CorTotalZeroSixB; 
correctPlusFive08 = correctPlusFive08 + CorTotalZeroSixC; 

% Incorrecr 0.4 Minus Five
IncorrectMinusFive04 =IncorrectMinusFive04  + IncTotalZeroFiveFiveA ;
IncorrectMinusFive06 = IncorrectMinusFive06 + IncTotalZeroFiveFiveB; 
IncorrectMinusFive08 = IncorrectMinusFive08 + IncTotalZeroFiveFiveC; 

%0.6 Plus Ten
correctPlusTen04 = correctPlusTen04 + CorTotalZerotSevenA;
correctPlusTen06 = correctPlusTen06 + CorTotalZerotSevenB;
correctPlusTen08 = correctPlusTen08 + CorTotalZerotSevenC;

%0.6 Minus Ten
IncorrectMinusTen04 = IncorrectMinusTen04 + IncTotalZeroFiveA; 
IncorrectMinusTen06 = IncorrectMinusTen06 + IncTotalZeroFiveB;
IncorrectMinusTen08 = IncorrectMinusTen08 + IncTotalZeroFiveC;

%0.8 Plus Twenty
correctPlusTwenty04 = correctPlusTwenty04 + CorTotalZerotEightA;
correctPlusTwenty06 =  correctPlusTwenty06 +CorTotalZerotEightB;
correctPlusTwenty08 = correctPlusTwenty08 + CorTotalZerotEightC;

%0.8 Minus Twenty
IncorrectMinusTwenty04 = IncorrectMinusTwenty04 + IncTotalZeroFourA;
IncorrectMinusTwenty06 = IncorrectMinusTwenty06 + IncTotalZeroFourB;
IncorrectMinusTwenty08 = IncorrectMinusTwenty08+ IncTotalZeroFourC;



%Add up correct Individual

% Correct 0.4 Plus Five
eval(['four_Plus_Five_' num2str(c) '=CorTotalZeroSixA'])
eval(['six_Plus_Five_' num2str(c) '=CorTotalZeroSixB'])
eval(['eight_Plus_Five_' num2str(c) '=CorTotalZeroSixC'])

% Incorrecr 0.4 Minus Five
eval(['four_Minus_Five_' num2str(c) '=IncTotalZeroFiveFiveA'])
eval(['six_Minus_Five_' num2str(c) '=IncTotalZeroFiveFiveB'])
eval(['eight_Minus_Five_' num2str(c) '=IncTotalZeroFiveFiveC'])


%0.6 Plus Ten
eval(['four_Plus_Ten_' num2str(c) '=CorTotalZerotSevenA'])
eval(['six_Plus_Ten_' num2str(c) '=CorTotalZerotSevenB'])
eval(['eight_Plus_Ten_' num2str(c) '=CorTotalZerotSevenC'])


%0.6 Minus Ten
eval(['four_Minus_Ten_' num2str(c) '=IncTotalZeroFiveA'])
eval(['six_Minus_Ten_' num2str(c) '=IncTotalZeroFiveB'])
eval(['eight_Minus_Ten_' num2str(c) '=IncTotalZeroFiveC'])


%0.8 Plus Twenty
eval(['four_Plus_Twenty_' num2str(c) '=CorTotalZerotEightA'])
eval(['six_Plus_Twenty_' num2str(c) '=CorTotalZerotEightB'])
eval(['eight_Plus_Twenty_' num2str(c) '=CorTotalZerotEightC'])


%0.8 Minus Twenty
eval(['four_Minus_Twenty_' num2str(c) '=IncTotalZeroFourA'])
eval(['six_Minus_Twenty_' num2str(c) '=IncTotalZeroFourB'])
eval(['eight_Minus_Twenty_' num2str(c) '=IncTotalZeroFourC'])




end

CombinedMinusFive = IncorrectMinusFive04 +IncorrectMinusFive06 + IncorrectMinusFive08;
CombinedPlusFive = correctPlusFive04 +correctPlusFive06 + correctPlusFive08;
CombinedMinusTen = IncorrectMinusTen04 +IncorrectMinusTen06 + IncorrectMinusTen08;
CombinedPlusTen = correctPlusTen04 +correctPlusTen06 + correctPlusTen08;
CombinedMinusTwenty = IncorrectMinusTwenty04 +IncorrectMinusTwenty06 + IncorrectMinusTwenty08;
CombinedPlusTwenty = correctPlusTwenty04 +correctPlusTwenty06 + correctPlusTwenty08;

percentCorrectFourPlusFive = [four_Plus_Five_1 /5, four_Plus_Five_2 /5,four_Plus_Five_3 /5,four_Plus_Five_4 /5 four_Plus_Five_5 /5, ...
    four_Plus_Five_6 /5, four_Plus_Five_7 /5,four_Plus_Five_8 /5,four_Plus_Five_9 /5,four_Plus_Five_10 /5,four_Plus_Five_11 /5,four_Plus_Five_12 /5,four_Plus_Five_13 /5,...
    four_Plus_Five_14 /5,four_Plus_Five_16 /5,four_Plus_Five_18 /5,four_Plus_Five_19 /5,four_Plus_Five_20 /5,four_Plus_Five_21 /5,four_Plus_Five_22 /5, ];

percentCorrectFourPlusTen = [four_Plus_Ten_1 /5, four_Plus_Ten_2 /5,four_Plus_Ten_3 /5,four_Plus_Ten_4 /5 four_Plus_Ten_5 /5, ...
    four_Plus_Ten_6 /5, four_Plus_Ten_7 /5,four_Plus_Ten_8 /5,four_Plus_Ten_9 /5,four_Plus_Ten_10 /5,four_Plus_Ten_11 /5,four_Plus_Ten_12 /5,four_Plus_Ten_13 /5,...
    four_Plus_Ten_14 /5,four_Plus_Ten_16 /5,four_Plus_Ten_18 /5,four_Plus_Ten_19 /5,four_Plus_Ten_20 /5,four_Plus_Ten_21 /5,four_Plus_Ten_22 /5, ];

percentCorrectFourPlusTwenty = [four_Plus_Twenty_1 /5, four_Plus_Twenty_2 /5,four_Plus_Twenty_3 /5,four_Plus_Twenty_4 /5 four_Plus_Twenty_5 /5, ...
    four_Plus_Twenty_6 /5, four_Plus_Twenty_7 /5,four_Plus_Twenty_8 /5,four_Plus_Twenty_9 /5,four_Plus_Twenty_10 /5,four_Plus_Twenty_11 /5,four_Plus_Twenty_12 /5,four_Plus_Twenty_13 /5,...
    four_Plus_Twenty_14 /5,four_Plus_Twenty_16 /5,four_Plus_Twenty_18 /5,four_Plus_Twenty_19 /5,four_Plus_Twenty_20 /5,four_Plus_Twenty_21 /5,four_Plus_Twenty_22 /5, ];

percentCorrectFourMinusFive = [four_Minus_Five_1 /5, four_Minus_Five_2 /5,four_Minus_Five_3 /5,four_Minus_Five_4 /5 four_Minus_Five_5 /5, ...
    four_Minus_Five_6 /5, four_Minus_Five_7 /5,four_Minus_Five_8 /5,four_Minus_Five_9 /5,four_Minus_Five_10 /5,four_Minus_Five_11 /5,four_Minus_Five_12 /5,four_Minus_Five_13 /5,...
    four_Minus_Five_14 /5,four_Minus_Five_16 /5,four_Minus_Five_18 /5,four_Minus_Five_19 /5,four_Minus_Five_20 /5,four_Minus_Five_21 /5,four_Minus_Five_22 /5, ];

percentCorrectFourMinusTen = [four_Minus_Ten_1 /5, four_Minus_Ten_2 /5,four_Minus_Ten_3 /5,four_Minus_Ten_4 /5 four_Minus_Ten_5 /5, ...
    four_Minus_Ten_6 /5, four_Minus_Ten_7 /5,four_Minus_Ten_8 /5,four_Minus_Ten_9 /5,four_Minus_Ten_10 /5,four_Minus_Ten_11 /5,four_Minus_Ten_12 /5,four_Minus_Ten_13 /5,...
    four_Minus_Ten_14 /5,four_Minus_Ten_16 /5,four_Minus_Ten_18 /5,four_Minus_Ten_19 /5,four_Minus_Ten_20 /5,four_Minus_Ten_21 /5,four_Minus_Ten_22 /5, ];

percentCorrectFourMinusTwenty = [four_Minus_Twenty_1 /5, four_Minus_Twenty_2 /5,four_Minus_Twenty_3 /5,four_Minus_Twenty_4 /5 four_Minus_Twenty_5 /5, ...
    four_Minus_Twenty_6 /5, four_Minus_Twenty_7 /5,four_Minus_Twenty_8 /5,four_Minus_Twenty_9 /5,four_Minus_Twenty_10 /5,four_Minus_Twenty_11 /5,four_Minus_Twenty_12 /5,four_Minus_Twenty_13 /5,...
    four_Minus_Twenty_14 /5,four_Minus_Twenty_16 /5,four_Minus_Twenty_18 /5,four_Minus_Twenty_19 /5,four_Minus_Twenty_20 /5,four_Minus_Twenty_21 /5,four_Minus_Twenty_22 /5, ];


percentCorrectFourPlusFive = reshape(percentCorrectFourPlusFive,[],1); % convert matrix to column vector
percentCorrectFourPlusTen = reshape(percentCorrectFourPlusTen,[],1); % convert matrix to column vector
percentCorrectFourPlusTwenty = reshape(percentCorrectFourPlusTwenty,[],1); % convert matrix to column vector
percentCorrectFourMinusFive = reshape(percentCorrectFourMinusFive,[],1); % convert matrix to column vector
percentCorrectFourMinusTen = reshape(percentCorrectFourMinusTen,[],1); % convert matrix to column vector
percentCorrectFourMinusTwenty = reshape(percentCorrectFourMinusTwenty,[],1); % convert matrix to column vector
percentcorrectfourMean=[percentCorrectFourPlusFive,percentCorrectFourPlusTen,percentCorrectFourPlusTwenty,percentCorrectFourMinusFive,percentCorrectFourMinusTen,percentCorrectFourMinusTwenty];
MeanFour = [0.05,0.18,0.24,0.69,0.8,0.95];


percentCorrectSixPlusFive = [six_Plus_Five_1 /5, six_Plus_Five_2 /5,six_Plus_Five_3 /5,six_Plus_Five_4 /5 six_Plus_Five_5 /5, ...
    six_Plus_Five_6 /5, six_Plus_Five_7 /5,six_Plus_Five_8 /5,six_Plus_Five_9 /5,six_Plus_Five_10 /5,six_Plus_Five_11 /5,six_Plus_Five_12 /5,six_Plus_Five_13 /5,...
    six_Plus_Five_14 /5,six_Plus_Five_16 /5,six_Plus_Five_18 /5,six_Plus_Five_19 /5,six_Plus_Five_20 /5,six_Plus_Five_21 /5,six_Plus_Five_22 /5, ];
 
percentCorrectSixPlusTen = [six_Plus_Ten_1 /5, six_Plus_Ten_2 /5,six_Plus_Ten_3 /5,six_Plus_Ten_4 /5 six_Plus_Ten_5 /5, ...
    six_Plus_Ten_6 /5, six_Plus_Ten_7 /5,six_Plus_Ten_8 /5,six_Plus_Ten_9 /5,six_Plus_Ten_10 /5,six_Plus_Ten_11 /5,six_Plus_Ten_12 /5,six_Plus_Ten_13 /5,...
    six_Plus_Ten_14 /5,six_Plus_Ten_16 /5,six_Plus_Ten_18 /5,six_Plus_Ten_19 /5,six_Plus_Ten_20 /5,six_Plus_Ten_21 /5,six_Plus_Ten_22 /5, ];
 
percentCorrectSixPlusTwenty = [six_Plus_Twenty_1 /5, six_Plus_Twenty_2 /5,six_Plus_Twenty_3 /5,six_Plus_Twenty_4 /5 six_Plus_Twenty_5 /5, ...
    six_Plus_Twenty_6 /5, six_Plus_Twenty_7 /5,six_Plus_Twenty_8 /5,six_Plus_Twenty_9 /5,six_Plus_Twenty_10 /5,six_Plus_Twenty_11 /5,six_Plus_Twenty_12 /5,six_Plus_Twenty_13 /5,...
    six_Plus_Twenty_14 /5,six_Plus_Twenty_16 /5,six_Plus_Twenty_18 /5,six_Plus_Twenty_19 /5,six_Plus_Twenty_20 /5,six_Plus_Twenty_21 /5,six_Plus_Twenty_22 /5, ];
 
percentCorrectSixMinusFive = [six_Minus_Five_1 /5, six_Minus_Five_2 /5,six_Minus_Five_3 /5,six_Minus_Five_4 /5 six_Minus_Five_5 /5, ...
    six_Minus_Five_6 /5, six_Minus_Five_7 /5,six_Minus_Five_8 /5,six_Minus_Five_9 /5,six_Minus_Five_10 /5,six_Minus_Five_11 /5,six_Minus_Five_12 /5,six_Minus_Five_13 /5,...
    six_Minus_Five_14 /5,six_Minus_Five_16 /5,six_Minus_Five_18 /5,six_Minus_Five_19 /5,six_Minus_Five_20 /5,six_Minus_Five_21 /5,six_Minus_Five_22 /5, ];
 
percentCorrectSixMinusTen = [six_Minus_Ten_1 /5, six_Minus_Ten_2 /5,six_Minus_Ten_3 /5,six_Minus_Ten_4 /5 six_Minus_Ten_5 /5, ...
    six_Minus_Ten_6 /5, six_Minus_Ten_7 /5,six_Minus_Ten_8 /5,six_Minus_Ten_9 /5,six_Minus_Ten_10 /5,six_Minus_Ten_11 /5,six_Minus_Ten_12 /5,six_Minus_Ten_13 /5,...
    six_Minus_Ten_14 /5,six_Minus_Ten_16 /5,six_Minus_Ten_18 /5,six_Minus_Ten_19 /5,six_Minus_Ten_20 /5,six_Minus_Ten_21 /5,six_Minus_Ten_22 /5, ];
 
percentCorrectSixMinusTwenty = [six_Minus_Twenty_1 /5, six_Minus_Twenty_2 /5,six_Minus_Twenty_3 /5,six_Minus_Twenty_4 /5 six_Minus_Twenty_5 /5, ...
    six_Minus_Twenty_6 /5, six_Minus_Twenty_7 /5,six_Minus_Twenty_8 /5,six_Minus_Twenty_9 /5,six_Minus_Twenty_10 /5,six_Minus_Twenty_11 /5,six_Minus_Twenty_12 /5,six_Minus_Twenty_13 /5,...
    six_Minus_Twenty_14 /5,six_Minus_Twenty_16 /5,six_Minus_Twenty_18 /5,six_Minus_Twenty_19 /5,six_Minus_Twenty_20 /5,six_Minus_Twenty_21 /5,six_Minus_Twenty_22 /5, ];
 
 
percentCorrectSixPlusFive = reshape(percentCorrectSixPlusFive,[],1); % convert matrix to column vector
percentCorrectSixPlusTen = reshape(percentCorrectSixPlusTen,[],1); % convert matrix to column vector
percentCorrectSixPlusTwenty = reshape(percentCorrectSixPlusTwenty,[],1); % convert matrix to column vector
percentCorrectSixMinusFive = reshape(percentCorrectSixMinusFive,[],1); % convert matrix to column vector
percentCorrectSixMinusTen = reshape(percentCorrectSixMinusTen,[],1); % convert matrix to column vector
percentCorrectSixMinusTwenty = reshape(percentCorrectSixMinusTwenty,[],1); % convert matrix to column vector
percentcorrectsixMean=[percentCorrectSixPlusFive,percentCorrectSixPlusTen,percentCorrectSixPlusTwenty,percentCorrectSixMinusFive,percentCorrectSixMinusTen,percentCorrectSixMinusTwenty];
MeanSix = [0.05,0.18,0.24,0.69,0.8,0.95];


percentCorrectEightPlusFive = [eight_Plus_Five_1 /5, eight_Plus_Five_2 /5,eight_Plus_Five_3 /5,eight_Plus_Five_4 /5 eight_Plus_Five_5 /5, ...
    eight_Plus_Five_6 /5, eight_Plus_Five_7 /5,eight_Plus_Five_8 /5,eight_Plus_Five_9 /5,eight_Plus_Five_10 /5,eight_Plus_Five_11 /5,eight_Plus_Five_12 /5,eight_Plus_Five_13 /5,...
    eight_Plus_Five_14 /5,eight_Plus_Five_16 /5,eight_Plus_Five_18 /5,eight_Plus_Five_19 /5,eight_Plus_Five_20 /5,eight_Plus_Five_21 /5,eight_Plus_Five_22 /5, ];
 
percentCorrectEightPlusTen = [eight_Plus_Ten_1 /5, eight_Plus_Ten_2 /5,eight_Plus_Ten_3 /5,eight_Plus_Ten_4 /5 eight_Plus_Ten_5 /5, ...
    eight_Plus_Ten_6 /5, eight_Plus_Ten_7 /5,eight_Plus_Ten_8 /5,eight_Plus_Ten_9 /5,eight_Plus_Ten_10 /5,eight_Plus_Ten_11 /5,eight_Plus_Ten_12 /5,eight_Plus_Ten_13 /5,...
    eight_Plus_Ten_14 /5,eight_Plus_Ten_16 /5,eight_Plus_Ten_18 /5,eight_Plus_Ten_19 /5,eight_Plus_Ten_20 /5,eight_Plus_Ten_21 /5,eight_Plus_Ten_22 /5, ];
 
percentCorrectEightPlusTwenty = [eight_Plus_Twenty_1 /5, eight_Plus_Twenty_2 /5,eight_Plus_Twenty_3 /5,eight_Plus_Twenty_4 /5 eight_Plus_Twenty_5 /5, ...
    eight_Plus_Twenty_6 /5, eight_Plus_Twenty_7 /5,eight_Plus_Twenty_8 /5,eight_Plus_Twenty_9 /5,eight_Plus_Twenty_10 /5,eight_Plus_Twenty_11 /5,eight_Plus_Twenty_12 /5,eight_Plus_Twenty_13 /5,...
    eight_Plus_Twenty_14 /5,eight_Plus_Twenty_16 /5,eight_Plus_Twenty_18 /5,eight_Plus_Twenty_19 /5,eight_Plus_Twenty_20 /5,eight_Plus_Twenty_21 /5,eight_Plus_Twenty_22 /5, ];
 
percentCorrectEightMinusFive = [eight_Minus_Five_1 /5, eight_Minus_Five_2 /5,eight_Minus_Five_3 /5,eight_Minus_Five_4 /5 eight_Minus_Five_5 /5, ...
    eight_Minus_Five_6 /5, eight_Minus_Five_7 /5,eight_Minus_Five_8 /5,eight_Minus_Five_9 /5,eight_Minus_Five_10 /5,eight_Minus_Five_11 /5,eight_Minus_Five_12 /5,eight_Minus_Five_13 /5,...
    eight_Minus_Five_14 /5,eight_Minus_Five_16 /5,eight_Minus_Five_18 /5,eight_Minus_Five_19 /5,eight_Minus_Five_20 /5,eight_Minus_Five_21 /5,eight_Minus_Five_22 /5, ];
 
percentCorrectEightMinusTen = [eight_Minus_Ten_1 /5, eight_Minus_Ten_2 /5,eight_Minus_Ten_3 /5,eight_Minus_Ten_4 /5 eight_Minus_Ten_5 /5, ...
    eight_Minus_Ten_6 /5, eight_Minus_Ten_7 /5,eight_Minus_Ten_8 /5,eight_Minus_Ten_9 /5,eight_Minus_Ten_10 /5,eight_Minus_Ten_11 /5,eight_Minus_Ten_12 /5,eight_Minus_Ten_13 /5,...
    eight_Minus_Ten_14 /5,eight_Minus_Ten_16 /5,eight_Minus_Ten_18 /5,eight_Minus_Ten_19 /5,eight_Minus_Ten_20 /5,eight_Minus_Ten_21 /5,eight_Minus_Ten_22 /5, ];
 
percentCorrectEightMinusTwenty = [eight_Minus_Twenty_1 /5, eight_Minus_Twenty_2 /5,eight_Minus_Twenty_3 /5,eight_Minus_Twenty_4 /5 eight_Minus_Twenty_5 /5, ...
    eight_Minus_Twenty_6 /5, eight_Minus_Twenty_7 /5,eight_Minus_Twenty_8 /5,eight_Minus_Twenty_9 /5,eight_Minus_Twenty_10 /5,eight_Minus_Twenty_11 /5,eight_Minus_Twenty_12 /5,eight_Minus_Twenty_13 /5,...
    eight_Minus_Twenty_14 /5,eight_Minus_Twenty_16 /5,eight_Minus_Twenty_18 /5,eight_Minus_Twenty_19 /5,eight_Minus_Twenty_20 /5,eight_Minus_Twenty_21 /5,eight_Minus_Twenty_22 /5, ];
 
 
percentCorrectEightPlusFive = reshape(percentCorrectEightPlusFive,[],1); % convert matrix to column vector
percentCorrectEightPlusTen = reshape(percentCorrectEightPlusTen,[],1); % convert matrix to column vector
percentCorrectEightPlusTwenty = reshape(percentCorrectEightPlusTwenty,[],1); % convert matrix to column vector
percentCorrectEightMinusFive = reshape(percentCorrectEightMinusFive,[],1); % convert matrix to column vector
percentCorrectEightMinusTen = reshape(percentCorrectEightMinusTen,[],1); % convert matrix to column vector
percentCorrectEightMinusTwenty = reshape(percentCorrectEightMinusTwenty,[],1); % convert matrix to column vector
percentcorrecteightMean=[percentCorrectEightPlusFive,percentCorrectEightPlusTen,percentCorrectEightPlusTwenty,percentCorrectEightMinusFive,percentCorrectEightMinusTen,percentCorrectEightMinusTwenty];
MeanEight = [0.05,0.18,0.24,0.69,0.8,0.95];






% %Individual Total
% 
% %0.4
% IndividualTotals_four_MinusFive = [four_Minus_Five_1,four_Minus_Five_2,four_Minus_Five_3,four_Minus_Five_4,four_Minus_Five_5,...
%     four_Minus_Five_6,four_Minus_Five_7,four_Minus_Five_8,four_Minus_Five_9,four_Minus_Five_10,four_Minus_Five_11,four_Minus_Five_12,four_Minus_Five_13,four_Minus_Five_14,...
%     four_Minus_Five_15,four_Minus_Five_16,four_Minus_Five_17,four_Minus_Five_18,four_Minus_Five_19,four_Minus_Five_20,four_Minus_Five_21];
%  
% IndividualTotals_four_PlusFive = [four_Plus_Five_1,four_Plus_Five_2,four_Plus_Five_3,four_Plus_Five_4,four_Plus_Five_5,...
%     four_Plus_Five_6,four_Plus_Five_7,four_Plus_Five_8,four_Plus_Five_9,four_Plus_Five_10,four_Plus_Five_11,four_Plus_Five_12,four_Plus_Five_13,four_Plus_Five_14,...
%     four_Plus_Five_15,four_Plus_Five_16,four_Plus_Five_17,four_Plus_Five_18,four_Plus_Five_19,four_Plus_Five_20,four_Plus_Five_21];
%  
% IndividualTotals_four_MinusTen = [four_Minus_Ten_1,four_Minus_Ten_2,four_Minus_Ten_3,four_Minus_Ten_4,four_Minus_Ten_5,...
%     four_Minus_Ten_6,four_Minus_Ten_7,four_Minus_Ten_8,four_Minus_Ten_9,four_Minus_Ten_10,four_Minus_Ten_11,four_Minus_Ten_12,four_Minus_Ten_13,four_Minus_Ten_14,...
%     four_Minus_Ten_15,four_Minus_Ten_16,four_Minus_Ten_17,four_Minus_Ten_18,four_Minus_Ten_19,four_Minus_Ten_20,four_Minus_Ten_21];
%  
% IndividualTotals_four_PlusTen = [four_Plus_Ten_1,four_Plus_Ten_2,four_Plus_Ten_3,four_Plus_Ten_4,four_Plus_Ten_5,...
%     four_Plus_Ten_6,four_Plus_Ten_7,four_Plus_Ten_8,four_Plus_Ten_9,four_Plus_Ten_10,four_Plus_Ten_11,four_Plus_Ten_12,four_Plus_Ten_13,four_Plus_Ten_14,...
%     four_Plus_Ten_15,four_Plus_Ten_16,four_Plus_Ten_17,four_Plus_Ten_18,four_Plus_Ten_19,four_Plus_Ten_20,four_Plus_Ten_21];
%  
% IndividualTotals_four_PlusTwenty = [four_Plus_Twenty_1,four_Plus_Twenty_2,four_Plus_Twenty_3,four_Plus_Twenty_4,four_Plus_Twenty_5,...
%     four_Plus_Twenty_6,four_Plus_Twenty_7,four_Plus_Twenty_8,four_Plus_Twenty_9,four_Plus_Twenty_10,four_Plus_Twenty_11,four_Plus_Twenty_12,four_Plus_Twenty_13,four_Plus_Twenty_14,...
%     four_Plus_Twenty_15,four_Plus_Twenty_16,four_Plus_Twenty_17,four_Plus_Twenty_18,four_Plus_Twenty_19,four_Plus_Twenty_20,four_Plus_Twenty_21];
%  
%  
% IndividualTotals_four_MinusTwenty = [four_Minus_Twenty_1,four_Minus_Twenty_2,four_Minus_Twenty_3,four_Minus_Twenty_4,four_Minus_Twenty_5,...
%     four_Minus_Twenty_6,four_Minus_Twenty_7,four_Minus_Twenty_8,four_Minus_Twenty_9,four_Minus_Twenty_10,four_Minus_Twenty_11,four_Minus_Twenty_12,four_Minus_Twenty_13,four_Minus_Twenty_14,...
%     four_Minus_Twenty_15,four_Minus_Twenty_16,four_Minus_Twenty_17,four_Minus_Twenty_18,four_Minus_Twenty_19,four_Minus_Twenty_20,four_Minus_Twenty_21];
% 
% %0.6
% 
% IndividualTotals_six_MinusFive = [six_Minus_Five_1,six_Minus_Five_2,six_Minus_Five_3,six_Minus_Five_4,six_Minus_Five_5,...
%     six_Minus_Five_6,six_Minus_Five_7,six_Minus_Five_8,six_Minus_Five_9,six_Minus_Five_10,six_Minus_Five_11,six_Minus_Five_12,six_Minus_Five_13,six_Minus_Five_14,...
%     six_Minus_Five_15,six_Minus_Five_16,six_Minus_Five_17,six_Minus_Five_18,six_Minus_Five_19,six_Minus_Five_20,six_Minus_Five_21];
%  
% IndividualTotals_six_PlusFive = [six_Plus_Five_1,six_Plus_Five_2,six_Plus_Five_3,six_Plus_Five_4,six_Plus_Five_5,...
%     six_Plus_Five_6,six_Plus_Five_7,six_Plus_Five_8,six_Plus_Five_9,six_Plus_Five_10,six_Plus_Five_11,six_Plus_Five_12,six_Plus_Five_13,six_Plus_Five_14,...
%     six_Plus_Five_15,six_Plus_Five_16,six_Plus_Five_17,six_Plus_Five_18,six_Plus_Five_19,six_Plus_Five_20,six_Plus_Five_21];
%  
% IndividualTotals_six_MinusTen = [six_Minus_Ten_1,six_Minus_Ten_2,six_Minus_Ten_3,six_Minus_Ten_4,six_Minus_Ten_5,...
%     six_Minus_Ten_6,six_Minus_Ten_7,six_Minus_Ten_8,six_Minus_Ten_9,six_Minus_Ten_10,six_Minus_Ten_11,six_Minus_Ten_12,six_Minus_Ten_13,six_Minus_Ten_14,...
%     six_Minus_Ten_15,six_Minus_Ten_16,six_Minus_Ten_17,six_Minus_Ten_18,six_Minus_Ten_19,six_Minus_Ten_20,six_Minus_Ten_21];
%  
% IndividualTotals_six_PlusTen = [six_Plus_Ten_1,six_Plus_Ten_2,six_Plus_Ten_3,six_Plus_Ten_4,six_Plus_Ten_5,...
%     six_Plus_Ten_6,six_Plus_Ten_7,six_Plus_Ten_8,six_Plus_Ten_9,six_Plus_Ten_10,six_Plus_Ten_11,six_Plus_Ten_12,six_Plus_Ten_13,six_Plus_Ten_14,...
%     six_Plus_Ten_15,six_Plus_Ten_16,six_Plus_Ten_17,six_Plus_Ten_18,six_Plus_Ten_19,six_Plus_Ten_20,six_Plus_Ten_21];
%  
% IndividualTotals_six_PlusTwenty = [six_Plus_Twenty_1,six_Plus_Twenty_2,six_Plus_Twenty_3,six_Plus_Twenty_4,six_Plus_Twenty_5,...
%     six_Plus_Twenty_6,six_Plus_Twenty_7,six_Plus_Twenty_8,six_Plus_Twenty_9,six_Plus_Twenty_10,six_Plus_Twenty_11,six_Plus_Twenty_12,six_Plus_Twenty_13,six_Plus_Twenty_14,...
%     six_Plus_Twenty_15,six_Plus_Twenty_16,six_Plus_Twenty_17,six_Plus_Twenty_18,six_Plus_Twenty_19,six_Plus_Twenty_20,six_Plus_Twenty_21];
%  
%  
% IndividualTotals_six_MinusTwenty = [six_Minus_Twenty_1,six_Minus_Twenty_2,six_Minus_Twenty_3,six_Minus_Twenty_4,six_Minus_Twenty_5,...
%     six_Minus_Twenty_6,six_Minus_Twenty_7,six_Minus_Twenty_8,six_Minus_Twenty_9,six_Minus_Twenty_10,six_Minus_Twenty_11,six_Minus_Twenty_12,six_Minus_Twenty_13,six_Minus_Twenty_14,...
%     six_Minus_Twenty_15,six_Minus_Twenty_16,six_Minus_Twenty_17,six_Minus_Twenty_18,six_Minus_Twenty_19,six_Minus_Twenty_20,six_Minus_Twenty_21];
% 
% %0.8
% 
% IndividualTotals_eight_MinusFive = [eight_Minus_Five_1,eight_Minus_Five_2,eight_Minus_Five_3,eight_Minus_Five_4,eight_Minus_Five_5,...
%     eight_Minus_Five_6,eight_Minus_Five_7,eight_Minus_Five_8,eight_Minus_Five_9,eight_Minus_Five_10,eight_Minus_Five_11,eight_Minus_Five_12,eight_Minus_Five_13,eight_Minus_Five_14,...
%     eight_Minus_Five_15,eight_Minus_Five_16,eight_Minus_Five_17,eight_Minus_Five_18,eight_Minus_Five_19,eight_Minus_Five_20,eight_Minus_Five_21];
%  
% IndividualTotals_eight_PlusFive = [eight_Plus_Five_1,eight_Plus_Five_2,eight_Plus_Five_3,eight_Plus_Five_4,eight_Plus_Five_5,...
%     eight_Plus_Five_6,eight_Plus_Five_7,eight_Plus_Five_8,eight_Plus_Five_9,eight_Plus_Five_10,eight_Plus_Five_11,eight_Plus_Five_12,eight_Plus_Five_13,eight_Plus_Five_14,...
%     eight_Plus_Five_15,eight_Plus_Five_16,eight_Plus_Five_17,eight_Plus_Five_18,eight_Plus_Five_19,eight_Plus_Five_20,eight_Plus_Five_21];
%  
% IndividualTotals_eight_MinusTen = [eight_Minus_Ten_1,eight_Minus_Ten_2,eight_Minus_Ten_3,eight_Minus_Ten_4,eight_Minus_Ten_5,...
%     eight_Minus_Ten_6,eight_Minus_Ten_7,eight_Minus_Ten_8,eight_Minus_Ten_9,eight_Minus_Ten_10,eight_Minus_Ten_11,eight_Minus_Ten_12,eight_Minus_Ten_13,eight_Minus_Ten_14,...
%     eight_Minus_Ten_15,eight_Minus_Ten_16,eight_Minus_Ten_17,eight_Minus_Ten_18,eight_Minus_Ten_19,eight_Minus_Ten_20,eight_Minus_Ten_21];
%  
% IndividualTotals_eight_PlusTen = [eight_Plus_Ten_1,eight_Plus_Ten_2,eight_Plus_Ten_3,eight_Plus_Ten_4,eight_Plus_Ten_5,...
%     eight_Plus_Ten_6,eight_Plus_Ten_7,eight_Plus_Ten_8,eight_Plus_Ten_9,eight_Plus_Ten_10,eight_Plus_Ten_11,eight_Plus_Ten_12,eight_Plus_Ten_13,eight_Plus_Ten_14,...
%     eight_Plus_Ten_15,eight_Plus_Ten_16,eight_Plus_Ten_17,eight_Plus_Ten_18,eight_Plus_Ten_19,eight_Plus_Ten_20,eight_Plus_Ten_21];
%  
% IndividualTotals_eight_PlusTwenty = [eight_Plus_Twenty_1,eight_Plus_Twenty_2,eight_Plus_Twenty_3,eight_Plus_Twenty_4,eight_Plus_Twenty_5,...
%     eight_Plus_Twenty_6,eight_Plus_Twenty_7,eight_Plus_Twenty_8,eight_Plus_Twenty_9,eight_Plus_Twenty_10,eight_Plus_Twenty_11,eight_Plus_Twenty_12,eight_Plus_Twenty_13,eight_Plus_Twenty_14,...
%     eight_Plus_Twenty_15,eight_Plus_Twenty_16,eight_Plus_Twenty_17,eight_Plus_Twenty_18,eight_Plus_Twenty_19,eight_Plus_Twenty_20,eight_Plus_Twenty_21];
%  
%  
% IndividualTotals_eight_MinusTwenty = [eight_Minus_Twenty_1,eight_Minus_Twenty_2,eight_Minus_Twenty_3,eight_Minus_Twenty_4,eight_Minus_Twenty_5,...
%     eight_Minus_Twenty_6,eight_Minus_Twenty_7,eight_Minus_Twenty_8,eight_Minus_Twenty_9,eight_Minus_Twenty_10,eight_Minus_Twenty_11,eight_Minus_Twenty_12,eight_Minus_Twenty_13,eight_Minus_Twenty_14,...
%     eight_Minus_Twenty_15,eight_Minus_Twenty_16,eight_Minus_Twenty_17,eight_Minus_Twenty_18,eight_Minus_Twenty_19,eight_Minus_Twenty_20,eight_Minus_Twenty_21];
% 
% 
% 
% 
% 
% 
% 
% 
% Individual_four = [IndividualTotals_four_MinusTwenty; IndividualTotals_four_MinusTen; IndividualTotals_four_MinusFive; IndividualTotals_four_PlusFive;...
%     IndividualTotals_four_PlusTen; IndividualTotals_four_PlusTwenty];
% 
% Individual_six = [IndividualTotals_six_MinusTwenty; IndividualTotals_six_MinusTen; IndividualTotals_six_MinusFive; IndividualTotals_six_PlusFive;...
%     IndividualTotals_six_PlusTen; IndividualTotals_six_PlusTwenty];
% 
% Individual_eight = [IndividualTotals_eight_MinusTwenty; IndividualTotals_eight_MinusTen; IndividualTotals_eight_MinusFive; IndividualTotals_eight_PlusFive;...
%     IndividualTotals_eight_PlusTen; IndividualTotals_eight_PlusTwenty];



%plotmatrix(x_Axis_Percent,Individual_four)
%scatter(x_Axis_Percent,Individual_four(:));

% figure(1)
% plot(x_Axis_Percent, Individual_four)                                                   % Plot Matrix
% axis([0  7    0  5])                                              % Set Axis Limits
% set(gca, 'XTick',x, 'XTickLabel',{'-20','-10','-5','+5','+10','+20'})             % Set Tick Labels
% xlabel('Percent Change')                                                 % X Axis Label
% ylabel('Correct Response')                                    % Y Axis Label

% x_Axis_Percent = [-20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20,...
%     -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20,...
%     -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20,...
%     -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20,...
%     -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20,...
%     -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20, -20 -10 -5 +5 +10 +20];
% 
% figure (1)
% bar3(Individual_four)
% ax = gca; 
% %Limiting # of YTicks to 5 between minimum and maximum. 
% %Inputting 5 YtickLabels accordingly. Select them as per your requirement.
% ax.YTick = linspace(min(ax.YTick),max(ax.YTick),5);
% ax.YTickLabel = strsplit(num2str(-20:5:20));  
% title('0.4 - Individual')
% 
% 
% figure (2)
% bar3(Individual_six)
% ax = gca; 
% %Limiting # of YTicks to 5 between minimum and maximum. 
% %Inputting 5 YtickLabels accordingly. Select them as per your requirement.
% ax.YTick = linspace(min(ax.YTick),max(ax.YTick),5);
% ax.YTickLabel = strsplit(num2str(-20:5:20));  
% title('0.6 - Individual')
% 
% 
% 
% figure (3)
% bar3(Individual_six)
% ax = gca; 
% %Limiting # of YTicks to 5 between minimum and maximum. 
% %Inputting 5 YtickLabels accordingly. Select them as per your requirement.
% ax.YTick = linspace(min(ax.YTick),max(ax.YTick),5);
% ax.YTickLabel = strsplit(num2str(-20:5:20));  
% title('0.8 - Individual')


% % Add title and axis labels
% title('All Participants correct responses - 0.4')
% xlabel('Correct Responses')
% ylabel('Particpant')
% zlabel('Number Correct')




correctFour = IncorrectMinusFive04+correctPlusFive04+IncorrectMinusTen04+correctPlusTen04+IncorrectMinusTwenty04+correctPlusTwenty04;
correctSix  = IncorrectMinusFive06+correctPlusFive06+IncorrectMinusTen06+correctPlusTen06+IncorrectMinusTwenty06+correctPlusTwenty06;
correctEight  = IncorrectMinusFive08+correctPlusFive08+IncorrectMinusTen08+correctPlusTen08+IncorrectMinusTwenty08+correctPlusTwenty08;

%The data to be used in the plot
%Intensities, NumberCorrect, NumberOfTrials
dataZeroFour =    [...

    -0.12,   IncorrectMinusFive04,    100 ;...
    +0.12,   correctPlusFive04,     100 ;...
    -0.25,   IncorrectMinusTen04,    100 ;...
    +0.25,   correctPlusTen04,      100;...
    -0.50,   IncorrectMinusTwenty04,  100 ;...
    +0.50,   correctPlusTwenty04,   100];

dataZeroSix =    [...

    -0.08,   IncorrectMinusFive06,    100 ;...
    +0.08,   correctPlusFive06,     100 ;...
    -0.16,   IncorrectMinusTen06,     100 ;...
    +0.16,   correctPlusTen06,      100 ;...
    -0.33,   IncorrectMinusTwenty06,  100;...
    +0.33,   correctPlusTwenty06,   100];

dataZeroEight =    [...

    -0.06,   IncorrectMinusFive08,    100  ;...
    +0.06,   correctPlusFive08,     100;...
    -0.12,   IncorrectMinusTen08,     100 ;...
    %+0.12,   correctPlusTen08,      100;...
    -0.25,   IncorrectMinusTwenty08,  100];    
    %+0.25,   correctPlusTwenty08,   100];

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


%resultZeroFourAll.Fit;
%resultZeroSixAll.Fit;
%resultZeroEightAll.Fit;


%result.Fit
%result.conf_Intervals
IncorrectFour = 500 -correctFour;
standardDeviationZeroFourIncorrect = zeros(1,IncorrectFour);

standardDeviationZeroFourCorrect = ones(1,correctFour);
stdfourmatrix = [standardDeviationZeroFourIncorrect standardDeviationZeroFourCorrect];
meanfour = mean (stdfourmatrix);
stdfour = std(stdfourmatrix);

Incorrectsix = 500 - correctSix;
standardDeviationZerosixIncorrect = zeros(1,Incorrectsix);

standardDeviationZerosixCorrect = ones(1,correctSix);
stdsixmatrix = [standardDeviationZerosixIncorrect standardDeviationZerosixCorrect];
meansix = mean(stdsixmatrix);
stdsix = std(stdsixmatrix);

Incorrecteight = 500 -correctEight;
standardDeviationZeroeightIncorrect = zeros(1,Incorrecteight);

standardDeviationZeroeightCorrect = ones(1,correctEight);
stdeightmatrix = [standardDeviationZeroeightIncorrect standardDeviationZeroeightCorrect];
meaneight = mean(stdeightmatrix);
stdeight = std(stdeightmatrix);

%Plot

plotOptionsA            = struct;   % initialize as an empty struct
plotOptionsA.aspectRatio    = true; 
plotOptionsA.plotPar        = true; %Threshold 
plotOptionsA.extrapolLength = 0;  %Extrapolation Length Standard .2
plotOptionsA.xLabel         = 'Change Of stiffness (% with respect to reference k_{ref,1})'; 


plotOptionsB            = struct;   % initialize as an empty struct
plotOptionsB.aspectRatio    = true; 
plotOptionsB.plotPar        = true; %Threshold 
plotOptionsB.extrapolLength = 1;  %Extrapolation Length Standard .2
plotOptionsB.xLabel         = 'Change Of stiffness (% with respect to reference k _{ref,2})'; 
plotOptionsB.yLabel         = 'Proportion of correct answers'; 


txtC = texlabel('k_ref, 3');
plotOptionsC             = struct;   % initialize as an empty struct
plotOptionsC.aspectRatio    = true; 
plotOptionsC.plotPar        = true; %Threshold 
plotOptionsC.extrapolLength = 2;  %Extrapolation Length Standard .2
plotOptionsC.xLabel         = 'Change Of Stiffness (% with respect to reference k _{ref,3})'; 
plotOptionsC.yLabel         = 'Proportion of correct answers'; 

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
plotOptionsI.extrapolLength = 0;  %Extrapolation Length Standard .2
%plotOptionsI.xLabel         = 'Stimulus Level - Reference 0.4';


%thresholdfour = getThreshold(resultZeroFour,stdfour);
MeanFourX = getThreshold(resultZeroFour,meanfour);
stdFourX = getThreshold(resultZeroFour,stdfour);

%thresholdsix = getThreshold(resultZeroSix,stdsix);
MeanSixX = getThreshold(resultZeroFour,meansix);
stdSixX = getThreshold(resultZeroFour,stdsix);
%thresholdEight = getThreshold(resultZeroEight,stdeight);

MeaneightX = getThreshold(resultZeroFour,meaneight);
stdeightX = getThreshold(resultZeroFour,stdeight);

fourSeventyFiveThreshold = getThreshold(resultZeroFour,0.75);
sixSeventyTwentyFiveThreshold = getThreshold(resultZeroSix,0.25);
sixFiveThreshold = getThreshold(resultZeroSix,0.5);
sixSeventyFiveThreshold = getThreshold(resultZeroSix,0.75);

EightTwentyFiveThreshold = getThreshold(resultZeroEight,0.25);
EightFiftyThreshold = getThreshold(resultZeroEight,0.5);
EightTwentySeventyFiveThreshold = getThreshold(resultZeroEight,0.75);


PSEfour = getThreshold(resultZeroFour,0.5);
PSEsix = getThreshold(resultZeroSix,0.5);
PSEeight = getThreshold(resultZeroEight,0.5);


plotPsych(resultZeroFour, plotOptionsA);
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

%plotPsych(resultZeroFour,plotOptionsA);
%plotPsych(resultZeroSix,plotOptionsB);
%plotPsych(resultZeroEight,plotOptionsC);

%Individual 3 Refs
% plotOptionsI.dataColor = [0,0,0];  % colour of the data points
% [hline,hdata] = plotPsych(resultZeroFour,plotOptionsI);
% plotOptionsI.lineColor = [1,0,0];
% plotOptionsI.dataColor = [1,0,0];  % colour of the data points
% hold on
% [hline2,hdata2] = plotPsych(resultZeroSix,plotOptionsI);
% plotOptionsI.lineColor = [0,1,0];
% plotOptionsI.dataColor = [0,1,0];
% hold on
% [hline3,hdata3] = plotPsych(resultZeroEight,plotOptionsI);
% legend([hline,hline2,hline3],'0.4','0.6','0.8')
% 


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


  %x = [-0.50; -0.25; -0.12; +0.12; +0.25; + 0.50];
% 
%     -0.12,   IncorrectMinusFive04,    85 ;...
%     +0.12,   correctPlusFive04,     85 ;...
%     -0.25,   IncorrectMinusTen04,     85 ;...
%     +0.25,   correctPlusTen04,      85 ;...
%     -0.50,   IncorrectMinusTwenty04,  85 ;...
%     +0.50,   correctPlusTwenty04,   85];
% 
% 
  %rzerofour = [IncorrectMinusTwenty04,IncorrectMinusTen04,IncorrectMinusFive04,correctPlusFive04,correctPlusTen04,correctPlusTwenty04];
  %rzerosix = [16;34;45;52;81;72];
  %rzeroeight = [IncorrectMinusTwenty08;IncorrectMinusTen08;IncorrectMinusFive08;correctPlusFive08;correctPlusTen08;correctPlusTwenty08];
% 
%  
%  m =[100;100;100;100;100;100];
% % 
%  %scatter(xaxis, yaxisZeroFour);
% 
% r = rzeroeight;
% figure; plot( x, r ./ m, 'k.','MarkerSize', 20); axis([-0.50 +0.50 -0.02 1]); axis square;
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
% 
% 





