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
		:tags => "Cold War, terror"
	},

	{	:title => "Rethinking Human Rights",
		:description => 'Readers of NACLA Report are by now familiar with our steadfast critique of the limited democracies that reign in most of Latin America. In recent issues we have documented the fragility of the "new democracies," the continued power of the armed forces, and the inability of elected governments to protect citizen rights and alter deeply embedded structures of inequality and misery.',
		:publication_date => '1-Jul-2000',
		:tags => "rights, democracy"
	},

	{	:title => "Sport and Society in Latin America",
		:description => "Few would argue that sports are not a reflection of the larger society in which they exist: from the grueling ball games of ancient Mesoamerican warrior societies to the conspicuous consumption of land and equipment by country club golfers.",
		:publication_date => '1-Mar-2004',
		:tags => "sports, competition"
	},

	{	:title => "Introduction: Food Crisis in the Americas",
		:description => "While the media have moved on to the next spectacle, the food crisis hasn't gone away. Unless, among other things, financial speculation in basic grains is regulated, if not abolished, the high volatility of food prices seems to be a fact of life now. In the face of the market's vicissitudes, the organized peasants of La Via Campesina declare: 'Humanity depends on us, and we refuse to disappear.'",
		:publication_date => '1-Apr-2010',
		:tags => "food, crisis"
	},

	{	:title => "Colonial Capitalism: Crisis and Response in Puerto Rico",
		:description => "Since 1901, when the first duties between puerto Rico and the United States were abolished, the island's economy has served as a kind of experiment in what we today call neoliberalism.",
		:publication_date => '1-Nov-2007',
		:tags => "neoliberalism, economy"
	},

	{	:title => "Welcome To America: The Immigration Backlash",
		:description => "GROWING EVIDENCE OF SAMPER'S LINKS WITH CALI CARTEL BOGOTA, OCTOBER 1, 1995 Government raids in August that led to the arrests of top leaders of the Cali cartel yielded further evidence linking contri- butions from the cartel to Ernesto Samper's presidential campaign. While Samper point- ed to the arrests as proof of his will to fight the country's drug lords, documents found in the raid revealed that his campaign treasurer Santiago Medina had accepted a $50,000 check from a company known to be a front for the Cali cartel.",
		:publication_date => '1-Dec-1995',
		:tags => "immigration, campaign"
	}
]

articles.each do |article|
  Article.create!(article)
end