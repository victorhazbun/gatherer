require "rails_helper"

RSpec.describe User, type: :model do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  describe "visibility" do
    let(:user) { create(
      :user, email: "user@example.com", password: "password") }
    let(:project_1) { create(:project, name: "Project 1") }
    let(:project_2) { create(:project, name: "Project 2") }
    let(:all_projects) { [project_1, project_2] }

    it "a user can see their projects" do
      user.projects << project_1
      expect(user).to be_able_to_see(project_1)
    end

    it "an admin can see all projects" do
      user.admin = true
      expect(user).to be_able_to_see(project_1, project_2)
    end

    it "a user can see public projects" do
      user.projects << project_1
      project_2.update_attributes(public: true)
      expect(user).to be_able_to_see(project_1, project_2)
    end

    it "no dupes in project list" do
      user.projects << project_1
      project_1.update_attributes(public: true)
      expect(user).to be_able_to_see(project_1)
    end

  end
end
