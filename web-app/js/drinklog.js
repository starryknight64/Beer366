$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    var beer = $("meta[name=beer]").attr("content");
    var cellarID = $("input#cellarID").val();
    var chosenOptions = {
        search_contains: true
    };
    var ratingDescriptions = ["Revolting","Yuck!","Meh...","Average","Great","Excellent"];
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

    function ratingUpdated() {
        var rating = parseInt($("input#rating").val());
        var desc = "";
        if( rating != NaN ) {
            if( rating >= 0 && rating <= 5 ) {
                desc = ratingDescriptions[rating];
            }
        }
        $("span.rating-help").html(desc);
    }

    function breweryChanged() {
        beerChanged();
        breweryUpdated();
    }

    function beerChanged() {
        $("input#cellarID").val("");
        cellarID = "";
        beer = "";
        $("input#cellarBeerChosen").val("false");
        $("select#cellarBeer").val(null);
        $("select#cellarBeer").trigger("chosen:updated");
    }

    $("select#cellarBeer").change(function() {
        cellarID = $("select#cellarBeer").val();
        $("input#cellarID").val(cellarID);
        $("input#cellarBeerChosen").val("true");
        var breweryID = $("select#cellarBeer option:selected").attr("breweryid");
        beer = $("select#cellarBeer option:selected").attr("beerid");
        $("select#brewery").val(breweryID);
        $("select#brewery").trigger("chosen:updated");
        breweryUpdated();
    });

    $("select#brewery").change(breweryChanged);
    $("select#beer").change(beerChanged);

    $("input#rating").change(ratingUpdated);
    $("input#rating").keyup(ratingUpdated);

    if( beer == "" ) {
        breweryUpdated();
    }

    if( cellarID != "" ) {
        $("select#cellarBeer option[value=" + cellarID + "]").attr("selected","");
    }
    $("select#cellarBeer").chosen(chosenOptions);
    $("select#brewery").chosen(chosenOptions);
    $("select#beer").chosen(chosenOptions);
    $("select#size").chosen(chosenOptions);
});
