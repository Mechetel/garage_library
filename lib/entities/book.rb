# frozen_string_literal: true

class Book
  include Validator

  attr_reader :title, :author

  def initialize(title:, author:)
    check_class(title, String)
    check_class(author, Author)
    check_not_empty(title)
    @title = title
    @author = author
  end
end
