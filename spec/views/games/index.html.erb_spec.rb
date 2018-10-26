require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :title => "Title",
        :desc => "Desc"
      ),
      Game.create!(
        :title => "Title",
        :desc => "Desc"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
  end
end
