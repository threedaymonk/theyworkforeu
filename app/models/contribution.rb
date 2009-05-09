class Contribution < ActiveRecord::Base
  belongs_to :member
  belongs_to :sitting
end
