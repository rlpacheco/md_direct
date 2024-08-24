capture program drop direct_md

program define direct_md 

args m_int sd_int n_int m_cont sd_cont n_cont


local mean_diff = `m_int' - `m_cont'

local mean_diff_sd = sqrt( (((`n_int'-1)*(`sd_int'^2))+((`n_cont'-1)*(`sd_cont'^2))) / (`n_int'+`n_cont'-2) )

local mean_diff_upper_ic = `mean_diff' + ( 1.95996 * `mean_diff_sd' * sqrt( (1/`n_int') + (1/`n_cont') ) )


local mean_diff_lower_ic = `mean_diff' - ( 1.95996 * `mean_diff_sd' * sqrt( (1/`n_int') + (1/`n_cont') ) )


local mean_diff_upper_ic = round(mean_diff_upper_ic, 0.01)
local mean_diff_lower_ic = round(mean_diff_lower_ic, 0.01)


display = "The mean difference is = `mean_diff'"
display = "The 95% CI is = `mean_diff_lower_ic' to `mean_diff_upper_ic'"


end
