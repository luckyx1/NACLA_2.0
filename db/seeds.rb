# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

articles = [	
	{	:title => "After The Cold War In The Wake Of Terror: Bush II in the Americas",
		:description => 'This is the second in a series of three reports that examine U.S.-Latin American relations after the Cold War. As we go to press in late October, there is a compelling sense that to the phrase "after the Cold War," we must add the words "in the wake of the terror."',
		:publication_date => '1-Nov-2001',
		:tags => "Cold War, terror",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/03503001.png",
		:volume => 35,
		:issue => 3,
		:download_link => nil
	},

	{	:title => "Rethinking Human Rights",
		:description => 'Readers of NACLA Report are by now familiar with our steadfast critique of the limited democracies that reign in most of Latin America. In recent issues we have documented the fragility of the "new democracies," the continued power of the armed forces, and the inability of elected governments to protect citizen rights and alter deeply embedded structures of inequality and misery.',
		:publication_date => '1-Jul-2000',
		:tags => "rights, democracy",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/03401001.png",
		:volume => 34,
		:issue => 1,
		:download_link => nil
	},

	{	:title => "Sport and Society in Latin America",
		:description => "Few would argue that sports are not a reflection of the larger society in which they exist: from the grueling ball games of ancient Mesoamerican warrior societies to the conspicuous consumption of land and equipment by country club golfers.",
		:publication_date => '1-Mar-2004',
		:tags => "sports, competition",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/03705001.png",
		:volume => 37,
		:issue => 5,
		:download_link => nil
	},

	{	:title => "Introduction: Food Crisis in the Americas",
		:description => "While the media have moved on to the next spectacle, the food crisis hasn't gone away. Unless, among other things, financial speculation in basic grains is regulated, if not abolished, the high volatility of food prices seems to be a fact of life now. In the face of the market's vicissitudes, the organized peasants of La Via Campesina declare: 'Humanity depends on us, and we refuse to disappear.'",
		:publication_date => '1-Apr-2009',
		:tags => "food, crisis",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/423cov_0.jpg",
		:volume => 42,
		:issue => 3,
		:download_link => nil
	},

	{	:title => "Colonial Capitalism: Crisis and Response in Puerto Rico",
		:description => "Since 1901, when the first duties between puerto Rico and the United States were abolished, the island's economy has served as a kind of experiment in what we today call neoliberalism.",
		:publication_date => '1-Nov-2007',
		:tags => "neoliberalism, economy",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/PRcover.jpg",
		:volume => 40,
		:issue => 6,
		:download_link => nil
	},

	{	:title => "Welcome To America: The Immigration Backlash",
		:description => "GROWING EVIDENCE OF SAMPER'S LINKS WITH CALI CARTEL BOGOTA, OCTOBER 1, 1995 Government raids in August that led to the arrests of top leaders of the Cali cartel yielded further evidence linking contri- butions from the cartel to Ernesto Samper's presidential campaign. While Samper point- ed to the arrests as proof of his will to fight the country's drug lords, documents found in the raid revealed that his campaign treasurer Santiago Medina had accepted a $50,000 check from a company known to be a front for the Cali cartel.",
		:publication_date => '1-Dec-1995',
		:tags => "immigration, campaign",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/02903001.png",
		:volume => 29,
		:issue => 3,
		:download_link => nil
	},

	{	:title => "The Other Super Power: The Soviet Union and Latin America",
		:description => "NORTH AMERICANS MAY BE TAKEN BY surprise when Soviet leader Mikhail S. Gor- bachev visits Latin America later this year.",
		:publication_date => '1-Jan-1987',
		:tags => "Cold War",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/02903001.png",
		:volume => 21,
		:issue => 1,
		:download_link => nil
	},

	{	:title => "D'Aubuisson's New ARENA",
		:description => 'IN MARCH EL SALVADOR LEAPT BACK ONTO MARCH EL SALVADOR LEAPT BACK ONTO the front pages when Aifredo "Freddy" Cristiani of front pages when Alfredo "Freddy" Cristiani of the far Right Nationalist Republican Alliance swept to the far Right Nationalist Republican Alliance swept to the presidency, and the guerrillas of the Farabundothe presidency, and the guerrillas of the Farabundo MartI Marti National Liberation Front mounted their largest military National Liberation Front mounted their largest military offensive in over five years. For us the change was offensive in over five years.',
		:publication_date => '1-Jul-1989',
		:tags => "presidency, El Salvador",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/02302001.png",
		:volume => 23,
		:issue => 2,
		:download_link => nil
	},

	{	:title => "Central America: Legacies of War",
		:description => "In the 1980s, Central America sank deep into political turmoil amid civil wars, brutal military dictatorships, and U.S. intervention. Three decades later, for the first issue of NACLA's 45th anniversary volume, we look to the legacies of war in Central America. Honduras is reliving its history of military coups, repression, and impunity. In Guatemala, a former dictator is charged with genocide. Across the region, former guerrillas and generals are in power, the military is again taking a disturbingly prominent role in policing, and communities are defending their land from powerful interests.",
		:publication_date => '1-Feb-2012',
		:tags => "war, 1980s",
		:thumbnail_link => "https://nacla.org/sites/default/files/imagecache/cover_thumbnail/covers/451Cover_HI.jpg",
		:volume => 45,
		:issue => 1,
		:download_link => nil
	}

]

articles.each do |article|
  Article.create!(article)
end

u = User.create!( :username => "admin", :email => "admin", :password => "NACLAadmin")
u.admin = true
u.save
