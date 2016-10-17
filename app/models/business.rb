class Business < ActiveRecord::Base
  belongs_to :user
  belongs_to :business_type
end
