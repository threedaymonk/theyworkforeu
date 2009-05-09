class Sitting < ActiveRecord::Base
  has_many :contributions, :order => "contributions.id ASC"

  def title
    "#{sat_on.strftime("%d %b %Y")} - #{location}"
  end

end
