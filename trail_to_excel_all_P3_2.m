%Created on 8/27/2018 By Douwe For Ana
%Script will take a matlab table created in trial_to_excel_all script and
%put the data in excel

%% Table
clear variables 
load('whereven_the_data_is_stored\ammnstd-nt');
load('whereven_the_data_is_stored\mmnstd-cys');

data_subj = [data_TD; data_CYS] %

Group      = (data_subj(:,1));
Subject    = (data_subj(:,2));
Trial      = (data_subj(:,4));
Condition  = (data_subj(:,3));
Erp        = (data_subj(:,5));

%G = findgroups(Group,Condition,Trial);
T = table(Subject, Group, Condition, Trial, Erp);
%saving as Excel
filename = 'ERPdata_MMNstdnew.xlsx'
writetable(T, filename, 'Sheet',1, 'Range','A1') 