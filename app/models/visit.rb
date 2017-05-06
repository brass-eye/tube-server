class Visit < ApplicationRecord
  belongs_to :station

  def as_json(options={})
    super(
        only: [:visit_date, :station_id]
    )
  end
end
