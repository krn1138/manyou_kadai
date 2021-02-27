class Task < ApplicationRecord
    validates :name, :note, presence: true
    # def self.with_title(title)
    # # binding.irb
    #     title ? where('name LIKE ?', "%#{title}%") : all
    # end
    scope :with_title, -> (karen) do
        next if karen.blank?
        where("name Like ?", "%#{karen}%")
    end

    scope :with_choice, -> (choices) do
        next if choices.blank?
        where("status Like ?", "#{choices}")
    end

    enum status: {
        未着手:1, 着手中:2, 完了:3
    
  }
end
