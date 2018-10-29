require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :year => 2,
        :plot_summary => "Plot Summary",
        :gross_takings => "9.99",
        :available_on_dvd => false
      ),
      Movie.create!(
        :title => "Title",
        :year => 2,
        :plot_summary => "Plot Summary",
        :gross_takings => "9.99",
        :available_on_dvd => false
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Plot Summary".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
