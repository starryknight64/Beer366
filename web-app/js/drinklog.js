$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");

    function breweryUpdated() {
        $.ajax({
            url:baseURL + '/beer/breweryBeers?breweryid=' + $("#brewery").val(),
            crossDomain:true,
            success: function(data) {
                if( data.length > 0 ) {
                    var beerOptions = "";
                    $.each(data, function(key, val) {
                        beerOptions += "<option value='" + val.id + "'>" + val.name + "</option>\n";
                    });

                    $("select#beer").chosen("destroy");
                    $("select#beer").html(beerOptions);
                    $("select#beer").chosen();
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

    $("select#brewery").chosen();
    $("select#beer").chosen();
});
