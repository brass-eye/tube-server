class Station < ApplicationRecord
  validates :name, :code, presence: true
  has_many :visits

  def as_json(options={})
    super(
        only: [:id, :code, :name],
        include: [:visits => {
            only: :visit_date
        }]
    )
  end
end
