%Fig2D.m
% Dynamic Table

function Fig2D(subj_figs,summary_data_path,nwb)
    clearvars -except subj_session_id summary_data_path subj_figs primary_experiments_table subj nwb output_path S1 S2 S f phi phistd
    if contains(subj_figs,' 2d')
        %Spectra->Dynamic table
    
        table = readtable(strcat(summary_data_path, '\IndividualFigures\Fig2\D\Fig2DSpectraData.csv'));
    
        ShallowS = table.ShallowS;
        DeepS = table.DeepS;
        ShallowPVS = table.ShallowPVS;
        PAphase = table.PAPhase;
        PAphase2STD = table.PAPhase2SD;
        f = table.f;
    
        %Create dynamic table
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Shallow PA Power (AU)', ...
            'data', ShallowS);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Deep PA Power (AU)', ...
            'data', DeepS);
        col3 = types.hdmf_common.VectorData( ...
            'description', 'Shallow PV Power (AU)', ...
            'data',ShallowPVS);
        col4 = types.hdmf_common.VectorData( ...
            'description', 'PA Phase (rad)', ...
            'data',PAphase);
        col5 = types.hdmf_common.VectorData( ...
            'description', 'PA Phase 2std (rad)', ...
            'data',PAphase2STD);
        col6 = types.hdmf_common.VectorData( ...
            'description', 'Frequency (Hz)', ...
            'data', f);
    
        table_2D = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Shallow PA Power', col1, ...
            'Deep PA Power', col2, ...
            'Shallow PV Power',col3,...
            'PA Phase',col4,...
            'PA Phase 2std',col5,...
            'Frequency',col6,...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        table_2D;
    
        nwb.analysis.set('PAPVSpectra2D', table_2D);
    end
end