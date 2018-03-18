require "rails_helper"

RSpec.describe "adding a new task" do
  let!(:project) { create(:project, name: "Project Bluebook") }
  let!(:task_1) { create(
    :task, project: project, title: "Search Sky", size: 1, project_order: 1) }
  let!(:task_2) { create(
    :task, project: project, title: "Use Telescope", size: 1,
           project_order: 2) }
  let!(:task_3) { create(
    :task, project: project, title: "Take Notes", size: 1,
           project_order: 3) }

  it "can re-order a task", :js do
    visit(project_path(project))
    expect(page).to have_selector("tbody tr:nth-child(3) td.name", text: "Take Notes")
    within("#task_3") do
      click_on("Up")
    end
    expect(page).to have_selector("tbody tr:nth-child(2) td.name", text: "Take Notes")
  end

end
