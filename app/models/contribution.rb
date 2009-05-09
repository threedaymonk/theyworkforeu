class Contribution < ActiveRecord::Base
  belongs_to :member
  belongs_to :sitting

  named_scope :untranslated, :conditions => {:translated_text => nil}
end
