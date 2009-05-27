class Affiliation < ActiveRecord::Base
  belongs_to :parliament
  belongs_to :grouping
  belongs_to :party
end
