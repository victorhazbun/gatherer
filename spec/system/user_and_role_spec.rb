require "rails_helper"

RSpec.describe "with users and roles" do

  let(:user) { create(:user, email: "test@example.com", password: "password") }

  it "allows a logged-in user to view the project index page" do
    sign_in(user)
    visit(projects_path)
    expect(current_path).to eq(projects_path)
  end

  it "does not allow a user to see the project page if not logged in" do
    visit(projects_path)
    expect(current_path).to eq(user_session_path)
  end

  describe "roles" do

    let(:user) { create(:user) }
    let(:project) { create(:project, name: "Project Gutenberg") }

    it "allows a user who is part of a project to see that project" do
      project.roles.create(user: user)
      sign_in(user)
      visit(project_path(project))
      expect(current_path).to eq(project_path(project))
    end

    it "doesn't allow a user who is not part of a project to see the project" do
      sign_in(user)
      visit(project_path(project))
      expect(current_path).not_to eq(project_path(project))
    end

  end

end
