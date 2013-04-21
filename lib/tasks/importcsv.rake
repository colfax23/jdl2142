#lib/tasks/importcsv.rake
require 'csv'
desc "Imports a CSV file into table"
namespace :importcsv do
  task :seed_courses => :environment do
    Mongoid.purge!
    csv_text = File.open("#{Rails.root}/public/courses.csv") #open or read?
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Course.create!(row.to_hash)
    end
  end
end