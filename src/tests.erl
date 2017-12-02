-include_lib("eunit/include/eunit.hrl").
-module(tests).

ccharcount_test() ->
    List = ccharcount:load("hamlet.txt"),
    List = [{"a",10518},
            {"b",1973},
            {"c",2909},
            {"d",5361},
            {"e",16155},
            {"f",2890},
            {"g",2610},
            {"h",8988},
            {"i",9144},
            {"j",150},
            {"k",1315},
            {"l",6196},
            {"m",4488},
            {"n",8870},
            {"o",11992},
            {"p",2253},
            {"q",229},
            {"r",8389},
            {"s",8852},
            {"t",12720},
            {"u",4620},
            {"v",1303},
            {"w",3245},
            {"x",273},
            {"y",3437},
            {"z",78}].

fanalysisbycount_test() ->
    Results = fanalysis:open("loremipsum", sort_by_count),
    Results = [{"ut",8},
               {"ius",7},
               {"ne",6},
               {"ad",6},
               {"pri",6},
               {"at",6},
               {"et",5},
               {"eu",5},
               {"id",5},
               {"ex",5},
               {"dolor",4},
               {"cu",4},
               {"cum",4},
               {"has",4},
               {"sea",4},
               {"nec",4},
               {"qui",4},
               {"sit",4},
               {"duo",4},
               {"in",4},
               {"an",4},
               {"no",4},
               {"usu",4},
               {"quo",4},
               {"mei",3},
               {"eam",3},
               {"vix",3},
               {"apeirian",3},
               {"ea",3},
               {"vim",3},
               {"te",3},
               {"ei",3},
               {"errem",3},
               {"sed",3},
               {"mel",3},
               {"mea",3},
               {"vel",3},
               {"vis",3},
               {"hendrerit",3},
               {"eum",3},
               {"hinc",2},
               {"putant",2},
               {"persius",2},
               {"sententiae",2},
               {"concludaturque",2},
               {"unum",2},
               {"utroque",2},
               {"movet",2},
               {"molestie",2},
               {"iuvaret",2},
               {"quaeque",2},
               {"numquam",2},
               {"mollis",2},
               {"quem",2},
               {"doming",2},
               {"invenire",2},
               {"urbanitas",2},
               {"oblique",2},
               {"duis",2},
               {"est",2},
               {"liber",2},
               {"lorem",2},
               {"contentiones",2},
               {"tincidunt",2},
               {"oporteat",2},
               {"deleniti",2},
               {"ipsum",2},
               {"efficiantur",2},
               {"eos",2},
               {"scaevola",2},
               {"possim",2},
               {"intellegat",2},
               {"placerat",2},
               {"purto",2},
               {"mediocrem",2},
               {"tritani",2},
               {"pericula",2},
               {"vero",2},
               {"paulo",2},
               {"pro",2},
               {"clita",2},
               {"autem",2},
               {"nonumy",2},
               {"saperet",2},
               {"cibo",1},
               {"theophrastus",1},
               {"honestatis",1},
               {"diam",1},
               {"malorum",1},
               {"ullamcorper",1},
               {"odio",1},
               {"eros",1},
               {"aeque",1},
               {"aliquid",1},
               {"zril",1},
               {"saepe",1},
               {"vituperatoribus",1},
               {"audiam",1},
               {"torquatos",1},
               {"dissentiunt",1},
               {"dicunt",1},
               {"qualisque",1},
               {"solet",1},
               {"congue",1},
               {"scribentur",1},
               {"definiebas",1},
               {"impedit",1},
               {"verterem",1},
               {"fastidii",1},
               {"platonem",1},
               {"splendide",1},
               {"persequeris",1},
               {"tempor",1},
               {"euripidis",1},
               {"natum",1},
               {"mundi",1},
               {"omnes",1},
               {"debitis",1},
               {"iriure",1},
               {"justo",1},
               {"facilis",1},
               {"epicurei",1},
               {"sumo",1},
               {"percipit",1},
               {"harum",1},
               {"iudicabit",1},
               {"dico",1},
               {"quaestio",1},
               {"vocibus",1},
               {"per",1},
               {"lobortis",1},
               {"sint",1},
               {"partiendo",1},
               {"efficiendi",1},
               {"alienum",1},
               {"brute",1},
               {"nonumes",1},
               {"posse",1},
               {"possit",1},
               {"prompta",1},
               {"philosophia",1},
               {"altera",1},
               {"oportere",1},
               {"delicata",1},
               {"adolescens",1},
               {"tacimates",1},
               {"repudiandae",1},
               {"meis",1},
               {"nostrud",1},
               {"quod",1},
               {"inciderint",1},
               {"reque",1},
               {"feugiat",1},
               {"veritus",1},
               {"recusabo",1},
               {"expetenda",1},
               {"verear",1},
               {"noluisse",1},
               {"aeterno",1},
               {"legere",1},
               {"periculis",1},
               {"putent",1},
               {"doctus",1},
               {"ignota",1},
               {"graeco",1},
               {"solum",1},
               {"amet",1},
               {"semper",1},
               {"volutpat",1},
               {"vivendum",1},
               {"iudico",1},
               {"graeci",1},
               {"suas",1},
               {"tantas",1},
               {"definitionem",1},
               {"interpretaris",1},
               {"omnesque",1},
               {"mandamus",1},
               {"integre",1},
               {"forensibus",1},
               {"elaboraret",1},
               {"his",1},
               {"aperiam",1},
               {"indoctum",1},
               {"albucius",1},
               {"probatus",1},
               {"labitur",1},
               {"liberavisse",1},
               {"utamur",1},
               {"conceptam",1},
               {"tation",1},
               {"electram",1},
               {"nam",1},
               {"aperiri",1},
               {"case",1},
               {"quidam",1},
               {"nostrum",1},
               {"laudem",1},
               {"suscipit",1},
               {"sapientem",1},
               {"debet",1},
               {"moderatius",1},
               {"luptatum",1},
               {"consequuntur",1},
               {"adhuc",1},
               {"alia",1},
               {"mazim",1},
               {"ferri",1},
               {"appetere",1},
               {"nostro",1},
               {"ocurreret",1},
               {"commune",1},
               {"dicta",1},
               {"incorrupte",1},
               {"docendi",1},
               {"dicam",1},
               {"stet",1},
               {"deseruisse",1},
               {"sensibus",1},
               {"feugait",1},
               {"volumus",1},
               {"vidit",1},
               {"similique",1},
               {"euismod",1},
               {"sonet",1},
               {"prima",1},
               {"ponderum",1},
               {"ludus",1},
               {"dicat",1},
               {"vivendo",1},
               {"dolorum",1},
               {"nemore",1},
               {"eripuit",1},
               {"noster",1},
               {"detracto",1},
               {"malis",1},
               {"regione",1},
               {"adipiscing",1},
               {"appellantur",1},
               {"adversarium",1}].

fanalysisbyword_test() ->
    Result = fanalysis:open("loremipsum", sort_by_word),
    Result = [{"ad",6},
              {"adhuc",1},
              {"adipiscing",1},
              {"adolescens",1},
              {"adversarium",1},
              {"aeque",1},
              {"aeterno",1},
              {"albucius",1},
              {"alia",1},
              {"alienum",1},
              {"aliquid",1},
              {"altera",1},
              {"amet",1},
              {"an",4},
              {"apeirian",3},
              {"aperiam",1},
              {"aperiri",1},
              {"appellantur",1},
              {"appetere",1},
              {"at",6},
              {"audiam",1},
              {"autem",2},
              {"brute",1},
              {"case",1},
              {"cibo",1},
              {"clita",2},
              {"commune",1},
              {"conceptam",1},
              {"concludaturque",2},
              {"congue",1},
              {"consequuntur",1},
              {"contentiones",2},
              {"cu",4},
              {"cum",4},
              {"debet",1},
              {"debitis",1},
              {"definiebas",1},
              {"definitionem",1},
              {"deleniti",2},
              {"delicata",1},
              {"deseruisse",1},
              {"detracto",1},
              {"diam",1},
              {"dicam",1},
              {"dicat",1},
              {"dico",1},
              {"dicta",1},
              {"dicunt",1},
              {"dissentiunt",1},
              {"docendi",1},
              {"doctus",1},
              {"dolor",4},
              {"dolorum",1},
              {"doming",2},
              {"duis",2},
              {"duo",4},
              {"ea",3},
              {"eam",3},
              {"efficiantur",2},
              {"efficiendi",1},
              {"ei",3},
              {"elaboraret",1},
              {"electram",1},
              {"eos",2},
              {"epicurei",1},
              {"eripuit",1},
              {"eros",1},
              {"errem",3},
              {"est",2},
              {"et",5},
              {"eu",5},
              {"euismod",1},
              {"eum",3},
              {"euripidis",1},
              {"ex",5},
              {"expetenda",1},
              {"facilis",1},
              {"fastidii",1},
              {"ferri",1},
              {"feugait",1},
              {"feugiat",1},
              {"forensibus",1},
              {"graeci",1},
              {"graeco",1},
              {"harum",1},
              {"has",4},
              {"hendrerit",3},
              {"hinc",2},
              {"his",1},
              {"honestatis",1},
              {"id",5},
              {"ignota",1},
              {"impedit",1},
              {"in",4},
              {"inciderint",1},
              {"incorrupte",1},
              {"indoctum",1},
              {"integre",1},
              {"intellegat",2},
              {"interpretaris",1},
              {"invenire",2},
              {"ipsum",2},
              {"iriure",1},
              {"iudicabit",1},
              {"iudico",1},
              {"ius",7},
              {"iuvaret",2},
              {"justo",1},
              {"labitur",1},
              {"laudem",1},
              {"legere",1},
              {"liber",2},
              {"liberavisse",1},
              {"lobortis",1},
              {"lorem",2},
              {"ludus",1},
              {"luptatum",1},
              {"malis",1},
              {"malorum",1},
              {"mandamus",1},
              {"mazim",1},
              {"mea",3},
              {"mediocrem",2},
              {"mei",3},
              {"meis",1},
              {"mel",3},
              {"moderatius",1},
              {"molestie",2},
              {"mollis",2},
              {"movet",2},
              {"mundi",1},
              {"nam",1},
              {"natum",1},
              {"ne",6},
              {"nec",4},
              {"nemore",1},
              {"no",4},
              {"noluisse",1},
              {"nonumes",1},
              {"nonumy",2},
              {"noster",1},
              {"nostro",1},
              {"nostrud",1},
              {"nostrum",1},
              {"numquam",2},
              {"oblique",2},
              {"ocurreret",1},
              {"odio",1},
              {"omnes",1},
              {"omnesque",1},
              {"oporteat",2},
              {"oportere",1},
              {"partiendo",1},
              {"paulo",2},
              {"per",1},
              {"percipit",1},
              {"pericula",2},
              {"periculis",1},
              {"persequeris",1},
              {"persius",2},
              {"philosophia",1},
              {"placerat",2},
              {"platonem",1},
              {"ponderum",1},
              {"posse",1},
              {"possim",2},
              {"possit",1},
              {"pri",6},
              {"prima",1},
              {"pro",2},
              {"probatus",1},
              {"prompta",1},
              {"purto",2},
              {"putant",2},
              {"putent",1},
              {"quaeque",2},
              {"quaestio",1},
              {"qualisque",1},
              {"quem",2},
              {"qui",4},
              {"quidam",1},
              {"quo",4},
              {"quod",1},
              {"recusabo",1},
              {"regione",1},
              {"repudiandae",1},
              {"reque",1},
              {"saepe",1},
              {"saperet",2},
              {"sapientem",1},
              {"scaevola",2},
              {"scribentur",1},
              {"sea",4},
              {"sed",3},
              {"semper",1},
              {"sensibus",1},
              {"sententiae",2},
              {"similique",1},
              {"sint",1},
              {"sit",4},
              {"solet",1},
              {"solum",1},
              {"sonet",1},
              {"splendide",1},
              {"stet",1},
              {"suas",1},
              {"sumo",1},
              {"suscipit",1},
              {"tacimates",1},
              {"tantas",1},
              {"tation",1},
              {"te",3},
              {"tempor",1},
              {"theophrastus",1},
              {"tincidunt",2},
              {"torquatos",1},
              {"tritani",2},
              {"ullamcorper",1},
              {"unum",2},
              {"urbanitas",2},
              {"usu",4},
              {"ut",8},
              {"utamur",1},
              {"utroque",2},
              {"vel",3},
              {"verear",1},
              {"veritus",1},
              {"vero",2},
              {"verterem",1},
              {"vidit",1},
              {"vim",3},
              {"vis",3},
              {"vituperatoribus",1},
              {"vivendo",1},
              {"vivendum",1},
              {"vix",3},
              {"vocibus",1},
              {"volumus",1},
              {"volutpat",1},
              {"zril",1}].

pi_test() ->
    3.14159 = pi:pi().