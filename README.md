# IllinoisCarp
Data and Code to accompany EAP22-0071

Schoolmaster Jr., DR, Coulter, AA, Kallis, JL, Glover, DC, Dettmers, JM and RA Erickson. Analysis of per capita contributions from a spatial model provides strategies for controlling spread of invasive carp. Ecosphere.

The data used for this work are publicly available at:

Coulter, A. A.; Brey, M. K.; Lubjeko, M.; Kalis, J. L.; Coulter, D. P.; Glover, D. C.; Whitledge, G. W.; and Garvey, J. E., "Movement Probabilities of Bigheaded Carps (Hypophthalmichthys spp.) in the Illinois River Estimated from Markov Chain Monte Carlo Methods" (2022). NRM Departmental Data Sets. 3. 
https://openprairie.sdstate.edu/nrm_datasets/3

## Author(s)

Donald R. Schoolmaster Jr.
U.S. Geological Survey, WARC
700 Cajundome Blvd, Lafayette LA 70506
schoolmasters@usgs.gov

Alison A. Coulter 
South Dakota State University, Department of Natural Resource Management
McFadden Biostress Laboratory 138, Box 2140B Brookings, SD 57007
Alison.Coulter@sdstate.edu


## File list


Sensitivity_Analyses_Schoolmaster_et_al.nb

Sensitivity_Analyses_Schoolmaster_et_al.pdf

MetaCarpFigure2_3_5_maker.R

MetaCarpFigure4_maker.R

MetaCarpFigure6_maker.R

### Data

psi_bhcp.csv

phi_sensi_Sur.csv

b_sensi_Sur.csv

phi_sensi_local_sur.csv

phi_sensi_local_sur_se.csv

phi_elast_local_sur.csv

phi_elast_local_sur_se.csv

b_sensi_local_sur.csv

b_sensi_local_sur_se.csv

b_elast_local_sur.csv

b_elast_local_sur_se.csv



## Description

Sensitivity_Analyses_Schoolmaster_et_al.nb – Annotated Mathematica code used to conduct the sensitivity and elasticity analyses.

Sensitivity_Analyses_Schoolmaster_et_al.pdf - Human readable version of the .nb file

MetaCarpFigure2_3_5_maker.R - Annotated R code used to produce Figures 2, 3 & 5

MetaCarpFigure4_maker.R - Annotated R code used to produce Figures 2, 3 & 5

MetaCarpFigure6_maker.R - Annotated R code used to produce Figures 2, 3 & 5

### Data
psi_bhcp.csv- Data for MCMC posterior distributions of average monthly transitions between pools. Columns are labeled as “ti_j” to indicate the transition from pool i to pool j.

\*_sensi_local_sur.csv - (where * may be either "phi" or "b") resampled sensitivites for phi on per captia growth rate of Dresden Island population.

\*_sensi_local_sur_se.csv - (where * may be either "phi" or "b") standard errrors of resampled sensitivites for phi on per captia growth rate of Dresden Island population.

\*_elast_local_sur.csv - (where * may be either "phi" or "b") resampled elasticites for phi on per captia growth rate of Dresden Island population.

\*_elast_local_sur_se.csv - (where * may be either "phi" or "b") standard errrors of resampled elasticities for phi on per captia growth rate of Dresden Island population.

This draft material is distributed solely for purposes of scientific peer review. Its content is deliberative and predecisional, so it must not be disclosed or released by reviewers. Because the manuscript has not yet been approved for publication by the U.S. Geological Survey (USGS), it does not represent any official USGS finding or policy.


