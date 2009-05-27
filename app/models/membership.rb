class Membership < ActiveRecord::Base
  belongs_to :parliament
  belongs_to :person
  belongs_to :party
end
