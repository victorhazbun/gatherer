require "rails_helper"

RSpec.describe "task requests" do
  let(:project) { create(:project, name: "Project Bluebook") }
  let(:task) { create(:task, title: "Learn how to test mailers", size: 3) }
  let(:user) { create(:user) }

  before(:example) do
    ActionMailer::Base.deliveries.clear
    sign_in(user)
  end

  describe "task completed email delivery" do
    it "does not send an email if a task is not completed" do
      patch(task_path(id: task.id), params: {task: {completed: false}})
      expect(ActionMailer::Base.deliveries.size).to eq(0)
    end

    it "sends email when task is completed" do
      patch(task_path(id: task.id), params: {task: {completed: true}})
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.first
      expect(email.subject).to eq("A task has been completed")
      expect(email.to).to eq(["monitor@tasks.com"])
      expect(email.body.to_s).to match(/Learn how to test mailers/)
    end
  end

  describe "creation" do
    before(:example) do
      sign_in(user)
    end

    it "can add a task to a project the user can see" do
      create(:role, user: user, project: project)
      post(tasks_path, params: {task: {name: "New Task", size: "3", project_id: project.id}})
      expect(request).to redirect_to(project_path(project))
    end

    it "can not add a task to a project the user can see" do
      post(tasks_path, params: {task: {name: "New Task", size: "3", project_id: project.id}})
      expect(request).to redirect_to(new_user_session_path)
    end
  end

end
