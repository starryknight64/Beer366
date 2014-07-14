<%@ page import="beer366.BeerSubStyle" %>
<!doctype html>
<html>

  <head>
    <title><g:meta name="app.name"/> - About</title>
    <meta name="layout" content="kickstart" />
  </head>

  <body>
    <h1>About</h1>
    <p>
        The idea of Beer366 started on December 30th, 2011 as a New Years resolution for 2012.
        It was a personal challenge to attempt to sample one unique beer for every day of the upcoming year.
    </p>
    <p>
        Many beer drinkers out there, myself included, fall into a rut.
        We have our favorite local microbrews or even macrobrews, and use those as a safe bet when selecting a beer at the store.
        In order to achieve three hundred and sixty-six unique beers, it quickly became necessary to expand my own horizons and try many of the beers I’d previously been content to ignore.
        I was forced to take in and learn to appreciate the truly incredible variety of beer available.
        To that end, the web site encourages beer drinkers to try as many different beers as possible, encompassing as many different styles as possible, and originating from as many places around the world as possible.
    </p>
    <p>
	    I firmly believe that every beer, from the lowliest mass-produced can to the hardest to find hand-crafted bomber, is worth sampling and understanding.
	    The goal of this site is for its members to learn to understand beer for what it truly is: a highly varied and oftentimes very complicated beverage that has been part of the human experience for over ten thousand years.
    </p>
    <p>
	    So, don’t just content yourself with an easy-to-drink <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('American Adjunct Lager')?.id}">American Adjunct Lager</g:link>, or even the <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('American Pale Ale')?.id}">American Pale Ale</g:link> produced by a brewpub near you.
	    Instead, expand your horizons.
	    Drink a <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('Rauchbier')?.id}">Rauchbier</g:link> or even a <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('Flanders Red Ale')?.id}">Flanders Red Ale</g:link>.
	    If you find that you do not care for those styles, that’s the risk you take.
	    But, having just one beer of a style is hardly sufficient for passing summary judgement: try another and even another!
	    Expand your comfort zone, knowing that for every beer you have that you don’t enjoy, there will be one that you do.
	    You might even be rewarded with the discovery of styles and breweries that are new to you, but quickly rise to be ranked among your favorites.
    </p>
    <p>
        Happy Drinking!
    </p>
    <p>
        Carl Thompson,<br>
        Founder
    </p>
    <br>
    <h1>Ratings, Rankings, and Notes</h1>
    <p>
        Beer366 was never meant to be a beer-review website.
        There are plenty of other sites out there that already serve this function, so there seemed to be no reason to duplicate that.
        Besides, how many different ways can you state that an <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('American IPA')?.id}">American IPA</g:link>'s hops had piney or citrusy notes, or that you picked up plenty of coffee and roast chocolate in the <g:link controller="beerSubStyle" action="show" id="${BeerSubStyle.findByName('Imperial Stout')?.id}">Imperial Stout</g:link> you just had? Rather, we have adopted the philosophy that those who are really making an effort to sample all varieties of beer already understand and know the basic characteristics of most styles. That’s not what we’re interested in. Beer366 is a beer-logging website: show us that you’ve had a beer, that’s all that matters. Knowledge of beer comes through experiencing beer, not from reading someone else’s muddled opinions of its color, bouquet, mouthfeel, or taste.
        Try a beer and form your own opinions.</p>
    <p>
		That’s not to say that detailed reviews of a beer aren’t appreciated, they’re just primarily believed to be unnecessary.
		Instead, what makes for an interesting note with your beer is anything that caught you off guard.
		Sure it was a Stout, but did you perhaps pick up on a bit of cherry in the flavor? Maybe some oak aging really came through and set this beer apart from the countless other stouts available to you.
		These are the sorts of tidbits of information that we find valuable.
    </p>
    <p>
        To that end, Beer366’s ranking system was meant to be as simple as possible.
		Originally, it was an integer ranking system, with values ranging from 0 to 5.
        I have always applied these personal criteria to what each number means:
	    <ol start="0">
	        <li><strong>An awful beer.</strong> Usually this means that I was unable or unwilling to finish it.</li>
	        <li><strong>A bad beer.</strong> I may have managed to choke it down, but I don’t ever want to have it again.</li>
	        <li><strong>A drinkable beer.</strong> I’d drink it again if it were put in front of me, but I’d probably not buy it.</li>
	        <li><strong>An average beer.</strong> There’s no shame in this ranking. Most of what you sample will be average, just by the very definition of the word.</li>
	        <li><strong>A good beer.</strong> These are the beers that have done something that has set them apart. I’d buy and drink these again.</li>
	        <li><strong>An amazing beer.</strong> There’s something really special about this beer. I’d go out of my way to buy and drink it again.</li>
	    </ol>
        Along the way, we started allowing decimal numbers between 0 and 5 for individual rankings.
        I’ll leave the exact interpretation of those intermediate values up to you, but I do believe that they provide useful granularity when looking at the complete spectrum of beers I’ve sampled.
    </p>
    <p>
        Finally, note that your rankings of beers will always be influenced by your own personal preference, and there’s no reason why it shouldn’t be! Personally, I don’t usually care for Fruit Beers.
        My ratings of beers of that style will always be reflective of that, and will usually tend to be lower than for people who enjoy the style.
        Our composite rankings of beers take that into account, and rely on having many different people from a variety of backgrounds with a multitude of opinions and preferences, so that we can achieve a ranking that is truly reflective of a beer, rather than the impressions of an individual.
        For that reason alone, it’s important that you try beers of all styles, especially styles you don’t necessarily care for.
    </p>
    <p>
        Let your thoughts be heard!
    </p>
    <br>
    <br>
  </body>

</html>
