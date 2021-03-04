class Task < ApplicationRecord
    validates :name, :note, presence: true
    def self.search(search)
        search ? where('title LIKE ?', "%#{search}%") : all
    end
end
