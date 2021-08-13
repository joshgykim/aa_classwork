require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :description, presence: true
    validates :sex, presence: true
    validates_length_of :sex, :is => 1

    def age
        Date.today.year - birth_date.year
    end
    
end
