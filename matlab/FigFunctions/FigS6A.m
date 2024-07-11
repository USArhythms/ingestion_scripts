%FigS6A.m
% Dynamic Table

function FigS6A(subj_figs,summary_data_path,nwb)
    clearvars -except subj_session_id summary_data_path subj_figs primary_experiments_table subj nwb output_path
    if contains(subj_figs,' S6a')
    
        table = readtable(strcat(summary_data_path, '\IndividualFigures\FigS6\CaDSpectra.csv'));
    
        freq = table.f;
        CaNormS = table.CaNormS;
        CaNormSErrLow = table.CaNormSErrLow;
        CaNormSErrHigh = table.CaNormSErrHigh;
        DNormS = table.DNormS;
        DNormSErrLow = table.DNormSErrLow;
        DNormSErrHigh = table.DNormSErrHigh;
    
        %Assign to dynamic table: Pia
        col1 = types.hdmf_common.VectorData( ...
            'description', 'Frequency (Hz)', ...
            'data', freq);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'Average Normalized GCaMP Spectrum', ...
            'data', CaNormS);
        col3 = types.hdmf_common.VectorData( ...
            'description', 'Lower 95%CI Normalized GCaMP Spectrum', ...
            'data', CaNormSErrLow);
        col4 = types.hdmf_common.VectorData( ...
            'description', 'Upper 95%CI Normalized GCaMP Spectrum', ...
            'data', CaNormSErrHigh);
        col5 = types.hdmf_common.VectorData( ...
            'description', 'Average Normalized Diameter Spectrum', ...
            'data', DNormS);
        col6 = types.hdmf_common.VectorData( ...
            'description', 'Lower 95%CI Normalized Diameter Spectrum', ...
            'data', DNormSErrLow);
        col7 = types.hdmf_common.VectorData( ...
            'description', 'Upper 95%CI Normalized Diameter Spectrum', ...
            'data', DNormSErrHigh);
    
        table_S6A_Pts = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'Frequency (Hz)', col1, ...
            'Average Calcium Spectrum', col2, ...
            'Calcium Spectrum Lower 95%CI', col3, ...
            'Calcium Spectrum Upper 95%CI', col4, ...
            'Average Diameter Spectrum', col5, ...
            'Diameter Spectrum Lower 95%CI', col6, ...
            'Diameter Spectrum Upper 95%CI', col7, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        nwb.analysis.set('AverageGCaMPandDiamterSpectra FigureS6A', table_S6A_Pts);
    end
end