class Task < ApplicationRecord
    validates :name, :note, presence: true
end
