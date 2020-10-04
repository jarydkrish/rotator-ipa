# frozen_string_literal: true

# Base for all records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
