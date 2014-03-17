$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    var subStyleID = $("meta[name=defaultSubStyle]").attr("content");
    var baPageURL = $("meta[name=baPageURL]").attr("content");
    var chosenOptions = {search_contains: true};
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
    	var familyVal = $("#family").val();
        $.ajax({
            url:baseURL + '/beerStyle/familySubStyles?familyid=' + familyVal,
            crossDomain:true,
            success: function(data) {
            	var json = data;
                if( data.styles != null ) {
                	json = data.styles;
                }
                var styleOptions = "";
                $.each(json, function(key, val) {
                    styleOptions += "<optgroup label='" + val.name + "'>\n";
                    var styles = val.subStyles;//getSubStyles( val.id )
                    $.each(styles, function(key, val) {
                        var selected = "";
                        if( val.id == subStyleID ) {
                            selected = " selected";
                        }
                        styleOptions += "<option value='" + val.id + "'" + selected + ">" + val.name + "</option>\n";
                    });
                    styleOptions += "</optgroup>\n";
                });

                $("select#subStyle").html(styleOptions);
                $("select#subStyle").trigger("chosen:updated");
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

    $("select#brewery").chosen(chosenOptions);
    $("select#subStyle").chosen(chosenOptions);
    $("input#baPage").val(baPageURL);
});
