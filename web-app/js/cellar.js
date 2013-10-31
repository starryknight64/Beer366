$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    var beer = $("meta[name=beer]").attr("content");
    var chosenOptions = {search_contains: true};
    jQuery.support.cors = true;

    function breweryUpdated() {
        $.ajax({
            url:baseURL + '/beer/breweryBeers?breweryid=' + $("#brewery").val(),
            crossDomain:true,
            success: function(data) {
                if( data.length > 0 ) {
                    var beerOptions = "";
                    $.each(data, function(key, val) {
                        var selected = "";
                        if( val.id == beer ) {
                            selected = " selected";
                        }
                        beerOptions += "<option value='" + val.id + "'" + selected + ">" + val.name + "</option>\n";
                    });

                    $("select#beer").html(beerOptions);
                    $("select#beer").trigger("chosen:updated");
                }
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
    }

    $("select#brewery").change(function() {
        breweryUpdated();
    });

    breweryUpdated();

    $("select#brewery").chosen(chosenOptions);
    $("select#beer").chosen(chosenOptions);
    $("select#size").chosen(chosenOptions);
});
