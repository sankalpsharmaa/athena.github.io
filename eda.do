set more off

global path "\\Sankalpsharma\MSE\Research\athena\survey"

cd $path

use "survey.dta" , clear

* MSE indicator
gen mse = (institution == 13)
label define mse 0 "Non-MSE" 1 "MSE"
la val mse mse

* colleges

gen college = 1 if institution == 13
replace college = 2 if institution == 5
replace college = 3 if institution == 10
replace college = 4 if institution == 19
replace college = 5 if institution == 6
replace college = 6 if college == .

la define college 1 "MSE" 2 "DSE" 3 "JNU" 4 "UoH" 5 "GIPE" 6 "Others"

la val college college

* GAD score
egen gad_score = rowtotal(gad_*)


* online learning
graph hbar (mean) online_learning, over(institution, sort(online_learning) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Rating for Online Learning (1-5)) graphregion(margin(large))

/* gad scores */

* 1. institution
graph hbar (mean) gad_score, over(institution, sort(gad_score) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Self-reported stress (1-5)) graphregion(margin(large))

* 2. gender
graph hbar (mean) gad_score, over(sex, sort(gad_score) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score) graphregion(margin(large))

* 3. social group
graph hbar (mean) gad_score, over(social_group, sort(gad_score) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score) graphregion(margin(large))

* 4. family monthly income **!
graph hbar (mean) gad_score, over(family_monthly_income , sort(gad_score) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score) graphregion(margin(large))

/* skill acquisition */

* 1. residence
graph hbar (mean) skill_acq, over(residence, sort(skill_acq) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Skill Acquisition (1 (Easiest) - 5 (Difficult))) graphregion(margin(large))

********************
* Mohit's analysis 
********************

global data "C:\Users\verma\Downloads\survey"

use "$data/survey.dta" , clear

//Recoding GAD Scores into (0/1/2/3) scale
recode gad_1 1=0 2=1 3=2 4=3
recode gad_2 1=0 2=1 3=2 4=3
recode gad_3 1=0 2=1 3=2 4=3
recode gad_4 1=0 2=1 3=2 4=3
recode gad_5 1=0 2=1 3=2 4=3
recode gad_6 1=0 2=1 3=2 4=3
recode gad_7 1=0 2=1 3=2 4=3

//GAD score
egen gad_score = rowtotal(gad_*)


//Data Distribution

*1 Caste wise distribution 
graph hbar, over( social_group , sort(1) descending) cw

*2 Bar graph for Institution Wise distribution
graph hbar, over(institution, sort(1) descending) cw

*3 Residence wise distribution
graph hbar, over(residence , sort(1) descending) cw

*4 Stress
graph hbar, over( stress_routine_act ) cw

*5 Income wise distribution
graph hbar, over( family_monthly_income ) cw

*6 Screen Time
graph hbar, over( screen_time, sort(1) descending) cw




//residence

*1 Internet Speed
graph hbar (mean) internet_speed, over(residence, sort( internet_speed ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Internet Speed by Region (1-5)) graphregion(margin(large))

*2 Online Learning
graph hbar (mean) online_learning, over(residence, sort(online_learning) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Rating for Online Learning (1-5)) graphregion(margin(large))

*3 Skills
graph hbar (mean) skill_acq , over(residence, sort( skill_acq ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Difficulty in Acquiring New Skills (1-5)) graphregion(margin(large))

*4 GAD Scores
graph hbar (mean) gad_score , over(residence, sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))


//Sex

*1 GAD Scores
graph hbar (mean) gad_score , over(sex, sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))

*2 Skills
graph hbar (mean) skill_acq , over(sex, sort( skill_acq ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Difficulty in Skill Acquisition(1-5)) graphregion(margin(large))

*3 Online Learning
graph hbar (mean) online_learning , over(sex, sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))


//Social Groups

*1 GAD Scores
graph hbar (mean) gad_score , over( social_group , sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))

*2 Online Learning
graph hbar (mean) online_learning , over( social_group , sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))

*3 Job Search
graph bar, over( job_search ) over( social_group ) ytitle("percent") title("Difficulty in Searching for Job")blabel(name) asyvars percentages legend(off)


//College

*1 GAD Scores
graph hbar (mean) gad_score , over( institution , sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))

*2 Online Learning
graph hbar (mean) online_learning , over( institution , sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))
 
 
//Internet Speed 

*Online Learning
graph hbar (mean) online_learning , over( internet_speed , sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))


//Family Income

*1 GAD Scores
graph hbar (mean) gad_score , over( family_monthly_income , sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))

*2 Job Search
 graph bar, over( job_search ) over( family_econ_loss ) ytitle("percent") asyvars percentages


//Education Loan

*1 Stress
graph hbar (mean) stress_routine_act , over( ed_loan , sort( stress_routine_act ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Stress Score(1-5)) graphregion(margin(large))

*2 GAD Scores
graph hbar (mean) gad_score , over( ed_loan , sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))


//Expected grades wise average online learning
graph hbar (mean) online_learning , over( ed_score_expected , sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))


//Study Groups

*1 Expected Grades
graph bar, over( ed_score_expected ) over( study_groups ) ytitle("percent") asyvars percentages

*2 Stress
graph hbar (mean) stress_routine_act , over( study_groups , sort( stress_routine_act ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Stress Score(1-5)) graphregion(margin(large))

*3 GAD Scores
graph hbar (mean) gad_score , over( study_groups , sort( gad_score ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average GAD Score(1-21)) graphregion(margin(large))

*4 Skills
graph hbar (mean) skill_acq , over( study_groups , sort( skill_acq ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Difficulty in Acquiring New Skills (1-5)) graphregion(margin(large))

*5 Online Learning
graph hbar (mean) online_learning , over( study_groups , sort( online_learning ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average online Learning Score(1-5)) graphregion(margin(large))

*6 Residence
graph bar, over( study_groups ) over( residence ) ytitle("percent") asyvars percentages

*7 Gender
graph bar, over( study_groups ) over( sex ) ytitle("percent") asyvars percentages

*8 Caste
graph bar, over( study_groups ) over( social_group ) ytitle("percent") asyvars percentages


//Job Search Difficulty

*1 Study Groups
graph bar, over( job_search ) over( study_groups ) ytitle("percent") asyvars percentages

*2 Stress
graph hbar (mean) stress_routine_act , over( job_search , sort( stress_routine_act ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Stress Score(1-5)) graphregion(margin(large))

*3 Skills
graph hbar (mean) skill_acq , over( job_search , sort( skill_acq ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Difficulty in Acquiring New Skills (1-5)) graphregion(margin(large))

*4 Caste
graph bar, over( job_search ) over( social_group ) ytitle("percent") asyvars percentages

*5 Gender
graph bar, over( job_search ) over( sex ) ytitle("percent") asyvars percentages

//Career Change wise Skills
graph hbar (mean) skill_acq , over( career_change , sort( skill_acq ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Difficulty in Acquiring New Skills (1-5)) graphregion(margin(large))


//Stress by Gender
graph hbar (mean) stress_routine_act , over( sex , sort( stress_routine_act ) descending) blabel(total, size(medsmall) format(%9.2f)) ytitle(Average Stress Score(1-5)) graphregion(margin(large))



