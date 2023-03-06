# frozen_string_literal: true

require 'administrate/base_dashboard'

# Dashboard for beer
class BeerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beer_daily_data_points: Field::HasMany,
    beer_hourly_data_points: Field::HasMany,
    description: Field::Text,
    id: Field::Number,
    start_date: Field::Date,
    bottle_date: Field::Date,
    ready_date: Field::Date,
    name: Field::String,
    tilt_name: Field::String,
    kind: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    recipe: ::RichTextAreaField
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [:id, :kind, :name, :start_date].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [:id, :tilt_name, :name, :kind, :start_date, :bottle_date, :ready_date, :recipe, :beer_daily_data_points,
                          :beer_hourly_data_points, :created_at, :updated_at].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [:tilt_name, :name, :kind, :description, :recipe, :start_date, :bottle_date, :ready_date].freeze

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
    name: ->(resources) { resources.where('name ILIKE ?', "%#{params[:name]}%") },
    kind: ->(resources) { resources.where('kind ILIKE ?', "%#{params[:kind]}%") },
  }.freeze

  # Overwrite this method to customize how beers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(beer)
    beer.name
  end
end
