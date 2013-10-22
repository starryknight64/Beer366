$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    var defaultRegion = $("meta[name=defaultRegion]").attr("content");
    jQuery.support.cors = true;

    function countryUpdated() {
        $.ajax({
            url:baseURL + '/ISO_3166_2/regions?countryid=' + $("#country").val(),
            crossDomain:true,
            success: function(data) {
                if( data.length > 0 ) {
                    var regions = "<option value='null'></option>\n";
                    $.each(data, function(key, val) {
                        var selected = ""
                        if( val.id == defaultRegion ) {
                            selected = " selected"
                        }
                        regions += "<option value='" + val.id + "'" + selected + ">" + val.name + "</option>\n";
                    });
                    $("select#region").html(regions);
                    $("label[for=region]").parent().show();
                    $("select#region").chosen();
                } else {
                    $("label[for=region]").parent().hide();
                }
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
    }

    $("#country").change(function() {
        countryUpdated();
    });

    countryUpdated();

    $("select#country").chosen();
});
