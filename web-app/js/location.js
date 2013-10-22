google.load('visualization', '1', {
    'packages': ['geochart']
});

$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    jQuery.support.cors = true;

    function getJSON( cmd ) {
        var result = null;
        $.ajax({
            url: baseURL + cmd,
            crossDomain: true,
            async: false,
            success: function(data) {
                result = data;
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
        return result;
    }

    function drawRegionsMap() {
        var table = [['Place', 'Breweries']];
        var cmd = '/brewery/locationCount';
        if( paramsContinent ) {
            cmd += "?continent=" + paramsContinent
        } else if( paramsSubContinent ) {
            cmd += "?subcontinent=" + paramsSubContinent
        } else if( paramsCountry ) {
            cmd += "?country=" + paramsCountry
        } else if( paramsState ) {
            cmd += "?state=" + paramsState
        }
        var breweryCount = getJSON(cmd);
        console.log( JSON.stringify(breweryCount))
        table = table.concat(breweryCount.places);

        var data = google.visualization.arrayToDataTable(table);

        var options = {
            region: paramsRegion,
            resolution: paramsResolution,
            colorAxis: {
                maxValue: 30,
                colors: ['#B1E3AF', '#179E10']
            },
            magnifyingGlass: {
                enable: true
            },
            legend: 'none'
        };
        if( breweryCount.displayMode != null ) {
            options.displayMode = breweryCount.displayMode;
            options.sizeAxis = {minSize: 5};
            options.enableRegionInteractivity = true;
        }

        var chart = new google.visualization.GeoChart(document.getElementById('chart_div'));
        chart.draw(data, options);

        var handleClick = function() {
            // Mapping of data entries to urls
            var url_map = breweryCount.urls;

            item = chart.getSelection();
            window.location.href = url_map[ item[0].row ];
        }

        google.visualization.events.addListener( chart, 'select', handleClick );
    }

    drawRegionsMap();
});
