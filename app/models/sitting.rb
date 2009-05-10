class Sitting < ActiveRecord::Base
  has_many :contributions, :order => "contributions.id ASC"

  def title
    "#{sat_on.strftime("%d %b %Y")} - #{location}"
  end

  def full_translated_text
    self.contributions.find(:all, :select=>'translated_text', :order=>'id').map { |x| x.translated_text }
  end

end
