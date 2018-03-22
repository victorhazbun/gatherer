RSpec::Matchers.define :be_able_to_see do |*projects|
  match do |user|
    expect(user.visible_projects).to eq(projects)
    projects.all? { |p| expect(user.can_view?(p)).to be_truthy }
    (all_projects - projects).all? do |p|
      expect(user.can_view?(p)).to be_falsy
    end
  end
end