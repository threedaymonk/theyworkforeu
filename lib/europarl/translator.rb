require "cgi"
require "uri"
require "net/http"
require "json"

module Europarl
  class Translator
    # Taken from http://ruby.geraldbauer.ca/google-translation-api.html
    # See also http://code.google.com/apis/ajaxlanguage/documentation/reference.html

    ENDPOINT = "http://ajax.googleapis.com/ajax/services/language/translate"
    MAX_LENGTH = 4000

    def self.translate(text, to="en", from="")
      paragraphs = text.split(/\n/)
      chunks = [[]]
      paragraphs.each do |paragraph|
        if (chunks.last + [paragraph]).join("\n").length < MAX_LENGTH
          chunks.last << paragraph
        else
          chunks << [paragraph]
        end
      end
      chunks.map{ |chunk|
        real_translate(chunk.join("\n"))
      }.join("\n")
    end

    def self.real_translate(text, to="en", from="")
      params = {
        :langpair => "#{from}|#{to}",
        :q        => text,
        :v        => 1.0
      }
      response = Net::HTTP.post_form( URI.parse(ENDPOINT), params )
      json     = JSON.parse( response.body )

      unless json["responseStatus"] == 200
        raise StandardError, response.body #response["responseDetails"]
      end

      json["responseData"]["translatedText"]
    end
  end
end
