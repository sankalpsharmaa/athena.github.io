/* load clean survey data */
use "$adata/survey.dta" , clear

/* prep data for analysis */

* recode family monthly income var
recode family_monthly_income (4=1) (1=2) (2=3) (3=4)
la def family_monthly_income 1 "Upto 25k" 2 "25k - 50k" 3 "50k - 100k" 4 "> 100k", replace
la val family_monthly_income family_monthly_income

/* generate GAD score */

foreach i in gad_* {

recode `i' (3=0) (4=1) (1=2) (2=3)

}

label define gad 0 "Not at all" 1 "Some days" 2 "More than half days" 3 "Nearly every day", replace
label values gad_* gad

egen gad_score = rowtotal(gad_*)
la var gad_score "GAD Score"

gen gad_cat = 1 if (gad_score >= 0 & gad_score < 5)
replace gad_cat = 2 if (gad_score >= 5 & gad_score < 10)
replace gad_cat = 3 if (gad_score >= 10 & gad_score < 15)
replace gad_cat = 4 if (gad_score >= 15 & gad_score < 21)

la def gad_cat 1 "Minimal Anxiety" 2 "Mild Anxiety" 3 "Moderate Anxiety" 4 "Severe Anxiety"
la val gad_cat gad_cat
la var gad_cat "GAD Category"

tab gad_cat, gen(gad_cat_)

foreach i in gad_cat_1 gad_cat_2 gad_cat_3 gad_cat_4 {

replace `i' = `i'*100

}

/* plots */

* prevalence of anxiety by family income
graph pie, over(gad_cat) pie(_all, explode) plabel(_all percent, size(small) format(%9.1f)) by(, title(Prevalence of Anxiety by Family Income) note("")) by(, legend(position(6))) legend(cols(4)) by(family_monthly_income)

* prevalence of anxiety by gender
graph pie, over(gad_cat) pie(_all, explode) plabel(_all percent, size(small) format(%9.2f)) by(, title(Prevalence of Anxiety by Gender) note("")) by(, legend(position(6))) legend(cols(4)) by(sex, cols(3))

* moderate and severe anxiety by income and residence
graph hbar (mean) gad_cat_3 (mean) gad_cat_4, over(family_monthly_income) over(residence) stack blabel(bar, position(inside) format(%9.2f) justification(left) alignment(middle)) legend(order(1 "Moderate Anxiety" 2 "Severe Anxiety") cols(2) position(6) ring(5))
