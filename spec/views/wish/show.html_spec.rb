require "spec_helper"

describe "wishes/show" do

  let(:wish) { build(:wish) }

  it "should render successfully" do
    view.stubs(wish: wish, signed_in?: false)
    render
  end

end
