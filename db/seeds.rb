# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Effect.create(:effect_type => "Hue", :amount => 0.5)
Effect.create(:effect_type => "Saturation", :amount => 0.5)
Effect.create(:effect_type => "Brightness", :amount => 0.5)
Effect.create(:effect_type => "Hue", :amount => 1.5)
Effect.create(:effect_type => "Saturation", :amount => 1.5)
Effect.create(:effect_type => "Brightness", :amount => 1.5)