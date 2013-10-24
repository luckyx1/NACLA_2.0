# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

documents = [	{:title => 'Brazilian Colonialism', :description => 'Colonialism of Brazil between 1800-1900', :publication_date => '20-Sep-2010', :tags => 'Brazil, colonialism'},
    	  			{:title => 'Modern Politics of Chile', :description => 'The political climate of modern day Chile', :publication_date => '2-Apr-2011', :tags => 'republic, election'},
    	  			{:title => 'Drug Cartels, Mexico', :description => 'The history of drug cartels in Mexico', :publication_date => '14-Dec-2003 ', :tags => 'drugs, war'}
    	  		]

documents.each do |document|
  Document.create!(document)
end