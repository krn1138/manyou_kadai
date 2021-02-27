class Task < ApplicationRecord
    validates :name, :note, presence: true
    # def self.with_title(title)
    # # binding.irb
    #     title ? where('name LIKE ?', "%#{title}%") : all
    # end
    scope :with_title, -> (title) do
        next if title.blank?
        where("name Like ?", "%#{title}%")
    end

    scope :with_choice, -> (choices) do
        next if choices.blank?
        where(:choices)
    end

    enum status: {
        未着手:1, 着手中:2, 完了:3
    
  }
end
