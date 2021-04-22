# EEG_pipeline_auditory_oddball_duration_tones_passive
Raw EEG (biosemi) to ERP and trial-by-trial data for our auditory oddball duration tone paradigm
This pipeline was created in 2019 by Douwe Horsthuis and Ana Francisco for their oddball papers. There is a more updated version that can be used for all types of paradigms in https://github.com/DouweHorsthuis/EEG-Raw-to-ERP

Francisco, A. A., Berruti, A. S., Kaskel, F. J., Foxe, J. J., & Molholm, S. (2021). Assessing the integrity of auditory processing and sensory memory in adults with cystinosis (CTNS gene mutations). The Orphanet Journal of Rare Diseases.

Francisco, A. A., Foxe, J. J., Horsthuis, D. J., & Molholm, S. (2020). Impaired auditory sensory memory in Cystinosis despite typical sensory processing: A high-density electrical mapping study of the mismatch negativity (MMN). NeuroImage: Clinical, 25, 102170.

Francisco, A. A., Foxe, J. J., Horsthuis, D. J., DeMaio, D., & Molholm, S. (2020). Assessing auditory processing endophenotypes associated with Schizophrenia in individuals with 22q11. 2 deletion syndrome. Translational Psychiatry, 10(1), 1-11.

This pipeline relies heavily on EEGlab and ERPlab. These plugins need to be installed to run these scripts.

This pipeline has 9 scripts that preprocess the data and 4 scripts to transfer the data to excel (so it can be loaded in R). 

Description of the different scripts:

A_merge_sets - References the Raw EEG (Biosemi) data to the mastoid external, creates individual .set file and merges all the files together into one big .set file for each participant.

B_downs_filt - data gets down sampled from 512hz to 256hz, we do a 1hz low pass and 45hz high pass filter

C_channelInfo_excludeexterm -adding channel information and deletes externals (all data is collected with multiple external channels that we do no use in this analysis).

D_exclud_channels - uses the pop_rejchan function to auto delete channels using a kurtosis threshold. (We use all the standard settings)

At this point, we manually open/plot each data in EEGlab to see if there are channels that are missed and need to be deleted, if so we manually delete them.

E_ref - We do a average reference

F_ica - using the pop_runica function we do an inter component analysis. 

At this point we manually open all the components of the participant and delete the eye-data components and components that are very bad. We lean very conservative, making sure not to delete any brain components by mistake

G_refTP8 - we re-reference all the data to TP8

H_epoching - we edit the events using the "eventlist_normal_triggers"* or "eventlist_abnormal_triggers"* files. We set the time for the epoch and a baseline. we save the file as .set and .erp

I_add_bins - we add bins that create a difference wave (MMN), saving it as a .erp file

At this point all the pre-processing is done. 

trail_to_excel_all_N1_1 - the means amplitude for the N1 time window, for 1 channel, for each participant
trail_to_excel_all_N1_2 - takes this data, and saves it in an excel file
trail_to_excel_all_P3_1 - the means amplitude for the  P3 time window, for 1 channel, for each participant
trail_to_excel_all_P3_2 - takes this data, and saves it in an excel file

*we have 2 eventlists in H_epoching, because due to an problem with data collection some of the triggers were wrong, not in time, but only in what number showed up.
