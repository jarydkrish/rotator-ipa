class UpdateBeerHourlyDataPoints < ActiveRecord::Migration[6.1]
  def change
    reversible do |direction|
      direction.up do
        Hydrometer.all.find_each do |hydrometer|
          hydrometer.beers.find_each do |beer|
            carboy = Carboy.where(beer: beer, hydrometer: hydrometer).first_or_create
            hourly_data_points = BeerHourlyDataPoint.where(beer: beer, hydrometer: hydrometer)
            hourly_data_points.update_all(carboy_id: carboy.id)
          end
        end
      end
    end
  end
end
