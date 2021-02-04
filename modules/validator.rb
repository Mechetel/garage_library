# frozen_string_literal: true

module Validator
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  def check_not_empty(*args)
    args.each do |arg|
      raise InvalidLengthError, 'not empty' if arg.empty?
    end
  end

  def check_is_positive(arg)
    raise InvalidValueError.new('house', 'should be positive') if arg <= 0
  end

  def email_is_valid(email)
    raise InvalidValueError.new('email', 'like example@gmail.com') unless email[VALID_EMAIL_REGEX]
  end

  def check_class(*args, class_name)
    args.each do |arg|
      raise IncorrectClassError, class_name unless arg.is_a?(class_name)
    end
  end
end
