(*Mathematica code deriving and plotting the Capitalist Spirit modelin the paper "Why Do the Rich Save So Much?"*)utility = (ct^(1-rho))/(1-rho) + ((((wt-ct)(1-tau))+gamma)^(1-alpha))/(1-alpha)gamma = 1;ConsEqn = Solve[{wt + gamma - ct - ct^2==0},ct];ConsEqnUpper = ConsEqn[[2,1,2]];Cstar = Function[wt,Evaluate[ConsEqnUpper]];Clear[ConsOpt];ConsOpt[wt_] := Min[Cstar[wt],wt];Clear[SaveOpt];SaveOpt[x_] := (x - ConsOpt[x])/x;WIUFSave = Plot[SaveOpt[x],{x,.01,10},AxesLabel->{"W","Saving Rate"}];Clear[ntm1];ConsWBeqTaxEqn = Solve[{(wt - ct)ntm1 + gamma - ntm1 ct^2==0},ct];ConsWBeqTaxEqnUpper = ConsWBeqTaxEqn[[1,1,2]];ConsWBeqTaxEqnLower = ConsWBeqTaxEqn[[2,1,2]];CstarWBeqTax = Function[wt,Evaluate[ConsWBeqTaxEqnUpper]];Clear[ConsWBeqTaxOpt];ConsWBeqTaxOpt[wt_] := Min[CstarWBeqTax[wt],wt];FortyFive = Plot[x,{x,0,3},PlotStyle->GrayLevel[.5]];tau = .4;ntm1 = -(tau-1);Tax40Plot = Plot[CstarWBeqTax[w],{w,0,10}];CrossOver40 = w /. FindRoot[CstarWBeqTax[w] == w,{w,{.1,10}}]tau = .8;ntm1 = -(tau-1);Tax80Plot = Plot[CstarWBeqTax[w],{w,0,10}];CrossOver80 = w /. FindRoot[CstarWBeqTax[w] == w,{w,{.1,10}}]Show[FortyFive,Tax40Plot,Tax80Plot,Graphics[Text["\[LeftArrow] \[Tau]=.4",{6,2},{-1,-1}]],Graphics[Text["\[Tau]=.8 \[RightArrow]",{4,2.8},{-1,-1}]],Graphics[Text["45 Degree",{3.3,3.3},{0,0}]],Graphics[Text["\!\(\[Omega]\_2\)", {CrossOver80 - .1, CrossOver80}, {0,-1}]],Graphics[Text["\!\(\[Omega]\_1\)", {CrossOver40 - .1, CrossOver40}, {0,-1}]],Graphics[{Dashing[{.01}],Line[{{CrossOver80,0},{CrossOver80,CrossOver80}}]}],Graphics[{Dashing[{.01}],Line[{{CrossOver40,0},{CrossOver40,CrossOver40}}]}],AxesLabel->{"W","C"},Ticks->{(TickFunction[#1,#2,TextFunction->TrimText]&),(TickFunction[#1,#2,TextFunction->TrimText]&)},PlotRange->{{0,8},{0,3.5}}]