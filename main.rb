#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'modules/autoload'
require 'faker'

puts 'First, I will create library for you with readers and books'

readers = []
authors = []
books   = []
orders  = []

begin
  10.times do
    readers << Reader.new(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city,
                          street: Faker::Address.street_name, house: Faker::Number.within(range: 1..30))
    authors << Author.new(name: Faker::Book.author, bio: Faker::Lorem.sentence(word_count: 3))
    books   << Book.new(title: Faker::Book.title, author: authors.sample)
    orders  << Order.new(reader: readers.sample, book: books.sample, date: Date.today - rand(1..100))
  end
rescue IncorrectClassError, InvalidLengthError, InvalidValueError => e
  puts e.message
end

library = Library.new(authors: authors, books: books, readers: readers, orders: orders)

puts library

library.save

puts 'Lets see what we have'
puts "    #{library.best_reader(1)} is most often takes books"
puts "    #{library.bestseller(1)} is most popular book"
puts "    3 most popular book titles: #{library.top_books(3).map(&:title).join(', ')}"

puts 'Also I can save library to file and load from it'
