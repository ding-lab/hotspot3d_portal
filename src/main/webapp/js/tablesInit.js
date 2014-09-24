$(document).ready(function() {
    $('#tcga-list').footable();

    $('#singlecancer-list').dataTable( {
        "sDom": '<"top"fi>rt<"bottom"lp>',
        "fnRowCallback": function( nRow, aData ) {
            // Row click
            $(nRow).on('click', function() {
                document.location.href = "portal.jsp?rowkey=" + aData[0];
            });
        },
        "aoColumnDefs": [
            { "bVisible": false, "aTargets": [ 0 ] }
        ]
    } );

    $("#search-results").dataTable( {
        "sDom": '<"top"fi>rt<"bottom"lp>',
        "fnRowCallback": function( nRow, aData ) {
            // Row click
            $(nRow).on('click', function() {
                document.location.href = "portal.jsp?rowkey=" + aData[0];
            });
        },
        "aoColumnDefs": [
            { "bVisible": false, "aTargets": [ 0 ] }
        ]
    } );

} );