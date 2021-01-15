# frozen_string_literal: true

module Validator
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  def arg_is_not_empty(arg)
    raise InvalidLengthError, 'not empty' if arg.empty?
  end

  def arg_is_positive(arg)
    raise InvalidValueError.new('house', 'should be positive') if arg <= 0
  end

  def email_is_valid(email)
    raise InvalidValueError.new('email', 'like example@gmail.com') unless email[VALID_EMAIL_REGEX]
  end

  def arg_is_a_class_of(*args, class_name)
    args.each do |arg|
      raise IncorrectClassError, class_name unless arg.is_a?(class_name)
    end
  end
end
