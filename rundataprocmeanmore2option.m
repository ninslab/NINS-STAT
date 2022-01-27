% NINS-STAT Graphical User Interface
% start.m function starts the entire
% interface.
%
% Final revision date : 11th August 2021

% Author:
% Dr. Pravat K. Mandal
% Neuroimaging and Neurospectroscopy Lab,
% National Brain Research Centre,
% Manesar, India

function rundataprocmeanmore2option(hObject, eventdata, h)

samplerelation_value = get(h.sample_popup, 'Value');

switch(samplerelation_value)
    
    case 1
        % If the samples are related (Yes)
        rundataprocmeanmore2_related(hObject, eventdata, h);
    case 2
        % If the samples are not related (No)
        rundataprocmeanmore2(hObject, eventdata, h);
        % rundataprocmeanmore2_related(hObject, eventdata, h); % just for testing, remove this it is a repetition of the above case
    otherwise
        % Do Nothing
end

end