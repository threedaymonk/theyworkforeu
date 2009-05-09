Factory.define :sitting do |f|
  f.sat_on Date.today
  f.location "Strasbourg"
end

Factory.define :contribution do |f|
  f.association :sitting
  f.association :member
  f.original_text "Original Text"
  f.translated_text "Translated Text"
end

Factory.define :member do |f|
  f.sequence :name do |n|
    "Member #{n}"
  end
  f.photo "http://example.com/"
end
