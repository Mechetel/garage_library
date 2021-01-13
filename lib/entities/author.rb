# frozen_string_literal: true

class Author
  DEFAULT_NAME_RANGE = (3..70).freeze

  attr_reader :name, :bio

  def initialize(name:, bio: '')
    valid_name?(name)
    @name = name
    @bio = bio
  end

  def to_s
    "Author { #{@name}, #{@year}. #{@bio} }"
  end

  private

  def valid_name?(name)
    raise InvalidLengthError, DEFAULT_NAME_RANGE unless DEFAULT_NAME_RANGE.include?(name.length)
    raise IncorrectClassError, String unless name.is_a?(String)
  end

  def valid_bio?(bio)
    raise IncorrectClassError, String unless bio.is_a?(String)
  end
end
