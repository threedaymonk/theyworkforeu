class Member < ActiveRecord::Base
  has_many :contributions, :order => "contributions.id ASC"
  named_scope :unscraped, :conditions => {:country => nil}

  def euparl_id
    photo[/(\d+)\.jpg/, 1].to_i
  end

  def country_name
    Country.expand(country)
  end
end
