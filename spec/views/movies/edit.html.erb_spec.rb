require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "MyString",
      :year => 1,
      :plot_summary => "MyString",
      :gross_takings => "9.99",
      :available_on_dvd => false
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[year]"

      assert_select "input[name=?]", "movie[plot_summary]"

      assert_select "input[name=?]", "movie[gross_takings]"

      assert_select "input[name=?]", "movie[available_on_dvd]"
    end
  end
end
