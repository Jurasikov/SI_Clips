(deftemplate pytanie
(slot numer (type NUMBER))
(slot tresc (type STRING))
(multislot odpowiedzi (type STRING))
)

(deftemplate odpowiedz
(slot pytanie (type NUMBER))
(slot tresc (type STRING))
)

(deftemplate wynik
(slot nazwa (type STRING))
(slot opis (type STRING))
)

(deffacts init
(init)
)

(defrule start
(init)
=>
(assert (pytanie (numer 1)
(tresc "Who is the wine for?")
(odpowiedzi "friend" "significant other" "secret santa" "family member" "co-worker")))
)

(defrule pytanie2
(odpowiedz (pytanie 1) (tresc "friend"))
=>
(assert (pytanie (numer 2) 
(tresc "Do they like wine?")
(odpowiedzi "yes" "actually no")))
)

(defrule pytanie3
(odpowiedz (pytanie 2) (tresc "yes"))
=>
(assert (pytanie (numer 3)
(tresc "Your bestie?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie4
(odpowiedz (pytanie 1) (tresc "significant other"))
=>
(assert (pytanie (numer 4) (tresc "How long?")
(odpowiedzi "it's new and it could be serious" "it's just a fling" "forever")))
)

(defrule pytanie5
(odpowiedz (pytanie 4) (tresc "forever"))
=>
(assert (pytanie (numer 5) (tresc "What's next?")
(odpowiedzi "I'm getting ready to propose" "I spend more time at work" "everything is awesome")))
)

(defrule pytanie6
(odpowiedz (pytanie 1) (tresc "secret santa"))
=>
(assert (pytanie (numer 6) (tresc "Are you broke?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie7
(odpowiedz (pytanie 1) (tresc "family member"))
=>
(assert (pytanie (numer 7) (tresc "Who is it?")
(odpowiedzi "a sibling" "parents" "the inlaws")))
)

(defrule pytanie8
(odpowiedz (pytanie 7) (tresc "the inlaws"))
=>
(assert (pytanie (numer 8) (tresc "At their house?")
(odpowiedzi "no" "yes")))
)

(defrule pytanie9
(odpowiedz (pytanie 8) (tresc "no"))
=>
(assert (pytanie (numer 9) (tresc "How is your marriage?")
(odpowiedzi "Bliss!" "the divorce lawyer is on speed dial")))
)

(defrule pytanie10
(odpowiedz (pytanie 9) (tresc "Bliss!"))
=>
(assert (pytanie (numer 10) (tresc "And the inlaws?")
(odpowiedzi "I love them" "Shoot me")))
)

(defrule pytanie11
(odpowiedz (pytanie 10) (tresc "I love them"))
=>
(assert (pytanie (numer 11) (tresc "Seriously?")
(odpowiedzi "I know")))
)

(defrule pytanie12
(odpowiedz (pytanie 7) (tresc "parents"))
=>
(assert (pytanie (numer 12) (tresc "Golden child?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie13
(odpowiedz (pytanie 12) (tresc "no"))
=>
(assert (pytanie (numer 13) (tresc "Are you trying to be good?")
(odpowiedzi "yes" "meh")))
)

(defrule pytanie14
(odpowiedz (pytanie 7) (tresc "a sibling"))
=>
(assert (pytanie (numer 14) (tresc "Who is the overachiever?")
(odpowiedzi "sadly that's not me..." "is that even a question?")))
)

(defrule pytanie15
(odpowiedz (pytanie 14) (tresc "is that even a question?"))
=>
(assert (pytanie (numer 15) (tresc "Stick it in their face?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie16
(odpowiedz (pytanie 14) (tresc "sadly that's not me..."))
=>
(assert (pytanie (numer 16) (tresc "Take the high road?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie17
(odpowiedz (pytanie 1) (tresc "co-worker"))
=>
(assert (pytanie (numer 17) (tresc "Actually the boss?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie18
(odpowiedz (pytanie 17) (tresc "yes"))
=>
(assert (pytanie (numer 18) (tresc "Boss a snob?")
(odpowiedzi "yes" "no")))
)

(defrule pytanie19
(odpowiedz (pytanie 18) (tresc "no"))
=>
(assert (pytanie (numer 19) (tresc "Your strategy")
(odpowiedzi "angling for a raise" "I'm quitting" "trying to get out of the dog house" "waiting until january 1st for my bonus")))
)

(defrule pytanie20
(odpowiedz (pytanie 19) (tresc "I'm quitting"))
=>
(assert (pytanie (numer 20) (tresc "For a better job?")
(odpowiedzi "yes" "no")))
)

(defrule jackd
(or (odpowiedz (pytanie 2) (tresc "actually no"))
(odpowiedz (pytanie 4) (tresc "it's just a fling")))
=>
(assert (wynik (nazwa "Jack Daniel's") (opis "You maight as well get drunk together")))
)

(defrule pcc
(or (odpowiedz (pytanie 3) (tresc "yes"))
(odpowiedz (pytanie 19) (tresc "waiting until january 1st for my bonus")))
=>
(assert (wynik (nazwa "Prestige Cuvee Champagne") (opis "A bottle of dom will impress")))
)

(defrule malbec
(or (odpowiedz (pytanie 3) (tresc "no"))
(odpowiedz (pytanie 17) (tresc "no")))
=>
(assert (wynik (nazwa "Malbec")
(opis "Malbec is a very safe and inexpensive choice")))
)

(defrule barolo
(odpowiedz (pytanie 4) (tresc "it's new and it could be serious"))
=>
(assert (wynik (nazwa "Barolo") (opis "This one will age well, like the two of you")))
)

(defrule assyrtiko
(odpowiedz (pytanie 5) (tresc "I'm getting ready to propose"))
=>
(assert (wynik (nazwa "Assyrtiko") (opis "A white wine from santorini, aka honeymoon preview")))
)

(defrule opusone 
(odpowiedz (pytanie 5) (tresc "I spend more time at work"))
=>
(assert (wynik (nazwa "Opus one") (opis "It was the most expensive bottle at the shop")))
)

(defrule chablis
(odpowiedz (pytanie 5) (tresc "everything is awesome"))
=>
(assert (wynik (nazwa "Chablis") (opis "Because you're in sha-bliss")))
)

(defrule prc
(odpowiedz (pytanie 6) (tresc "no"))
=>
(assert (wynik (nazwa "Paso Robles Cab") (opis "A high quality cabernet at a quarter the price of Napa")))
)

(defrule 2bc
(odpowiedz (pytanie 6) (tresc "yes"))
=>
(assert (wynik (nazwa "2 buck chuck") (opis "Let's just hope no one figures it's out")))
)

(defrule zinfandel
(odpowiedz (pytanie 8) (tresc "yes"))
=>
(assert (wynik (nazwa "Zinfandel") (opis "You're going to need a high alcohol california friend")))
)

(defrule agedrum
(odpowiedz (pytanie 9) (tresc "the divorce lawyer is on speed dial"))
=>
(assert (wynik (nazwa "Aged rum") (opis "It's called trainnig for the singles resort")))
)

(defrule mr
(odpowiedz (pytanie 10) (tresc "Shoot me"))
=>
(assert (wynik (nazwa "Mosel Riesling") (opis "The bottle will be ready and waiting for you next year!")))
)

(defrule cdp
(odpowiedz (pytanie 11) (tresc "I know"))
=>
(assert (wynik (nazwa "Chateauneuf du Pape") (opis "They're worth excellence")))
)

(defrule fav
(odpowiedz (pytanie 12) (tresc "yes"))
=>
(assert (wynik (nazwa "Their favourite") (opis "You always make the rigt decision right?")))
)

(defrule rrpn
(odpowiedz (pytanie 13) (tresc "yes"))
=>
(assert (wynik (nazwa "Russian River Pinot Noir") (opis "You're such a thoughtful child")))
)

(defrule jugwine
(odpowiedz (pytanie 13) (tresc "meh"))
=>
(assert (wynik (nazwa "Jug wine") (opis "A red blend of who knows what from California")))
)

(defrule opn
(odpowiedz (pytanie 15) (tresc "no"))
=>
(assert (wynik (nazwa "Oregon Pinot Noir") (opis "Great wine...great value")))
)

(defrule cgb
(odpowiedz (pytanie 15) (tresc "yes"))
=>
(assert (wynik (nazwa "Classified Growth Bordeaux") (opis "Include aging instructions")))
)

(defrule rr
(odpowiedz (pytanie 16) (tresc "yes"))
=>
(assert (wynik (nazwa "Reserva Rioja") (opis "A great wine with some age that won't break the bank")))
)

(defrule chd
(or (odpowiedz (pytanie 16) (tresc "no"))
(odpowiedz (pytanie 20) (tresc "no")))
=>
(assert (wynik (nazwa "Chateau Diana") (opis "Life's too short... said no one")))
)

(defrule nc
(odpowiedz (pytanie 18) (tresc "yes"))
=>
(assert (wynik (nazwa "Napa Cabernet") (opis "Your boss will be happy with this pricey pick")))
)

(defrule gslst 
(odpowiedz (pytanie 19) (tresc "trying to get out of the doghouse"))
=>
(assert (wynik (nazwa "A Good Second Label Super Tuscan") (opis "Sounds better than it is. Like you")))
)

(defrule pcrb
(odpowiedz (pytanie 19) (tresc "angling for a raise"))
=>
(assert (wynik (nazwa "Premier Cru Red Burgundy") (opis "Thoughtful & impressive. Like you")))
)