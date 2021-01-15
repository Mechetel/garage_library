# frozen_string_literal: true

module Validator
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  DEFAULT_ARG_RANGE = (3..70).freeze

  def arg_is_positive(arg)
    raise InvalidLengthError, 'positive' unless arg.length.positive?
  end

  def arg_is_in_range(arg)
    raise InvalidLengthError, DEFAULT_ARG_RANGE unless DEFAULT_ARG_RANGE.include?(arg.length)
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
