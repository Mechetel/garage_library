# frozen_string_literal: true

class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    arg_is_a_class_of(name, email, city, street, String)
    arg_is_a_class_of(house, Integer)
    arg_is_positive(house)
    email_is_valid(email)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "Reader { #{@name}, city: #{@city}, street: #{@street}, house: #{@house}, email: #{@email} }"
  end
end
