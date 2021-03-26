clear variables 
eeglab
% This defines the set of subjects
subject_list = {'all_ids' 'next_to_eachother'};
nsubj = length(subject_list); % number of subjects

% Path to the parent folder, which contains the data folders for all subjects
home_path  = 'filepath_to_the_data\';

% Loop through all subjects
for s=1:nsubj
    fprintf('\n******\nProcessing subject %s\n******\n\n', subject_list{s});

    % Path to the folder containing the current subject's data
    data_path  = [home_path subject_list{s} '\\'];

        % Load original dataset
    fprintf('\n\n\n**** %s: Loading dataset ****\n\n\n', subject_list{s});
    EEG = pop_loaderp('filename', [subject_list{s} '_tp8.erp'], 'filepath', data_path);
    EEG = eeg_checkset( EEG );
    ERP = pop_binoperator( ERP, {  'bin7=(b2-b1) label diff 450',  'bin8=(b4-b3) label diff 900', 'bin9=(b6-b5) label diff 1800'});
    ERP = pop_savemyerp(ERP, 'erpname', [subject_list{s} '_tp8_b.erp'], 'filename', [subject_list{s} '_tp8_b.erp'], 'filepath', data_path);
    end;