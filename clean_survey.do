global path "\\Sankalpsharma\MSE\Research\athena"
global data "$path/survey/data"

import excel "$data/raw/responses.xlsx", sheet("Form Responses 1") firstrow clear

ren *, lower
ren timestamp time

encode byselectingthisboxiconsent, gen(consent)
encode socialgroup, gen(social_group)
encode gender, gen(sex)
encode year, gen(batch)
encode college, gen(institution)
encode howwouldyoubestdescribeyour, gen(residence)
encode didanymemberofyourfamilyfa, gen(family_econ_loss)
encode whatisyourhouseholdsmonthly, gen(family_monthly_income)
encode haveyoutakenaloantofundyo, gen(ed_loan)
encode didyouoryourimmediatefamily, gen(family_covid)
encode ifyesdidyouoryourfamilym, gen(family_covid_hosp)
encode didyouscorelowerthanexpecte, gen(ed_score_expected)
encode byhowmanyhoursonaverageha, gen(screen_time)
encode didyoufindformingstudyorsu, gen(study_groups)
encode doyoufeelthatyouarefacing, gen(job_search)
encode didyouchangeyourcareerchoic, gen(career_change)

encode feelingnervousanxiousorone , gen(gad_1)
encode notbeingabletostoporcontro , gen(gad_2)
encode worryingtoomuchaboutdifferen , gen(gad_3)
encode troublerelaxing , gen(gad_4)
encode beingsorestlessthatitishar , gen(gad_5)
encode becomingeasilyannoyedorirrit , gen(gad_6)
encode feelingafraidasifsomethinga , gen(gad_7)

ren howwouldyourateyourexperien online_learning
ren onascaleof15howwouldyou internet_speed
ren onascaleof15howeasydiff skill_acq
ren onascaleof15howstressed stress_routine_act

drop byselectingthisboxiconsent college year gender socialgroup howwouldyoubestdescribeyour feelingnervousanxiousorone notbeingabletostoporcontro worryingtoomuchaboutdifferen troublerelaxing beingsorestlessthatitishar becomingeasilyannoyedorirrit feelingafraidasifsomethinga didanymemberofyourfamilyfa ifotherspleasespecify whatisyourhouseholdsmonthly haveyoutakenaloantofundyo didyouoryourimmediatefamily ifyesdidyouoryourfamilym didyouscorelowerthanexpecte byhowmanyhoursonaverageha didyoufindformingstudyorsu doyoufeelthatyouarefacing didyouchangeyourcareerchoic

order time sex institution batch social_group residence

save "$data/survey.dta", replace