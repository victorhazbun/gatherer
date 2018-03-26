class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :roles, dependent: :destroy
  has_many :projects, through: :roles
  has_many :tasks, through: :nullify

  def can_view?(project)
    project.in?(visible_projects)
  end

  def visible_projects
    return Project.all if admin?
    Project.where(id: project_ids).or(Project.all_public)
  end

  def avatar_url
    adapter = AvatarAdapter.new(self)
    adapter.image_url
  end

  def attributes
    super.merge({avatar_url: avatar_url})
  end
end