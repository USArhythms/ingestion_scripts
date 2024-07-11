%FigS3A.m
% Dynamic Table

function FigS3A(subj_figs,summary_data_path,nwb)
    if contains(subj_figs,' S3a')
        
        traces_tbl = readtable(strcat(summary_data_path,'\IndividualFigures\FigS3\A\DiameterModExample_Traces_S3A.csv'));
        edges_tbl = readtable(strcat(summary_data_path,'\IndividualFigures\FigS3\A\DiameterModExample_Edges_S3A.csv'));    
        
        phase_trace = traces_tbl.phase_trace;
        diam_trace = traces_tbl.diam_trace;
        phase_edges = edges_tbl.phase_edge;
        diam_edges = edges_tbl.diam_edge;
        %     figure; histogram2(phase_trace,diam_trace,phase_edges,diam_edges,'DisplayStyle','tile');
    
        %Assign to dynamic table: Pia
        col1 = types.hdmf_common.VectorData( ...
            'description', 'phase trace (rad)', ...
            'data', phase_trace);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'diam trace (um)', ...
            'data', diam_trace);
        table_S3A_Traces = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'phase trace', col1, ...
            'diam trace', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        nwb.analysis.set('DiameterModulationJointDistributionTracesS3A', table_S3A_Traces);
    
        %Assign to dynamic table
        col1 = types.hdmf_common.VectorData( ...
            'description', 'phase bin edges (rad)', ...
            'data', phase_edges);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'diam bin edges (um)', ...
            'data', diam_edges);
        table_S3A_BinEdges = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'phase bin edges', col1, ...
            'diam bin edges', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        nwb.analysis.set('DiameterModulationJointDistributionEdgesS3A', table_S3A_BinEdges);
    end
end