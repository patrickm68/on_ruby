require 'spec_helper'

describe 'topics/show' do
  let(:topic) { build(:topic) }

  it 'should render successfully' do
    allow(view).to receive_messages(topic: topic, signed_in?: false, likes: '</>')

    render
  end

  context 'materials' do
    let(:materials) { [build(:material)] }

    it 'renders without an error' do
      render partial: 'materials', locals: { materials: materials }
    end
  end
end
