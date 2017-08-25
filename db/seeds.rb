# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.destroy_all
Authorship.destroy_all
Book.destroy_all

50.times do
  Book.create!(title: Faker::Book.title.downcase,
               genre: Faker::Book.genre.downcase,
               classification: Book.classifications.sample.downcase,
               booktype: Book.booktypes.sample.downcase,
               year: Faker::Number.between(1950, 2017))
end

25.times do
  Author.create!(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 age: Faker::Number.between(18, 109))
end

@books = Book.all
@author_ids = Author.pluck(:id)

@books.each do | book |
  Authorship.create!(author_id: @author_ids.sample, book_id: book.id)
end
