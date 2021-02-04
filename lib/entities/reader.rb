# frozen_string_literal: true

class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    check_class(name, email, city, street, String)
    check_class(house, Integer)
    check_not_empty(name, email, city, street)
    check_is_positive(house)
    email_is_valid(email)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
