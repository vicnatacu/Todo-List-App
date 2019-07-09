class Item < ApplicationRecord
    belongs_to :user
    validates :details, uniqueness: true
    validates :details, presence: true

    def index
    end
end
