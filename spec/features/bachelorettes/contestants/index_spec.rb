require "rails_helper"

RSpec.describe 'bachelorette contestants index' do
  before :each do
    @white = Bachelorette.create!(name: "Megan White", season_number: 1, description: "An OK Season...")
    @brown = Bachelorette.create!(name: "Hannah Brown", season_number: 2, description: "The Most Dramatic Season Yet!")

    @reinhart = Contestant.create!(name: "Colin Reinhart", age: 33, hometown: "Denver", bachelorette_id: @brown.id)
    @wilkins = Contestant.create!(name: "Stephen Wilkins", age: 26, hometown: "Los Angeles", bachelorette_id: @brown.id)
    @haines = Contestant.create!(name: "Thomas Haines", age: 25, hometown: "San Francisco", bachelorette_id: @brown.id)
    @king = Contestant.create!(name: "Andrew King", age: 24, hometown: "Philidelphia", bachelorette_id: @brown.id)
    @bethune = Contestant.create!(name: "Cory Bethune", age: 27, hometown: "Vancouver", bachelorette_id: @white.id)
  end

  it "have contectant age, hometown, and name is a link to contestant show page" do
    visit "/bachelorettes/#{@brown.id}/contestants"

    expect(page).to have_link("Colin Reinhart")
    expect(page).to have_link("Stephen Wilkins")
    expect(page).to have_link("Thomas Haines")
    expect(page).to have_link("Andrew King")
    expect(page).to_not have_link("Cory Bethune")

    click_link "Colin Reinhart"
    expect(current_path).to eq("/contestants/#{@reinhart.id}")
  end
end
