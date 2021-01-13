# frozen_string_literal: true

class Book
  attr_reader :title, :author

  def initialize(title:, author:)
    valid_title?(title)
    valid_author?(author)
    @title = title
    @author = author
  end

  def to_s
    "Book { #{@title} by #{@author.name} }"
  end

  private

  def valid_title?(title)
    raise IncorrectClassError, String unless title.is_a?(String)
    raise InvalidLengthError, 'positive' unless title.length.positive?
  end

  def valid_author?(author)
    raise IncorrectClassError, Author unless author.is_a?(Author)
  end
end
