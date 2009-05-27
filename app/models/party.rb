class Party < ActiveRecord::Base
  has_many :affiliations
  has_many :memberships
  belongs_to :country
end
