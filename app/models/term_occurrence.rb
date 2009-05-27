class TermOccurrence < ActiveRecord::Base
  belongs_to :term
  belongs_to :debate
end
