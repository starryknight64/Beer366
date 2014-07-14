$(document).ready(function() {
    var baseURL = $("meta[name=serverURL]").attr("content");
    var beer = $("meta[name=beer]").attr("content");
    var cellarID = $("input#cellarID").val();
    var dfltServingSizeID = $("meta[name=defaultServingSize]").attr("content");
    var chosenOptions = {
        search_contains: true
    };
    var ratingDescriptions = ["An awful beer","A bad beer","A drinkable beer","An average beer","A good beer","An amazing beer"];
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
        var desc = "Please rate between 0 and 5";
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
        $("textarea#notes").val("");
    }

    $("select#cellarBeer").change(function() {
    	//Get cellar ID
        cellarID = $("select#cellarBeer").val();
        $("input#cellarID").val(cellarID);
        $("input#cellarBeerChosen").val("true");
        
        //Get serving size ID
        var servingSizeID = $("select#cellarBeer option[value="+cellarID+"]").attr("servingSizeID")
        $("select#servingSize").val(servingSizeID);
        $("select#servingSize").trigger("chosen:updated");
        
        //Get notes
        $.ajax({
            url:baseURL + '/cellar/get?id=' + cellarID,
            crossDomain:true,
            success: function(data) {
            	var notes = "";
                if( data.notes != null ) {
                	notes = data.notes;
                }
                $("textarea#notes").val(notes);
            },
            error: function(x,s,e){
                console.log(s+e);
            }
        });
        
        //Get brewery ID
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
    $("select#servingSize").chosen(chosenOptions);
});
