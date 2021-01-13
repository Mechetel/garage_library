# frozen_string_literal: true

class Book
  attr_reader :title, :author, :description

  def initialize(title:, author:, description: '')
    valid_title?(title)
    valid_author?(author)
    @title = title
    @author = author
    @description = description
  end

  def to_s
    "Book { #{@name} by #{@author.name}. #{@description} }"
  end

  private

  def valid_title?(title)
    raise IncorrectClassError, String unless title.is_a?(String)
    raise InvalidLengthError, 'positive' unless title.length.positive?
  end

  def valid_author?(author)
    raise IncorrectClassError, Author unless author.is_a?(Author)
  end

  def valid_description?(description)
    raise InvalidLengthError, 'positive' unless description.length.positive?
    raise IncorrectClassError, String unless description.is_a?(String)
  end
end
