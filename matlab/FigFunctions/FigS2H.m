%FigS2H.m
% Dynamic Table

function FigS2H(subj_figs,summary_data_path,nwb)
    clearvars -except subj_session_id summary_data_path subj_figs primary_experiments_table subj nwb output_path
    if contains(subj_figs,' S2h')
    
        % openfig(strcat(summary_data_path,''))
        openfig("C:\Users\duckw\Dropbox\Thomas_SpaceTime_DropBox\ 1-D Pial Oscilations MS\Xiang\Heart_rate_frequency\DKLab_TBRLBB_r_rms_modulation_in_5_to_12_Hz_r_data.fig");
        h = findobj(gca,'Type','scatter');
        x=2.*get(h(1),'Xdata');
        y=get(h(1),'Ydata');
    
        col1 = types.hdmf_common.VectorData( ...
            'description', 'PA Average diameter (um)', ...
            'data', x);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'PA Norm RMS diameter change', ...
            'data', y);
        table_S2H_RMSd_PA = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'PA Average diameter (um)', col1, ...
            'PA Norm RMS diameter change', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
    
        nwb.analysis.set('PAHeartRateRMSDiameterChangeS2H', table_S2H_RMSd_PA);
    
        clearvars x y
        h = findobj(gca,'Type','scatter');
        x=2.*get(h(2),'Xdata');
        y=get(h(2),'Ydata');
    
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Pia Average diameter (um)', ...
            'data', x);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Pia Norm RMS diameter change', ...
            'data', y);
        table_S2H_RMSd_Pia = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Pia Average diameter (um)', col1, ...
            'Pia Norm RMS diameter change', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
    
        nwb.analysis.set('PiaHeartRateRMSDiameterChangeS2H', table_S2H_RMSd_Pia);
        close all;
    end
end