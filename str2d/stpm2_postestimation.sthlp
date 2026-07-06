{smcl}
{* *! version 1.3.5 11Mar2011}{...}
{cmd:help stpm2 postestimation} 
{right:also see:  {help stpm2}}
{hline}

{title:Title}

{p2colset 5 34 36 2}{...}
{p2col :{hi:[ST] stpm2 postestimation} {hline 2}}Post-estimation tools for stpm2{p_end}
{p2colreset}{...}


{title:Description}

{pstd}
The following standard post-estimation commands are available:

{synoptset 13 notes}{...}
{p2coldent :command}description{p_end}
{synoptline}
INCLUDE help post_adjust2
INCLUDE help post_estat
INCLUDE help post_estimates
INCLUDE help post_lincom
INCLUDE help post_lrtest
INCLUDE help post_nlcom
{p2col :{helpb stpm2 postestimation##predict:predict}}predictions, residuals etc{p_end}
INCLUDE help post_predictnl
INCLUDE help post_test
INCLUDE help post_testnl
{synoptline}
{p2colreset}{...}


{marker predict}{...}
{title:Syntax for predict}


{p 8 16 2}
{cmd:predict} {newvar} {ifin} [{cmd:,} {it:statistic} ]


{phang}
Note: in the table below, {it:vn} is an abbreviation for {it:varname}.

{synoptset 31 tabbed}{...}
{synopthdr :statistic}
{synoptline}
{syntab:Main}
{synopt :{opt abc}}area between log hazard ratio curves{p_end}
{synopt :{opt at(vn # [vn # ...])}}predict at values of specified covariates{p_end}
{synopt :{opt cen:tile(#)}}#th centile of survival distribution{p_end}
{synopt :{opt ci}}calculate confidence intervals{p_end}
{synopt :{opt cumh:azard}}cumulative hazard{p_end}
{synopt :{opt cumo:dds}}cumulative odds{p_end}
{synopt :{opt cure}}cure proportion{p_end}
{synopt :{opt dens:ity}}density function{p_end}
{synopt :{opt h:azard}}hazard function{p_end}
{synopt :{opt hrn:umerator(vn # [vn # ...])}}numerator for (time-dependent) hazard ratio{p_end}
{synopt :{opt hrd:enominator(vn # [vn # ...])}}denominator for (time-dependent) hazard ratio{p_end}
{synopt :{opt hdiff1(vn # [vn # ...])}}1st hazard function for difference in hazard functions{p_end}
{synopt :{opt hdiff2(vn # [vn # ...])}}2nd hazard function for difference in hazard functions{p_end}
{synopt :{opt mart:ingale}}martingale residuals{p_end}
{synopt :{opt means:urv}}population averaged survival function{p_end}
{synopt :{opt nor:mal}}standard normal deviate of survival function{p_end}
{synopt :{opt per(#)}}express hazard rates (and differences) per # person years{p_end}
{synopt :{opt rm:st}}restricted mean survival time{p_end}
{synopt :{opt sdiff1(vn # [vn # ...])}}1st survival curve for difference in survival functions{p_end}
{synopt :{opt sdiff2(vn # [vn # ...])}}2nd survival curve for difference in survival functions{p_end}
{synopt :{opt stdp}}standard error of predicted function{p_end}
{synopt :{opt s:urvival}}survival function{p_end}
{synopt :{opt time:var(vn)}}time variable used for predictions (default {cmd:_t}){p_end}
{synopt :{opt tma:x(#)}}upper bound of time for {opt rmst} and {opt abc} options{p_end}
{synopt :{opt tmi:n(#)}}lower bound of time for {opt rmst} and {opt abc} options{p_end}
{synopt :{opt tvc(vn)}}time-varying coefficient for {it: varname}{p_end}
{synopt :{opt unc:cured}}obtain survival and hazard functions for the 'uncured'{p_end}
{synopt :{opt xb}}the linear predictor{p_end}
{synopt :{opt xbnob:aseline}}predicts the linear predictor, excluding the spline function{p_end}
{synopt :{opt zero:s}}sets all covariates to zero (baseline prediction){p_end}

{syntab:Subsidiary}
{synopt :{opt centol(#)}}tolerance level when estimating centile{p_end}
{synopt :{opt dev:iance}}deviance residuals{p_end}
{synopt :{opt dxb}}derivative of linear predictor{p_end}
{synopt :{opt lev:el(#)}}sets confidence level (default 95){p_end}
{synopt :{opt startunc(#)}}sets starting value for Newton-Raphson algorithm for estimating a centile 
of the survival distribution of 'uncured'{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2} 
Statistics are available both in and out of sample; type
{cmd:predict} {it:...} {cmd:if e(sample)} {it:...} if wanted only for the
estimation sample.{p_end}
{p 4 6 2} 


{title:Options for predict}

{pstd}
Note that if a relative survival model has been fitted by use of the
{cmd:bhazard()} option then survival refers to relative
survival and hazard refers to excess hazard.

{dlgtab:Main}

{phang}
{opt abc} evaluates the area between a constant log hazard ratio and a
time-dependent log hazard ratio curve. It integrates the difference between
a log HR curve and a constant log HR over the time range between {opt tmin()}
and {opt tmax()}. The constant HR is supplied by the {opt hr0()} option.
The time-dependent log HR curve is determined according to {opt hrnumerator()},
which must therefore be specified. You may also specify
{opt hrdenominator()}. The {opt n()}, {opt at()} and {opt zeros} options
are valid with {opt abc}.

{phang}
{opt at(varname # [ varname # ...])} requests that the covariates specified by 
the listed {it:varname}(s) be set to the listed {it:#} values. For example,
{cmd:at(x1 1 x3 50)} would evaluate predictions at {cmd:x1} = 1 and
{cmd:x3} = 50. This is a useful way to obtainThis is a useful way to obtain
out of sample predictions. Note that if {opt at()} is used together
with {opt zeros} all covariates not listed in {opt at()}
are set to zero. If {opt at()} is used without {opt zeros} then
all covariates not listed in {opt at()} are set to their sample
values. See also {opt zeros}.

{phang}
{opt centile(#)} gives the {it:#}th centile of the survival time distribution,
calculated using a Newton-Raphson algorithm.

{phang}
{opt ci} calculate a confidence interval for the requested statistic and
stores the confidence limits in {it:newvar}{cmd:_lci} and
{it:newvar}{cmd:_uci}.

{phang}
{opt cumhazard} predicts the cumulative hazard function.

{phang}
{opt cumodds} predicts the cumulative odds of failure function.

{phang}
{opt cure} predicts the cure proportion after fitting a cure model.

{phang}
{opt density} predicts the density function.

{phang}
{opt hazard} predicts the hazard function.

{phang}
{opt hdiff1(varname # ...)}, {opt hdiff2(varname # ...)} predict
the difference in hazard functions with the first hazard function defined
by the covariate values listed for {opt hdiff1()} and the second by
those listed for {opt hdiff2()}. By default, covariates not specified
using either option are set to zero. Note that setting the remaining values
of the covariates to zero may not always be sensible. If {it:#} is set to
missing ({cmd:.}) then {it:varname} takes its observed values in the dataset.

{pmore}
Example: {cmd:hdiff1(hormon 1)} (without specifying {cmd:hdiff2()})
computes the difference in predicted hazard functions at {cmd:hormon}
= 1 compared with {cmd:hormon} = 0.

{pmore}
Example: {cmd:hdiff1(hormon 2) hdiff2(hormon 1)} computes the difference in
predicted hazard functions at {cmd:hormon} = 2 compared with {cmd:hormon} = 1.

{pmore}
Example: {cmd:hdiff1(hormon 2 age 50) hdiff2(hormon 1 age 30)}
computes the difference in predicted hazard functions at
{cmd:hormon} = 2 and {cmd:age} = 50 compared with {cmd:hormon} = 1
and {cmd:age} =30.

{phang}
{opt hrdenominator(varname # ...)} specifies the denominator of the hazard
ratio. By default all covariates other than {it:varname} and any other
variables mentioned are set to zero. See cautionary note in {opt hrnumerator}.
If {it:#} is set to missing ({cmd:.}) then {it:varname} takes its observed values
in the dataset.

{phang}
{opt hrnumerator(varname # ...)} predicts the (time-dependent) hazard ratio
with the numerator of the hazard ratio. By default all covariates other than
{it:varname} and any other variables mentioned are set to zero. Note that
setting the remaining values of the covariates to zero may not always be
sensible, particularly with models other than on the cumulative hazard scale,
or when more than one variable has a time-dependet effect. If {it:#} is set
to missing ({cmd:.}) then {it:varname} takes its observed values in the dataset.

{phang}
{opt martingale} calculates martingale residuals.

{phang}
{opt meansurv} calculate the population average survival curve. Note this
differs from the predicted survival curve at the mean of all the covariates
in the model. A predicted survival curve is obtained for each subject and all
the survival curves are averaged. The process can be computationally intensive.
It is recommended that the {opt timevar()} option is used to reduce the number
of survival times at which ths survival curves are averaged. Combining this
option with the {cmd:at()} option enables adjusted survival curves to be
estimated.

{phang}
{opt n(#)} [{opt rmst} only] defines the number of evaluation points
for integrating the estimated survival function(s) with respect to time.
The larger {it:#} is, the more accurate is the estimated restricted mean
survival time, but the longer the calculation takes. There is no gain
by setting {it:#} above 5000. Default {it:#} is 1000.

{phang}
{opt normal} predicts the standard normal deviate of the survival function.

{phang}
{opt per(#)} express hazard rates and difference in hazard rates per # person years.

{phang}
{opt rmst} evaluates the mean or restricted mean survival time. This is
done by integrating the predicted survival curve from 0 to {opt tmax(#)};
see also the {opt n()} and {opt tmax()} options. Note that the {opt at()}
and {opt zeros} options are valid with {opt rmst}.

{phang}
{opt sdiff1(varname # ...)}, {opt sdiff2(varname # ...)} predict
the difference in survival curves with the first survival curve defined
by the covariate values listed for {opt sdiff1()} and the second by
those listed for {opt sdiff2()}. By default, covariates not specified
using either option are set to zero. Note that setting the remaining values
of the covariates to zero may not always be sensible. If {it:#} is set to
missing ({cmd:.}) then {it:varname} takes its observed values in the dataset.

{pmore}
Example: {cmd:sdiff1(hormon 1)} (without specifying {cmd:sdiff2()})
computes the difference in predicted survival curves at {cmd:hormon}
= 1 compared with {cmd:hormon} = 0.

{pmore}
Example: {cmd:sdiff1(hormon 2) sdiff2(hormon 1)} computes the difference in
predicted survival curves at {cmd:hormon} = 2 compared with {cmd:hormon} = 1.

{pmore}
Example: {cmd:sdiff1(hormon 2 age 50) sdiff2(hormon 1 age 30)}
computes the difference in predicted survival curves at
{cmd:hormon} = 2 and {cmd:age} = 50 compared with {cmd:hormon} = 1
and {cmd:age} =30.

{phang}
{opt stdp} calculates standard error of prediction and stores it in
{newvar}{cmd:_se}. Only available for the {opt xb}, {opt dxb},
{opt xbnobaseline} and {opt rmst} options.

{phang}
{opt survival} predicts the survival function.

{phang}
{opt timevar(varname)} defines the variable used as time in the predictions.
Default {it:varname} is {cmd:_t}. This is useful for large datasets where 
for plotting purposes predictions are only needed for 200 observations for example. 
Note that some caution should be taken when using this option as predictions may be 
made at whatever covariate values are in the first 200 rows of data.
This can be avoided by using the {opt at()} option and/or the {opt zeros} option to 
define the covariate patterns for which you require the predictions.

{phang}
{opt tmax(#)} [{opt rmst} and {opt abc} only] defines the upper limit of time
over which the integration of the estimated survival function is to be
conducted. Default {it:#} is 0, meaning an upper limit as close to
t = infinity as is reasonable (in fact, using the estimated 99.999999th
centile of the survival distribution).

{phang}
{opt tmin(#)} [{opt rmst} and {opt abc} only] defines the lower bound of time
over which the integration of the estimated survival function is to be
conducted. Default {it:#} is -1, taken as 0 and meaning a lower bound of 0.

{phang}
{opt tvc(varname)} stands for "time-varying coefficient" and computes the estimated coefficient 
for {it: varname}, a covariate in stpm2's varlist. If {it: varname} is "time-fixed", 
then {it: newvarname} will be a constant. If {it: varname} is included in the {opt tvc()} option,
then {it: newvarname} will depend on {cmd: _t} and may be interpreted as the time-varying effect
of {it: varname} on the chosen scale of the model (proportional hazards, proportional odds
or probit).  For example, in a hazards-scale model ({cmd: scale(hazard)}), {it: newvarname}
multiplied by {it: varname} will be an estimate of the time-varying log cumulative hazard 
ratio for {it: varname} (compared with {it: varname} = 0) at every observed value of {it: varname}. 
{it: newvarname} alone will give the log cumulative hazard ratio for a one-unit change 
in {it: varname}. Note that the time-varying log cumulative hazard ratio for {it: varname}
will NOT be identical to the time- varying log hazard ratio for {it: varname}.

{phang}
{opt tmax(#)} [{opt rmst} only] defines the upper limit of time over which
the integration of the estimated survival function is to be conducted.
Effectively, this gives the mean of a time-to-event distribution truncated
at {it:#}. Default {it:#} is 0, meaning an upper limit as close to
t = infinity as is reasonable (in fact, using the estimated 99.999999th
centile of the survival distribution).


{phang}
{opt uncured} can be used after fitting a cure model. It can be used with the
{cmd:survival}, {cmd:hazard} or {opt centile()} options to base predictions 
for the 'uncured' group.

{phang}
{opt xb} predicts the linear predictor, including the spline function.

{phang}
{opt xbnobaseline} predicts the linear predictor, excluding the spline
function - i.e. only the time-fixed part of the model.

{phang}
{opt zeros} sets all covariates to zero (baseline prediction). For 
example, {cmd:predict s0, survival zeros} calculates the baseline
survival function. See also {opt at()}.

{dlgtab:Subsidiary}

{phang}
{opt centol(#)} defines the  tolerance when searching for predicted
suvival time at a given centile of the survival distribution. Default
{it:#} is 0.0001.

{phang}
{opt deviance} calculates deviance residuals.

{phang}
{opt dxb} calculates the derivative of the linear predictor.

{phang}
{opt level(#)} sets the confidence level; default is {cmd:level(95)}
or as set by (help set level}.

{phang}
{opt startunc(#)} sets starting value for Newton-Raphson algorithm for estimating a 
centile of the survival time distribution of 'uncured'; default 25th centile of 
the observed follow-up times. 
{title:Examples}

{pstd}Setup{p_end}
{phang2}{stata "webuse brcancer"}{p_end}
{phang2}{stata "stset rectime, failure(censrec = 1)"}{p_end}

{pstd}Proportional hazards model{p_end}
{phang2}{stata "stpm2 hormon, scale(hazard) df(4) eform"}{p_end}
{phang2}{stata "predict h, hazard ci"}{p_end}
{phang2}{stata "predict s, survival ci"}{p_end}

{pstd}Time-dependent effects on cumulative hazard scale{p_end}
{phang2}{stata "stpm2 hormon, scale(hazard) df(4) tvc(hormon) dftvc(3)"}{p_end}
{phang2}{stata "predict hr, hrnumerator(hormon 1) ci"}{p_end}
{phang2}{stata "predict survdiff, sdiff1(hormon 1) ci"}{p_end}
{phang2}{stata "predict hazarddiff, hdiff1(hormon 1) ci"}{p_end}


{pstd}Use of at() option{p_end}
{phang2}{stata "stpm2 hormon x1, scale(hazard) df(4) tvc(hormon) dftvc(3)"}{p_end}
{phang2}{stata "predict s60h1, survival at(hormon 1 x1 60) ci"}{p_end}


{title:Also see}

{psee}
Online:  {manhelp stpm2 ST}; 
{p_end}

