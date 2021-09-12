use "C:\Users\amanv\Documents\econometrics_lab_project_data.dta"
regress poverty_rate_2011 birthrate2010 mpceforurban mpceforrural201112 inflation_rate_201112 ruralunemployment200910
vif
fgtest poverty_rate_2011 birthrate2010 mpceforurban mpceforrural201112 inflation_rate_201112 ruralunemployment200910
gen avg_mpce = (mpceforurban + mpceforrural201112)/2
regress poverty_rate_2011 birthrate2010 avg_mpce inflation_rate_201112 ruralunemployment200910
vif
fgtest poverty_rate_2011 birthrate2010 avg_mpce inflation_rate_201112 ruralunemployment200910
predict resid, r
jb6 resid
test birthrate2010 = ruralunemployment200910
test inflation_rate_201112 = avg_mpce
estat hettest
estat hettest birthrate2010 avg_mpce inflation_rate_201112 ruralunemployment200910
estat imtest, white
regress poverty_rate_2011 birthrate2010 avg_mpce inflation_rate_201112 ruralunemployment200910
