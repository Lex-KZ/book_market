class Book < ApplicationRecord
    validates :title, presence: true
    validates :author_first_name, presence: true
    validates :author_last_name, presence: true
    validates :pub_year, presence: true, numericality: { only_integer: true }
    validates :blurb, presence: true
    validates :physical_description, presence: true
    validates :cost, presence: true

    belongs_to :user

    has_one_attached :picture

    def author_full_name
        [ self.author_first_name, self.author_last_name ].join(' ')
    end


end
