require 'spec_helper'

describe 'users/show' do
  let(:user) { build(:user, id: 123) }

  it 'should render successfully' do
    allow(view).to receive_messages(current_user: user, user: user)

    render
  end
end
