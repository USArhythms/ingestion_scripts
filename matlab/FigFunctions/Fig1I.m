%Fig1I.m
% Dynamic Table

function Fig1I(subj_figs,summary_data_path,nwb)
    clearvars -except subj_session_id summary_data_path subj_figs primary_experiments_table subj nwb output_path
    if contains(subj_figs,' 1i')
        
        %Scatter plot, R2 vs diameter modulation

        table = readtable(strcat(summary_data_path, '\IndividualFigures\Fig1\I\FluxModulation.csv'));

        is_pia = logical(table.is_pia);
        a_c = table.a2c;
        a_c_fit_R2 = table.a2c_fit_R2;
        avg_diam = table.avg_diameter_um;

        piaA_c = a_c(is_pia);
        PAA_c = a_c(~is_pia);
        piaA_c_R2 = a_c_fit_R2(is_pia);
        PAA_c_R2 = a_c_fit_R2(~is_pia);
        piaA_c_Diam = avg_diam(is_pia);
        PAA_c_Diam = avg_diam(~is_pia);

        %Assign to dynamic table: Pia
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Pia Flux Modulation Depth', ...
            'data', piaA_c);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Pia Flux Fit R2', ...
            'data', piaA_c_R2);
        col3 = types.hdmf_common.VectorData( ...
            'description', 'Pia Average Diameter (um)', ...
            'data', piaA_c_Diam);
        table_1I_Pia = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Pia Flux Modulation Depth', col1, ...
            'Pia Flux Fit R2', col2, ...
            'Pia Average Diameter',col3,...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        table_1I_Pia;

        nwb.analysis.set('PiaFluxModulation1I', table_1I_Pia);

        %Assign to dynamic table: PA
        col1 = types.hdmf_common.VectorData( ...
            'description', 'PA Flux Modulation Depth', ...
            'data', PAA_c);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'PA Flux Fit R2', ...
            'data', PAA_c_R2);
        col3 = types.hdmf_common.VectorData( ...
            'description', 'PA Average Diameter (um)', ...
            'data', PAA_c_Diam);
        table_1I_PA = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'PA Modulation Depth', col1, ...
            'PA Fit R2', col2, ...
            'PA Average Diameter',col3,...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        table_1I_PA;

        nwb.analysis.set('PAFluxModulation1I', table_1I_PA);
    end
end