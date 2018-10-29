require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "Title",
      :year => 2,
      :plot_summary => "Plot Summary",
      :gross_takings => "9.99",
      :available_on_dvd => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Plot Summary/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
  end
end
