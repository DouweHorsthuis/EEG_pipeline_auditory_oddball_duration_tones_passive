clear variables 
eeglab

% This defines the set of subjects
subject_list = {'all_ids' 'next_to_eachother'};
nsubj = length(subject_list); % number of subjects
% Path to the parent folder, which contains the data folders for all subjects
home_path  = 'filepath_to_the_data\';
eventlist_filepath = 'where_is_the_filepath_stored\';
% Loop through all subjects
for s=1:nsubj
    fprintf('\n******\nProcessing subject %s\n******\n\n', subject_list{s});

    % Path to the folder containing the current subject's data
    data_path  = [home_path subject_list{s} '/'];

        % Load original dataset
    fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n', subject_list{s});
    EEG = pop_loadset('filename', [subject_list{s} '_ref_TP8.set'], 'filepath', data_path);
    EEG = eeg_checkset( EEG );
    EEG  = pop_editeventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99}, 'BoundaryString', { 'boundary' }, 'List', [eventlist_filepath 'eventlist_normal_triggers.txt'], 'SendEL2', 'EEG', 'UpdateEEG', 'on', 'Warning', 'off' );
    EEG = eeg_checkset( EEG );
    EEG = pop_epochbin( EEG , [-50  400],  [-50 0]);
    EEG = eeg_checkset( EEG );
    EEG = pop_saveset( EEG, 'filename',[subject_list{s} '_epoched.set'],'filepath', data_path);
    EEG = pop_artmwppth( EEG , 'Channel',  1:63, 'Flag',  1, 'Threshold',  120, 'Twindow', [ -50.8 394.5], 'Windowsize',  200, 'Windowstep',  200 );
    ERP = pop_averager( EEG , 'Criterion', 1, 'DSindex',1, 'ExcludeBoundary', 'on', 'SEM', 'on' );
    ERP = pop_savemyerp(ERP, 'erpname', [subject_list{s} '_tp8.erp'], 'filename', [subject_list{s} '_tp8.erp'], 'filepath', data_path);
end;

