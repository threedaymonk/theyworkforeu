class Contribution < ActiveRecord::Base
  belongs_to :person
  belongs_to :section
  belongs_to :language

  named_scope :untranslated, :conditions => {:translated_text => nil}
end
