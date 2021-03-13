class Task < ApplicationRecord
    belongs_to :user
    has_many :task_labels, dependent: :destroy, foreign_key: 'task_id'
    has_many :test, through: :task_labels, source: :label

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
    
    validates :name, :note, presence: true
end
