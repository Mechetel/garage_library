#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'modules/autoload'

puts 'First, I will create library for you with readers and books'

readers = []
authors = []
books   = []
orders  = []

begin
  3.times do
    readers << Reader.new(name: Faker::Name.name, email: Faker::Internet.email, city: Faker::Address.city,
                          street: Faker::Address.street_name, house: Faker::Number.within(range: 1..30))
    authors << Author.new(name: Faker::Book.author, biography: Faker::Lorem.sentence(word_count: 3))
    books   << Book.new(title: Faker::Book.title, author: authors.sample)
    orders  << Order.new(reader: readers.sample, book: books.sample, date: Date.today - rand(1..100))
  end
rescue IncorrectClassError, InvalidLengthError, InvalidValueError => e
  puts e.message
end

library = Library.new
library << readers
library << authors
library << books
library << orders

puts 'I can save library to file and load from it'
library.save('db/data.yaml')

puts 'Lets see what we have'
puts "    #{library.best_reader} is most often takes books"
puts "    #{library.bestseller} is most popular book"
puts "    Number of the 3 most popular books readers: #{library.count_of_top_books_readers}"
