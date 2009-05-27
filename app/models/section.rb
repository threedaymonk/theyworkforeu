class Section < ActiveRecord::Base
  belongs_to :debate
  belongs_to :language
  has_many :contributions, :order => "contributions.id ASC"
end
