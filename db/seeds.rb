# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#users = User.create([{
#                        :email => "admin@sumbar.com",
#                        :password => "password",
#                        :password_confirmation => "password"
#                   }])

why_sumbars = WhySumbar.create([
    {
      :title => "Aliquam tincidunt mauris eu risus.",
      :description => "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede."
    }
])
