namespace :disney_importer do
  task run: :environment do
    Scraping::DisneyLand.run
    Scraping::DisneySea.run
  end
end
