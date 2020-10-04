# frozen_string_literal: true

require 'administrate/field/base'

# Simple wrapper around a text field
class RichTextAreaField < Administrate::Field::Base
  def to_s
    data
  end
end
