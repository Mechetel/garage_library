# frozen_string_literal: true

class Reader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    valid_name?(name)
    valid_email?(email)
    valid_city?(city)
    valid_street?(street)
    valid_house?(house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "Reader { #{@name}, city: #{@city}, street: #{@street}, house: #{@house}, email: #{@email} }"
  end

  private

  def valid_name?(name)
    raise InvalidLengthError, 'positive' unless name.length.positive?
    raise IncorrectClassError, String unless name.is_a?(String)
  end

  def valid_email?(email)
    raise InvalidValueError.new('email', 'like example@gmail.com') unless email[VALID_EMAIL_REGEX]
    raise IncorrectClassError, String unless email.is_a?(String)
  end

  def valid_city?(city)
    raise IncorrectClassError, String unless city.is_a?(String)
  end

  def valid_street?(street)
    raise IncorrectClassError, String unless street.is_a?(String)
  end

  def valid_house?(house)
    raise IncorrectClassError, Integer unless house.is_a?(Integer)
  end
end
