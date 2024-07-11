%FigS6C.m
% Dynamic Table

function FigS6C(subj_figs,summary_data_path,nwb)
    clearvars -except subj_session_id summary_data_path subj_figs primary_experiments_table subj nwb output_path
    if contains(subj_figs,' S6C')
    
        %Vascular phase progression
        table = readtable(strcat(summary_data_path, '\IndividualFigures\FigS6\S6C\VesPhaseProgressionS6C.csv'));
    
        dist = table.dist;
        phase = table.phase;
        %Assign to dynamic table
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Distance (mm)', ...
            'data', dist);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Vessel Phase (rad)', ...
            'data', phase);
        table_S6C_Pts = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Distance (mm)', col1, ...
            'Vessel Phase (rad)', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        nwb.analysis.set('VascularPhaseProgressionS6C', table_S6C_Pts);
    
        %Neuronal phase progression
        table = readtable(strcat(summary_data_path, '\IndividualFigures\FigS6\S6C\NeuPhaseProgressionS6C.csv'));
    
        dist = table.dist;
        phase = table.phase;
        %Assign to dynamic table
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Distance (mm)', ...
            'data', dist);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Neuron Signal Phase (rad)', ...
            'data', phase);
        table_S6C_Neu_Pts = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Distance (mm)', col1, ...
            'Neuron Signal Phase (rad)', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        nwb.analysis.set('NeuronalPhaseProgressionS6C', table_S6C_Neu_Pts);
    end
end