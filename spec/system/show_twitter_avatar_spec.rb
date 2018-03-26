require "rails_helper"

RSpec.describe "task display" do

  let(:project) { create(:project, name: "Project Bluebook") }
  let(:user) { create(:user, twitter_handle: "victorhazbun") }
  let!(:task) { create(:task, project: project, user: user, completed_at: 1.hour.ago, project_order: 1) }
  let(:fake_adapter) { instance_double(AvatarAdapter) }
  let(:image_url) { "http://pbs.twimg.com/profile_images/935204734050463745/JcNp7zAf_bigger.jpg" }

  before(:example) do
    allow(AvatarAdapter).to receive(:new).with(user).and_return(fake_adapter)
    allow(fake_adapter).to receive(:image_url).and_return(image_url)
    project.roles.create(user: user)
    sign_in(user)
  end

  it "shows a gravatar", :js do
    visit project_path(project)
    within("#task_1") do
      expect(page).to have_selector(".completed", text: task.completed_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ"))
      expect(page).to have_selector("img[src='#{image_url}']")
    end
  end

end