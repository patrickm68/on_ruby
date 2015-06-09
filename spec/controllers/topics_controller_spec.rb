require 'spec_helper'

describe TopicsController do
  context "GET :show" do
    let(:topic) { create(:topic) }

    it "renders the action" do
      get :show, id: topic.id
      expect(controller.topic).to eql(topic)
      expect(response).to render_template(:show)
    end
  end

  context "GET :new" do
    let(:user) { build(:user) }

    it "renders the action" do
      allow(controller).to receive_messages(current_user: user)

      get :new
      expect(controller.topic).to_not be_persisted
      expect(response).to render_template(:new)
    end
  end

  context "GET :edit" do
    let(:user) { create(:user) }
    let(:topic) { create(:topic, user: user) }

    it "renders the action" do
      allow(controller).to receive_messages(current_user: user)

      get :edit, id: topic.id
      expect(controller.topic).to be_persisted
      expect(response).to render_template(:edit)
    end
  end

  context "POST :create" do
    let(:user) { create(:user) }
    let(:user_without_email) { create(:user, email: '') }
    let(:topic_data) { attributes_for(:topic) }

    it "should create a topic for logged-in user" do
      allow(controller).to receive_messages(current_user: user)

      expect {
        post(:create, topic: topic_data)
      }.to change(Topic, :count).by(1)
      expect(controller.topic.user).to eql(user)
      expect(flash[:notice]).to_not be_nil
    end

    it "creates a topic and sends user add an email if not present" do
      allow(controller).to receive_messages(current_user: user_without_email)

      expect {
        post(:create, topic: topic_data)
      }.to change(Topic, :count).by(1)
      expect(response).to redirect_to(edit_user_path(user_without_email))
    end

    it "should not create a topic if not signed in" do
      expect {
        post(:create, topic: topic_data)
      }.to change(Topic, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
  end

  context "POST :update" do
    it "authenticates the action" do
      put(:update, id: 123, topic: attributes_for(:topic))
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to_not be_nil
    end

    context "with logged-in user" do
      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let(:admin_user) { create(:admin_user) }
      let(:topic) { create(:topic, user: user) }

      before do
        allow(controller).to receive_messages(current_user: user)
      end

      it "updates a topic" do
        put(:update, id: topic, topic: {name: 'blupp'})
        expect(controller.topic.reload.name).to eql('blupp')
        expect(flash[:notice]).to_not be_nil
      end

      it "updates a topic for admin" do
        allow(controller).to receive_messages(current_user: admin_user)

        put(:update, id: topic, topic: {name: 'zapp'})
        expect(controller.topic.reload.name).to eql('zapp')
      end

      it "does not update a topic for a different user" do
        allow(controller).to receive_messages(current_user: other_user)

        put(:update, id: topic, topic: {name: 'blupp'})
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to_not be_nil
      end
    end
  end
end
