class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }
                    # format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  before_update :validate_update
  before_destroy :validate_destroy
  validates :password, presence: true, length: { minimum: 6 }

  private
  def validate_update
    validate_admin_nothing
  end

  def validate_destroy
    validate_admin_nothing
  end

  def validate_admin_nothing
    throw(:abort)
  end
end
