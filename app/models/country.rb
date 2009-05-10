class Country
  MAPPING = {
    "at" => "Austria",
    "be" => "Belgium",
    "bg" => "Bulgaria",
    "cy" => "Cyprus",
    "cz" => "Czech Republic",
    "de" => "Germany",
    "dk" => "Denmark",
    "ee" => "Estonia",
    "es" => "Spain",
    "fi" => "Finland",
    "fr" => "France",
    "gb" => "United Kingdom",
    "gi" => "Gibraltar",
    "gr" => "Greece",
    "hu" => "Hungary",
    "ie" => "Ireland",
    "it" => "Italy",
    "lt" => "Lithuania",
    "lu" => "Luxembourg",
    "lv" => "Latvia",
    "mt" => "Malta",
    "nl" => "Netherlands",
    "pl" => "Poland",
    "pt" => "Portugal",
    "ro" => "Romania",
    "se" => "Sweden",
    "si" => "Slovenia",
    "sk" => "Slovakia",
  }
  def self.expand(short)
    MAPPING[short]
  end
end
