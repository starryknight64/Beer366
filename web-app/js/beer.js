$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    jQuery.support.cors = true;

    function getSubStyles( styleID ) {
        var subStyles = []
        $.ajax({
            url:baseURL + '/beerSubStyle/subStyles?styleid=' + styleID,
            crossDomain:true,
            async:false,
            success: function(data) {
                subStyles = data;
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
        return subStyles;
    }

    function familyUpdated() {
        $.ajax({
            url:baseURL + '/beerStyle/familyStyles?familyid=' + $("#family").val(),
            crossDomain:true,
            success: function(data) {
                if( data.length > 0 ) {
                    var styleOptions = "";
                    $.each(data, function(key, val) {
                        styleOptions += "<optgroup label='" + val.name + "'>\n";
                        var styles = getSubStyles( val.id )
                        $.each(styles, function(key, val) {
                            styleOptions += "<option value='" + val.id + "'>" + val.name + "</option>\n";
                        });
                        styleOptions += "</optgroup>\n";
                    });

                    $("select#subStyle").chosen("destroy");
                    $("select#subStyle").html(styleOptions);
                    $("select#subStyle").chosen();
                }
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
    }

    $("select#family").change(function() {
        familyUpdated();
    });

    familyUpdated();

    $("select#brewery").chosen();
    $("select#subStyle").chosen();
});
