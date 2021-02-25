class Task < ApplicationRecord
    validates :name, :note, presence: true
    # def self.search(search)
    # # binding.irb
    #     search ? where('name LIKE ?', "%#{search}%") : all
    # end
    scope :with_title, -> (title) do
        next if title.blank?
        where("title Like ?", "%#{title}%")
    end
end
