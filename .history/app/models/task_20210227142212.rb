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
        # binding.irb
        next if choices.blank?
        where(status: choices)
    end

    # scope :mix_scope -> (params) { with_title(params).with_choice(params) }

    enum status: {
        未着手:1, 着手中:2, 完了:3
    }

    enum choice: {
        高:1, 中:2, 低:3
    }   
end
