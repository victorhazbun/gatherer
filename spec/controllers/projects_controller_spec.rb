require "rails_helper"

RSpec.describe ProjectsController, type: :controller do

  describe "create" do
    let(:attributes) { {name: "Runway", task_string: "start something:2"} }
    it "calls the workflow" do
      workflow = double("CreatesProject", create: true)
      allow(CreatesProject).to receive(:new).with(attributes).and_return(workflow)
      post :create,
        params: {project: {name: attributes[:name], tasks: attributes[:task_string]}}
      expect(workflow).to have_received(:create)
    end

  end

end
