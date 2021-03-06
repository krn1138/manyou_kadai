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
    validate_admin_last_update
  end

  def validate_destroy
    validate_admin_last
  end

  def validate_admin_last
    throw(:abort) if self.admin && User.where(admin: true).length == 1
    flash[:notice] = "削除できませんでした"
  end

  def validate_admin_last_update
    throw(:abort) if !self.admin && self.admin_was && User.where(admin: true).length == 1
    session[:admin_user_id] = admin_user.id
    redirect_to admin_user_path, flash[:notice] = "更新できません"
  end
end
