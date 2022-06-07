require 'rails_helper'

RSpec.describe 'Bachelorette show' do
  before :each do
    @white = Bachelorette.create!(name: "Megan White", season_number: 1, description: "An OK Season...")
    @brown = Bachelorette.create!(name: "Hannah Brown", season_number: 2, description: "The Most Dramatic Season Yet!")

    @reinhart = Contestant.create!(name: "Colin Reinhart", age: 33, hometown: "Denver", bachelorette_id: @brown.id)
    @wilkins = Contestant.create!(name: "Stephen Wilkins", age: 26, hometown: "Los Angeles", bachelorette_id: @brown.id)
    @haines = Contestant.create!(name: "Thomas Haines", age: 25, hometown: "San Francisco", bachelorette_id: @brown.id)
    @king = Contestant.create!(name: "Andrew King", age: 24, hometown: "Philidelphia", bachelorette_id: @brown.id)
    @bethune = Contestant.create!(name: "Cory Bethune", age: 27, hometown: "Vancouver", bachelorette_id: @white.id)
  end

  it "has bachelorette's name, season number, and season description" do\
    visit "/bachelorettes/#{@brown.id}"

    expect(page).to have_content("Hannah Brown")
    expect(page).to_not have_content("Megan White")
    expect(page).to have_content("Season 2")
    expect(page).to_not have_content("Season 1")
    expect(page).to have_content("The Most Dramatic Season Yet!")
    expect(page).to_not have_content("An OK Season...")

    expect(page).to have_link("Bachelorette's Contestants")
    click_link "Bachelorette's Contestants"
    expect(current_path).to eq("/bachelorettes/#{@brown.id}/contestants")

    expect(page).to have_content("Colin Reinhart")
    expect(page).to have_content("Stephen Wilkins")
    expect(page).to have_content("Thomas Haines")
    expect(page).to have_content("Andrew King")
    expect(page).to_not have_content("Cory Bethune")

  end

end
