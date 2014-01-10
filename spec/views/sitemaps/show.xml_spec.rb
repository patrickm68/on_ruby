require "spec_helper"

describe "sitemaps/show" do
  let(:example_urls) { ['url1', 'url2'] }

  it "should render successfully" do
    view.stub(urls: example_urls)

    render
  end
end
