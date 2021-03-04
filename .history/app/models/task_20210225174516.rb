class Task < ApplicationRecord
    validates :name, :note, presence: true
    def self.search(search)
        task ? where('name LIKE ?', "%#{search}%") : all
    end
end
