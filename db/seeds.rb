# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Level::LEVELS_LIST.each do |l|
  Category.create!([{ level: l, min_weight: 0, max_weight: 48 },
                    { level: l, min_weight: 48.10, max_weight: 52 },
                    { level: l, min_weight: 52.10, max_weight: 56 },
                    { level: l, min_weight: 56.10, max_weight: 60 },
                    { level: l, min_weight: 60.10, max_weight: 65 },
                    { level: l, min_weight: 65.10, max_weight: 70 },
                    { level: l, min_weight: 70.10, max_weight: 75 },
                    { level: l, min_weight: 75.10, max_weight: 80 },
                    { level: l, min_weight: 80.10, max_weight: 85 },
                    { level: l, min_weight: 85.10, max_weight: 90 },
                    { level: l, min_weight: 90.10, max_weight: 500 }])
  Level.create!(name: l)
end
