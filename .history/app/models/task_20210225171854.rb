class Task < ApplicationRecord
    validates :name, :note, presence: true
    def self.search(search)
        search ? where('name, note LIKE ?', "%#{search}%") : all
    end
end
