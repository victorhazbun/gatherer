Given(/^a project with two tasks$/) do
  @project = Project.create(name: "Bluebook")
  @project.tasks.create(title: "Hunt the aliens", size: 1, project_order: 1)
  @project.tasks.create(title: "Write a book", size: 1, project_order: 2)
end

When(/^I visit the project page$/) do
  visit project_path(@project)
end

When(/^I complete the new task form$/) do
  fill_in("Task", with: "Find UFOs")
  select("2", from: "Size")
  click_on("Add Task")
end

Then(/^I see the middle task is in the list$/) do
  expect(page).to have_selector("tbody tr:nth-child(2) td.name", text: "Write a book")
end


Then(/^I see the new task is last in the list$/) do
  within("#task_3") do
    expect(page).to have_selector(".name", text: "Find UFOs")
    expect(page).to have_selector(".size", text: "2")
    expect(page).not_to have_selector("a", text: "Down")
  end
end

When(/^I click to move the new task up$/) do
  within("#task_3") do
    click_on("Up")
  end
end

Then(/^the new task is in the middle of the list$/) do
  expect(page).to have_selector("tbody:nth-child(2) .name", text: "Find UFOs")
end
