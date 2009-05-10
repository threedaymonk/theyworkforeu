class Member < ActiveRecord::Base
  has_many :contributions, :order => "contributions.id ASC"
  has_many :sittings, :through=>:contributions, :order => "sittings.sat_on DESC"
  before_save :set_sorting_name

  named_scope :unscraped, :conditions => {:country => nil}

  def euparl_id
    photo[/(\d+)\.jpg/, 1].to_i
  end

  def euparl_url
    "http://www.europarl.europa.eu/members/public/geoSearch/view.do?id=#{euparl_id}"
  end

  def country_name
    Country.expand(country)
  end

  def flag_path
    "/images/flags/#{ self.country }.gif"
  end

  def sorting_letter
    sorting_name[0,1]
  end

private

  def set_sorting_name
    self.sorting_name = ActiveSupport::Inflector.transliterate(name).scan(/[A-Z]{2,}/).join(" ")
  end
end
