class Job < ActiveRecord::Base
  belongs_to :users
  belongs_to :job_types
  validates :job_type_id, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true
  # validates :state, presence: true
  validates :country, presence: true

  geocoded_by :address
  after_validation :geocode



  def address
    [suburb, state, postcode, country].compact.join(', ')
  end



end
