clear variables 
eeglab
%%for this script you need to add chane the location of Line 21 to wherever you store your EEGlab
% This defines the set of subjects
subject_list = {'all_ids' 'next_to_eachother'};
nsubj = length(subject_list); % number of subjects
% Path to the parent folder, which contains the data folders for all subjects
home_path  = 'filepath_to_the_data\';

% Loop through all subjects
for s=1:nsubj
    fprintf('\n******\nProcessing subject %s\n******\n\n', subject_list{s});

    % Path to the folder containing the current subject's data
    data_path  = [home_path subject_list{s} '/'];

        % Load original dataset
    fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n', subject_list{s})
    
    EEG = pop_loadset('filename', [subject_list{s} '_downft.set'], 'filepath', data_path);
    EEG=pop_chanedit(EEG, 'lookup','C:\Users\aalvesf\Documents\MATLAB\eeglab13_6_5b\plugins\dipfit2.3\standard_BESA\standard-10-5-cap385.elp');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = pop_select( EEG,'nochannel',{'EXG1' 'EXG2' 'EXG3' 'EXG4' 'EXG5' 'EXG6' 'EXG7' 'EXG8'});
    EEG = pop_saveset( EEG, 'filename',[subject_list{s} '_exext.set'],'filepath', data_path);
    
    end;
