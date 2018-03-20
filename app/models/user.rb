class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :roles, dependent: :destroy
  has_many :projects, through: :roles

  def can_view?(project)
    project.in?(projects)
  end
end
