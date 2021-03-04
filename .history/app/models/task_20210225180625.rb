class Task < ApplicationRecord
    validates :name, :note, presence: true
    def self.with_title(title)
    # binding.irb
        title ? where('name LIKE ?', "%#{title}%") : all
    end
    # scope :with_title, -> (title) do
    #     next if title.blank?
    #     where("name Like ?", "%#{title}%")
    # end
end
