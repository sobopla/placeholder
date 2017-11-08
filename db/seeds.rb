genres = ["Alternative","Art Punk","Indie", "thrash", "r&b", "folk", "Alternative Rock","College Rock","Crossover Thrash","Crust Punk","Experimental Rock","Folk Punk","Goth","Gothic Rock","Grunge","Hardcore Punk","Hard Rock","Indie Rock","Lo-fi","New Wave","Progressive Rock","Punk","Shoegaze","Steampunk","Anime","Blues","Acoustic Blues","Chicago Blues","Classic Blues","Contemporary Blues","Country Blues","Delta Blues","Electric Blues","Ragtime Blues","Screamo","Children’s Music","Lullabies","Sing-Along","Stories","Classical","Avant-Garde","Baroque","Chamber Music","Chant","Choral","Classical Crossover","Contemporary Classical","Early Music","Expressionist","High Classical","Impressionist","Medieval","Minimalism","Modern Composition","Opera","Orchestral","Renaissance","Romantic","Wedding Music","Comedy","Novelty","Standup Comedy","Vaudeville","Commercial","Jingles","TV Themes","Country","Alternative Country","Americana","Bluegrass","Contemporary Bluegrass","Contemporary Country","Country Gospel","Country Pop","Honky Tonk","Outlaw Country","Traditional Bluegrass","Traditional Country","Urban Cowboy","Dance","EDM","Electronic Dance Music","Club / Club Dance","Breakcore","Breakbeat","Breakstep","Brostep","Chillstep","Deep House","Dubstep","Electro House","Electroswing","Exercise","Future Garage","Garage","Glitch Hop","Glitch Pop","Grime","Hardcore","Hard Dance","Hi-NRG","Eurodance","Horrorcore","House","Jackin House","Jungle","Drum’n’bass","Liquid Dub","Regstep","Speedcore","Techno","Trance","Trap","Disney","Easy Listening","Bop","Lounge","Swing","Electronic","2-Step","8bit","8-bit","Bitpop","Chiptune","Ambient","Bassline","Chillwave","Chiptune","Crunk","Downtempo","Drum & Bass","Electro","Electro-swing","Electronica","Electronic Rock","Hardstyle","IDM","Experimental","Industrial","Trip Hop","Enka","French Pop","German Folk","German Pop","Fitness & Workout","Hip-Hop/Rap","Alternative Rap","Bounce","Dirty South","East Coast Rap","Gangsta Rap","Hardcore Rap","Hip-Hop","Latin Rap","Old School Rap","Rap","Turntablism","Underground Rap","West Coast Rap","Holiday","Chanukah","Christmas","Christmas: Children’s","Christmas: Classic","Christmas: Classical","Christmas: Comedy","Christmas: Jazz","Christmas: Modern","Christmas: Pop","Christmas: R&B","Christmas: Religious","Christmas: Rock","Easter","Halloween","Holiday: Other","Thanksgiving","Indie Pop","Industrial","Inspirational","Christian & Gospel","CCM","Christian Metal","Christian Pop","Christian Rap","Christian Rock","Classic Christian","Contemporary Gospel","Gospel","Christian & Gospel","Praise & Worship","Qawwali","Southern Gospel","Traditional Gospel","Instrumental","March (Marching Band)","J-Pop","J-Rock","J-Synth","J-Ska","J-Punk","Jazz","Acid Jazz","Avant-Garde Jazz","Bebop","Big Band","Blue Note","Contemporary Jazz","Cool","Crossover Jazz","Dixieland","Ethio-jazz","Fusion","Gypsy Jazz","Hard Bop","Latin Jazz","Mainstream Jazz","Ragtime","Smooth Jazz","Trad Jazz","K-Pop","Karaoke","Kayokyoku","Latin","Alternativo","Rock Latino","Argentine tango","Baladas y Boleros","Bossa Nova","Brazilian","Contemporary Latin","Cumbia","Flamenco","Spanish Flamenco","Latin Jazz","Nuevo Flamenco","Pop Latino","Portuguese fado","Raíces","Reggaeton","Hip-Hop","Regional Mexicano","Salsa y Tropical","New Age","Environmental","Healing","Meditation","Nature","Relaxation","Travel","Opera","Pop","Adult Contemporary","Britpop","Bubblegum Pop","Chamber Pop","Dance Pop","Dream Pop","Electro Pop","Orchestral Pop","Pop/Rock","Pop Punk","Power Pop","Soft Rock","Synthpop","Teen Pop","R&B/Soul","Contemporary R&B","Disco","Doo Wop","Funk","Modern Soul","Motown","Neo-Soul","Northern Soul","Psychedelic Soul","Quiet Storm","Soul","Soul Blues","Southern Soul","Reggae","2-Tone","Dancehall","Dub","Roots Reggae","Ska","Rock","Acid Rock","Adult-Oriented Rock","Afro Punk","Adult Alternative","Alternative Rock","American Trad Rock","Anatolian Rock","Arena Rock","Art Rock","Blues-Rock","British Invasion","Cock Rock","Death Metal","Black Metal","Doom Metal","Glam Rock","Gothic Metal","Grind Core","Hair Metal","Hard Rock","Math Metal","Math Rock","Metal","Metal Core","Noise Rock","Jam Bands","Post Punk","Prog-Rock/Art Rock","Progressive Metal","Psychedelic","Rock & Roll","Rockabilly","Roots Rock","Singer/Songwriter","Southern Rock","Spazzcore","Stoner Metal","Surf","Technical Death Metal","Tex-Mex","Time Lord Rock","Trash Metal","Singer/Songwriter","Alternative Folk","Contemporary Folk","Contemporary Singer/Songwriter","Indie Folk","Folk-Rock","Love Song","New Acoustic","Traditional Folk","Soundtrack","Foreign Cinema","Movie Soundtrack","Musicals","Original Score","Soundtrack","TV Soundtrack","Spoken Word","Tex-Mex","Tejano","Chicano","Classic","Conjunto","Conjunto Progressive","New Mex","Tex-Mex","Vocal","A cappella","Barbershop","Doo-wop","Gregorian Chant","Standards","Traditional Pop","Vocal Jazz","Vocal Pop","World","Africa","Afro-Beat","Afro-Pop","Asia","Australia","Cajun","Calypso","Caribbean","Carnatic","Celtic","Celtic Folk","Contemporary Celtic","Coupé-décalé","Dangdut,Drinking Songs","Drone","Europe","France","Hawaii","Hindustani","Indian Ghazal","Indian Pop","Japan","Japanese Pop","Klezmer","Mbalax","Middle East","North America","Ode","Piphat","Polka","Soca","South Africa","South America","Traditional Celtic","Worldbeat","Zydeco","yacht rock"]

genres.each do |genre_type|
  Genre.create(genre: genre_type.downcase)
end

