require 'administrate/base_dashboard'

class BeerDailyDataPointDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    beer: Field::BelongsTo,
    id: Field::Number,
    date: Field::Date,
    min_temperature: Field::String.with_options(searchable: false),
    max_temperature: Field::String.with_options(searchable: false),
    avg_temperature: Field::String.with_options(searchable: false),
    max_specific_gravity: Field::String.with_options(searchable: false),
    min_specific_gravity: Field::String.with_options(searchable: false),
    avg_specific_gravity: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [:id, :date, :beer].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [:beer, :id, :date, :min_temperature, :max_temperature, :avg_temperature, :max_specific_gravity, :min_specific_gravity, :avg_specific_gravity, :created_at, :updated_at].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [:beer, :date, :min_temperature, :max_temperature, :avg_temperature, :max_specific_gravity, :min_specific_gravity, :avg_specific_gravity].freeze

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
    beer: ->(resources) { resources.where(beer: beer) }
  }.freeze

  # Overwrite this method to customize how beer daily data points are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(beer_daily_data_point)
    "#{beer_daily_data_point.beer.name} #{beer_daily_data_point.date}"
  end
end
