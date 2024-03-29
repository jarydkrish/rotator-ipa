# frozen_string_literal: true

require 'administrate/base_dashboard'

# Dashboard for beer hourly datapoints
class BeerHourlyDataPointDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beer: Field::BelongsTo,
    carboy: Field::BelongsTo,
    hydrometer: Field::BelongsTo,
    id: Field::Number,
    temperature: Field::String.with_options(searchable: false),
    specific_gravity: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [:id, :beer, :hydrometer, :carboy, :temperature, :specific_gravity].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [:id, :beer, :hydrometer, :carboy, :temperature, :specific_gravity, :created_at, :updated_at].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [:beer, :carboy, :hydrometer, :temperature, :specific_gravity].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {
    beer: ->(resources) { resources.where(beer:) }
  }.freeze

  # Overwrite this method to customize how beer hourly data points are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(beer_hourly_data_point)
    "#{beer_hourly_data_point.beer.name} #{beer_hourly_data_point.created_at}"
  end
end
