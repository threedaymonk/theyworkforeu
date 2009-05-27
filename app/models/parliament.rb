class Parliament < ActiveRecord::Base
  has_many :affiliations
  has_many :debates, :order => "debates.sat_on ASC"
  has_many :memberships
end
