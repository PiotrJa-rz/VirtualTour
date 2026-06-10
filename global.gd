extends Node

var panoramas = [
	"res://pomieszczenia-sceny/galeria_owalna_1.tscn",
	"res://pomieszczenia-sceny/galeria_owalna_2.tscn",
	"res://pomieszczenia-sceny/galeria_owalna_3.tscn",
	"res://pomieszczenia-sceny/sala_rady_1.tscn",
	"res://pomieszczenia-sceny/sala_rady_2.tscn",
	"res://pomieszczenia-sceny/sala_wielka_1.tscn",
	"res://pomieszczenia-sceny/sala_wielka_2.tscn",
	"res://pomieszczenia-sceny/sala_wielka_3.tscn",
	"res://pomieszczenia-sceny/sala_rycerska_1.tscn",
	"res://pomieszczenia-sceny/sala_rycerska_2.tscn",
	"res://pomieszczenia-sceny/sala_tronowa_1.tscn",
	"res://pomieszczenia-sceny/sala_tronowa_2.tscn",
	"res://pomieszczenia-sceny/pokoj_marmurowy_1.tscn",
	"res://pomieszczenia-sceny/przedpokoj_sali_wielkiej_1.tscn",
	"res://pomieszczenia-sceny/przedpokoj_sali_wielkiej_2.tscn"
]
var button_pressed_on_map = false
var panorama_index = 0
var panel_visible = true
var map = false
var opis_sali = false

var current_hotspot = ""

var opisy_sal = {
	"owalna": {
		"title": "Galeria Owalna",
		"description": "Galeria Owalna była niegdyś salą przejściową, przez którą prowadziła droga do lozy królewskiej w kolegiacie św. Jana. W czasie odbudowy otrzymała nowy wystrój oraz cenne wyposażenie: arrasy brukselskie z połowy XVI wieku oraz portrety monarchów polskich z przełomu XVI i XVII wieku."
	},
	"rady": {
		"title": "Sala Rady",
		"description": "Salę Rady odbudowano na podstawie jej oryginalnego projektu z 1784 roku. Służyła ona w czasach Stanisława Augusta jako sala posiedzeń Rady Nieustającej – pierwszego w Polsce stałego rządu złożonego z króla (stąd tron królewski), 18 senatorów i 18 posłów. Krzesło tronowe jest oryginalne, a dekorację tronu zrekonstruowano według projektu Andrzeja Grzybowskiego. Na ścianach wiszą portrety wybitnych działaczy Sejmu Czteroletniego pędzla Józefa Peszki m. in.: prezydenta Warszawy Ignacego Zakrzewskiego, marszałka sejmu Stanisława Małachowskiego oraz Hugona Kołątaja. Eksponowane są tu również najstarsze polskie ordery: Orła Białego, Świętego Stanisława oraz Virtuti Militari."
	},
	"wielka": {
		"title": "Sala Wielka",
		"description": "Sala Wielka (nazywana również Balową) to największa i najparadniejsza sala w Zamku. W czasach Stanisława Augusta służyła jako miejsce ceremonii dworskich. Tu odbywały się zgromadzenia dworskie, a także uczty, bale, koncerty i przedstawienia teatralne. Wystrój i wyposażenie sali wykonane zostały według projektów Dominika Merliniego i Jana Christiana Kamsetzera w latach 1777-81. Data zakończenia prac uwidoczniona jest nad środkowym wejściem do sali. Wykorzystano też dzieła sztuki i fragmenty wystroju zakupione w Paryżu, m.in. skrzydła drzwi według projektu Victora Louisa i okazałe kandelabry wykonane w warsztacie Philippe'a Caffieriego.
Autorami posągów Apolla (z rysami twarzy Stanisława Augusta) i Minerwy (z rysami twarzy carycy Katarzyny II) oraz alegorii Sprawiedliwości i Pokoju ujmujących medalion z podobizną Stanisława Augusta byli rzeźbiarze André Le Brun i Jakub Monaldi. Po obu stronach centralnej niszy wypisano dewizy dwóch orderów nadawanych przez króla: Orderu Orła Białego i Orderu św. Stanisława.
Sala Wielka była pierwszą ofiarą wojny – 17 września 1939 roku spadły na nią bomby, całkowicie niszcząc ogromnych rozmiarów plafon przekstawiający _Rozwikłanie_chaosu_.
Salę zrekonstruowano ściśle według wyglądu sprzed 1939 roku z wykorzystaniem uratowanych fragmentów sztukaterii (m.in. supraraporty z orłami nad wejściamu bocznymi). Plafon odtworzyli Łucja i Józef Oźminowie.
Zasadniczą treścią, przedstawioną zarówno na plafonie, jak i w posągach i dewizach orderowych, jest motyw utrzymania boskiego porządku świata jako obowiązku każdego monarchy."
	},
	"rycerska": {
		"title": "Sala Rycerska",
		"description": "Sala Rycerska powstała według koncepcji samego króla Stanisława Augusta. Intencją monarchy było stworzenie w Zamku sali o charakterze panteonu narodowego. Chciał w niej uczczić osoby zasłużone dla ojczyzny, a także przypomnieć najważniejsze momenty z dziejów Polski. Ideę króla urzeczywistnili w latach 1781-86 jego architekci Dominik Merlini i Jan Christian Kamsetzer, malarz Marcello Bacciarelli oraz rzeźbiarze André Le Brun i Jakub Monaldi. Sześć okazałych płócien przedstawia sceny z dziejów Polski i Litwy, m.in. _Założenie_Uniwersytetu_Jagielońskiego_w_Krakowie_, _Unię_polsko-litewską_ i _Zwycięstwo_Jana_III_pod_Wiedniem_. Dziesięć owalnych portretów i dwadzieścia dwa brązowe popiersia przedstawiają wybranych przez króla sławnych Polaków: mężów stanu, wodzów, kapłanów i pisarzy. Wokół sali biegnie napis zaczerpnięty z VII księgi _Eneidy_ Wergiliusza, odnoszący się do zasług wybitnych obywateli.
Uwagę zwracają ustawione w środkowej części sali posągi Sławy oraz Chronosa-Saturna. Sława głosi wieczną chwałę osób wyróżnionych przez króla, a Chronos-Saturn, symbolizujący przemijanie czasu i stale odradzające się życie, ma zapewnić, że cechy wybitnych mężów naszej historii odrodzą się w młodym pokoleniu rodaków. Stanisław August chciał uwidocznić prawdę, że siła i mądrość narodu, głęboka wiara i przestrzeganie zasad sprawiedliwości są zasługą zarówno monarchów, jak i pozostałych obywateli.
Sala Narodowa, bo taką nazwę nosiła za Stanisława Augusta, służyła jako Przedpokój Senatorski. Miejsce przebywania najwyższych rangą gości króla: senatorów i ambasadorów. Salę odtworzono zgodnie z wyglądem, jaki miała przed zniszczeniem Zamku. Szczęśliwie uratowano wszystkie dzieła sztuki, które powróciły na swoje miejsce."
	},
	"marmurowy": {
		"title": "Pokój Marmurowy",
		"description": "Pokój Marmurowy służył jako drugi przedpokój w apartamencie państwowym i tutaj w
czasie audiencji przebywali wyżsi rangą dworzanie. Jest to najstarsze wnętrze w tym
apartamencie. Powstało jeszcze w czasach panowania króla Władysława IV w latach
1640-42, według projektu Giovanniego Battisty Gisleniego. Pokój został później
zaniedbany, a odnowił go Jakub Fontana w latach 1769-71. Fontana zachował ze
starego wnętrza podstawowe elementy kompozycji architektonicznej oraz, bez
większych zmian, dolną partię ścian poniżej belkowania i obramienia drzwi. Dodał
natomiast 22 portrety królów polskich, plafon namalowany przez Marcella
Bacciarellego oraz posągi Sprawiedliwości i Pokoju nad lustrem wykonane przez
André Le Bruna. Pokój pomyślany był jako miejsce upamiętnienia monarchów
zasiadających na tronie polskim. Król uwiecznił też twórców tego wnętrza: Fontanę,
Bacciarellego i Le Bruna na tablicy pod konsolą. [p]Urządzone przez Fontanę
wnętrze przetrwało do 1835 roku, kiedy to z rozkazu cara rozebrano marmurowe
ściany. Podstawą obecnej rekonstrukcji jest pięć akwarel Jana Christiana
Kamsetzera, które zarejestrowały wygląd pokoju z roku 1784. Na swoje miejsce
szczęśliwie powróciły zachowane portrety królów polskich oraz rzeźby. Plafon
odtworzony został ściśle według wspomnianych akwarel Kamsetzera przez
współczesnych malarzy: Stefana Garwatowskiego i Jana Karczewskiego."
	},
	"przedpokoj":{
		"title": "Przedpokój Sali Wielkiej",
		"description": "Przedpokój Sali Wielkiej, zwany też Wielką Antyszambrą, służył jako pierwszy
przedpokój, w którym w czasie audiencji gromadzili się niżsi rangą dworzanie. Jego
wystrój architektoniczny powstał w czasie obecnej rekonstrukcji Zamku. Wiszą tu
cztery obrazy zamówione w 1767 roku przez Stanisława Augusta właśnie do tej sali
u francuskich malarzy: Jesepha Viena, Noëla Hallé oraz Louisa Legrenée.
Przedstawiają sceny z historii starożytnej, podnosząc cnoty, jakimi charakteryzować
się powinni dobrzy władcy.
"
	},"tronowa":{
		"title": "Sala Tronowa",
		"description": "Tu, na audiencjach, przyjmowani byli najważniejsi goście Stanisława Augusta —
ambasadorowie i posłowie obcych monarchów oraz nuncjusz papieski. Dominujące
w dekoracji kolory czerwieni i złota, a także liczne elementy wystroju symbolizują
władzę królewską. Wnętrze projektował cały zespól nadwornych artystów z
Domenikiem Merlinim na czele w latach 1783-1786. Ze stanisławowskiego wystroju i
wyposażenia zachowały się drzwi, liczne fragmenty boazerii (rozpoznawalne po
ciemniejszym kolorze złoceń) oraz wykonane w Rzymie i Paryżu kominki, rzeźby,
meble i brązy. Oryginalny jest również fotel tronowy wykonany w Warszawie według
projektu Johanna Christiana Kamsetzera. Srebrne haftowane orfy z zaplecka tronu,
zerwane przez oficerów hitlerowskich w październiku 1939, zostały w całości
zrekonstruowane. Pierwowzorem 86 kopii był jeden z orłów, odnaleziony w Stanach
Zjednoczonych w 1991 roku.
"
		}
}


var galeria_owalna_hotspots = {
	"gideon": {
		"url": "res://wszystkie-zdjecia/Galeria Owalna/S01-POI05.jpg",
		"title": "Ofiara Gedeona (Anioł rozpalając ołtarz ofiarny Gedeona)",
		"description":"Antwerpia (?), ok. 1575-1600"
	},
	"wielki":{
		"url":"res://wszystkie-zdjecia/Galeria Owalna/S01-POI04.jpg",
		"title": "Bitwa Aleksandra Wielkiego",
		"description": "Flandria, Bruksela, połowa XVII wieku"
	},
	"eufrat": {
		"url":"res://wszystkie-zdjecia/Galeria Owalna/S01-POI02.jpg",
		"title": "Zmiana biegu rzeki Eufrat",
		"description": "Tapiseria z cyklu Dzieje Cyrusa z warsztatu Jana van Tieghema w Brukseli, ok. 1567 r."
	},
	"astiages":{
		"url": "res://wszystkie-zdjecia/Galeria Owalna/S01-POI03.jpg",
		"title": "Astiages i Harpagon",
		"description": "Tapiseria z cyklu Dzieje Cyrusa z warsztatu Jana van Tieghema w Brukseli, ok. 1567 r."
	},
	"dawid": {
		"url": "res://wszystkie-zdjecia/Galeria Owalna/S01-POI01.jpg",
		"title": "Dawid i Abigail",
		"description": "Flandria, ok. 1560. Dar Towarzystwa Miłośników Warszawy"
	},
	"czartoryski": {
		"url": "res://wszystkie-zdjecia/Sala Rady/POI03.jpg",
		"title": "Adam Czartoryski",
		"description": "Obraz przedstawiający Adama Czartoryskiego – generała ziem podolskich, posła lubelskiego na Sejm Wielki, autorstwa Józefa Peszki"
	},
	"małachowski":{
		"url": "res://wszystkie-zdjecia/Sala Rady/POI06.jpg",
		"title": "Stanisław Małachowski",
		"description": "Obraz przedstawiający Stanisława Małachowskiego – marszałek Sejmu Wielkiego, autorstwa Józefa Peszki"
	},
	"tron":{
		"url": "res://wszystkie-zdjecia/Sala Rady/POI01.jpg",
		"title": "Krzesło tronowe",
		"description": "Oryginalne krzesło tronowe, dekoracja tronu zrekonstruowana według projektu Andrzeja Grzybowskiego."
	},
	"kublicki":{
		"url": "res://wszystkie-zdjecia/Sala Rady/POI02.jpg",
		"title": "Stanisław Kublicki",
		"description": "Obraz przedstawiający Stanisława Kublickiego – posła Sejmu Czteroletniego, autorstwa Józefa Peszki"
	},
	"kołątaj": {
		"url": "res://wszystkie-zdjecia/Sala Rady/POI04.jpg",
		"title": "Hugo Kołłątaj",
		"description": "Obraz przedstawiający Hugona Kołłątaja - twórce Konstytucji 3 Maja, autorstwa Józefa Peszki"
	},
	"zakrzewski": {
		"url": "res://wszystkie-zdjecia/Sala Rady/POI05.jpg",
		"title": "Ignacy Zakrzewski",
		"description": "Obraz przedstawiający Ignacego Zakrzewskiego - pierwszego prezydenta Warszawy, autorstwa Józefa Peszki"
	},
	"kandelabr": {
		"url": "res://wszystkie-zdjecia/Sala Wielka/POI01.jpg",
		"title": "Kandelabr",
		"description": "Jeden z sześciu zamówionych w Paryżu w 1765 roku w warsztacie Philippe'a Caffieriego."
	},
	"chaos": {
		"url": "res://wszystkie-zdjecia/Sala Wielka/POI02.jpg",
		"title": "Rozwikłanie Chaosu",
		"description": "Plafon Marcello Bacciarellego, odtworzony przez Łucję i Józefa Oźminów"
	},
	"minerwa": {
		"url": "res://wszystkie-zdjecia/Sala Wielka/POI03.jpg",
		"title": "Minerwa",
		"description": "Minerwy (z rysami twarzy carycy Katarzyny II)"
	},
	"wieden": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI06.jpg",
		"title": "Odsiecz wiedeńska",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"chocim": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI05.jpg",
		"title": "Pokój chocimski",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"unia": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI04.jpg",
		"title": "Unia lubelska",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"hołd": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI03.jpg",
		"title": "Hołd pruski",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"akademia": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI02.jpg",
		"title": "Nadanie przywilejów Akademii Krakowskiej przez Władysława Jagiełłę",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"kazimierz": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI01.jpg",
		"title": "Kazimierz Wielki słuchający próśb chłopów",
		"description": "Marcello Bacciarelli, 1783-86 r."
	},
	"chronos": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI08.jpg",
		"title": "Chronos-Saturn",
		"description": "Jakub Monaldi, 1783-86 r."
	},
	"sława": {
		"url": "res://wszystkie-zdjecia/Sala Rycerska/POI07.jpg",
		"title": "Sława",
		"description": "André Le Brun, 1783-86 r."
	},
	"poniatowski": {
		"url": "res://wszystkie-zdjecia/POI – Pokój Marmurowy/POI – Pokój Marmurowy/S08-POI01.jpg",
		"title": "Portret Stanisława Augusta Poniatowskiego w stroju koronacyjnym",
		"description": "Marcello Bacciarelli, 1768–1771"
	},
	"tablica": {
		"url": "res://wszystkie-zdjecia/POI – Pokój Marmurowy/POI – Pokój Marmurowy/S08-POI02.jpg",
		"title": "Tablica upamiętniająca
autorów wystroju
pomieszczenia",
		"description": "Z nazwiskami Jakuba Fontany, Marcella Bacciarellego i André Le Bruna"
	},
	"S09-POI01": {
		"url": "res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI01.jpg",
		"title": "Scilurus, król Scytów,
nakazujący synom
zgodę",
	"description": "Noël Hallé, 1767 rok. Obraz symbolizujący Zgodę, na ramię inskrypcja:
CONCORDES INVICTI (Zgodni niezwyciężeni)"
	},
	"S09-POI02": {
		"url": "res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI02.jpg",
		"title": "Żal Juliusza Cezara
przed pomnikiem
Aleksandra Wielkiego",
		"description": "Joseph-Marie Vien, 1767 rok. Obraz symbolizujący Współzawodnictwo, na ramię
inskrypcja: ALEXANDRI GLORIA EXCITAVIT CAESAREM (Sława Aleksandra
poruszyła Cezara)"
	},
	"S09-POI03": {
		"url": "res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI03.jpg",
		"title": "Przerażenie Cezara na
widok głowy
Pompejusza
",
	"description": "Louis-François Lagrenée, 1767 rok. Obraz symbolizujący Wielkoduszność, na ramię
inskrypcja: INIMICI NECEM TURPE PATRATAM EXHORRUIT CAESAR (Zabójstwo
wroga popełnione haniebnie przeraziło Cezara)
"
	},
	"S09-POI04": {
		"url": "res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI04.jpg",
		"title": "Wstrzemięźliwość
Scypiona
",
	"description": "Joseph-Marie Vien, 1767 rok. Obraz symbolizujący Sprawiedliwość, na ramię
inskrypcja: SUUM CUIQUE (Każdemu, co mu się należy)"
	},
	"S09-POI05": {
		"url": "res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI05.jpg",
		"title": "Waza ze sceną
pochodu bogów
greckich
",
	"description": "Francja(?), XVIII wiek. Depozyt Muzeum Narodowego w Warszawie 
"
	},
	"S09-POI06": {
		"url":"res://wszystkie-zdjecia/POI – Przedpokój Sali Wielkiej/POI – Przedpokój Sali Wielkiej/S09-POI06.jpg",
		"title": "Satyr Odpoczywający",
		"description": "Rzymska kopia rzeźby Praksytelesa, II wiek n.e."
	},
	"S06-POI01": {
		"url": "res://wszystkie-zdjecia/POI – Sala Tronowa/POI – Sala Tronowa/S06-POI01.jpg",
		"title": "Fotel tronowy",
		"description": "Oryginalny fotel tronowy według projektu Johanna Cristiana Kamsetzera"
	},
	"S06-POI02": {
		"url": "res://wszystkie-zdjecia/POI – Sala Tronowa/POI – Sala Tronowa/S06-POI02.jpg",
		"title": "Gabinet Monarchów
Europejskich
",
"description": "Paradny gabinet dedykowany europejskim władcom z czasów króla Stanisława
Augusta
"
	}
}

func go_to_panorama(i):
	get_tree().change_scene_to_file(panoramas[i])
func next_panorama():
	panorama_index += 1
	if panorama_index > 14:
		panorama_index = 0
		get_tree().change_scene_to_file(panoramas[0])
	get_tree().change_scene_to_file(panoramas[panorama_index])
	

func previous_panorama():
	panorama_index -= 1
	if panorama_index < 0:
		panorama_index = panoramas.size()-1
	get_tree().change_scene_to_file(panoramas[panorama_index])
