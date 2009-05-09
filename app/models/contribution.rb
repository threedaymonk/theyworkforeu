class Contribution < ActiveRecord::Base
  has_one :member
  belongs_to :sitting
end
