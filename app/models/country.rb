class Country < ActiveRecord::Base
  has_many :parties
  has_many :people
end
