class Debate < ActiveRecord::Base
  belongs_to :parliament
  has_many :sections, :order => "sections.id ASC"
  has_many :term_occurrences
  has_many :terms, :through => :term_occurrences
end
