class Language < ActiveRecord::Base
  has_many :contributions
  has_many :sections
end
