class Member < ActiveRecord::Base
  has_many :contributions, :order => "contributions.id ASC"
end
