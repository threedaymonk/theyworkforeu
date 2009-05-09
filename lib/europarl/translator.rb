require "cgi"
require "uri"
require "net/http"
require "json"

module Europarl
  class Translator
    # Taken from http://ruby.geraldbauer.ca/google-translation-api.html
    # See also http://code.google.com/apis/ajaxlanguage/documentation/reference.html

    ENDPOINT = "http://ajax.googleapis.com/ajax/services/language/translate"

    def self.translate(text, to="en", from="")
      params = {
        :langpair => "#{from}|#{to}",
        :q        => text,
        :v        => 1.0
      }
      response = Net::HTTP.post_form( URI.parse(ENDPOINT), params )
      json     = JSON.parse( response.body )

      unless json["responseStatus"] == 200
        raise StandardError, response["responseDetails"]
      end

      json["responseData"]["translatedText"]
    end
  end
end
