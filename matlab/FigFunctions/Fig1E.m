%Fig1E.m
% Dynamic Table

function Fig1E(subj_figs,summary_data_path,nwb)
    if contains(subj_figs,' 1e')
    
        traces_tbl = readtable(strcat(summary_data_path, '\IndividualFigures\Fig1\E\DiameterModExample_Traces_1E.csv'));
        edges_tbl = readtable(strcat(summary_data_path, '\IndividualFigures\Fig1\E\DiameterModExample_Edges_1E.csv'));
    
        phase_trace = traces_tbl.phase_trace;
        diam_trace = traces_tbl.diam_trace;
        phase_edges = edges_tbl.phase_edge;
        diam_edges = edges_tbl.diam_edge;

        %Assign to dynamic table: Pia
        col1 = types.hdmf_common.VectorData( ...
            'description', 'phase trace (rad)', ...
            'data', phase_trace);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'diam trace (um)', ...
            'data', diam_trace);
        table_1E_Traces = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'phase trace', col1, ...
            'diam trace', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        table_1E_Traces;
        nwb.analysis.set('Diameter Modulation Joint Distribution 1E Traces', table_1E_Traces);

        %Assign to dynamic table
        col1 = types.hdmf_common.VectorData( ...
            'description', 'phase bin edges (rad)', ...
            'data', phase_edges);
        col1_len = length(col1.data);
        col2 = types.hdmf_common.VectorData( ...
            'description', 'diam bin edges (um)', ...
            'data', diam_edges);
        table_1E_BinEdges = types.hdmf_common.DynamicTable( ...
            'description', 'analysis table', ...
            'phase bin edges', col1, ...
            'diam bin edges', col2, ...
            'id', types.hdmf_common.ElementIdentifiers('data', linspace(1,col1_len,col1_len)) ...
            );
        table_1E_BinEdges;
        nwb.analysis.set('DiameterModulationJointDistributionEdges1E', table_1E_BinEdges);
    end
end