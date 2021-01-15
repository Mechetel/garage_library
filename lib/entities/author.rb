# frozen_string_literal: true

class Author
  include Validator

  attr_reader :name, :bio

  def initialize(name:, bio: '')
    arg_is_a_class_of(name, bio, String)
    arg_is_not_empty(name)
    @name = name
    @bio = bio
  end

  def to_s
    "Author { #{@name}, #{@bio} }"
  end
end
