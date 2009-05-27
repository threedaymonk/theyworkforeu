class Person < ActiveRecord::Base
  has_many :memberships
  has_many :contributions
  belongs_to :country

  before_save :set_sorting_name

  def sorting_letter
    sorting_name[0,1]
  end

private

  def set_sorting_name
    self.sorting_name = ActiveSupport::Inflector.transliterate(name).scan(/[A-Z]{2,}/).join(" ")
  end
end
