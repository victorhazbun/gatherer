require "rails_helper"

RSpec.describe User, type: :model do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  it "cannot view a project it is not a part of" do
    expect(user.can_view?(project)).to be_falsy
  end

  it "can view a project it is a part of" do
    Role.create(user: user, project: project)
    expect(user.can_view?(project)).to be_truthy
  end
end