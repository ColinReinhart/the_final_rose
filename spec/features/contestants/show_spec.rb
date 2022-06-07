require "rails_helper"

RSpec.describe "Contestants show page" do
  before :each do
    @white = Bachelorette.create!(name: "Megan White", season_number: 1, description: "An OK Season...")
    @brown = Bachelorette.create!(name: "Hannah Brown", season_number: 2, description: "The Most Dramatic Season Yet!")

    @reinhart = Contestant.create!(name: "Colin Reinhart", age: 33, hometown: "Denver", bachelorette_id: @brown.id)
    @wilkins = Contestant.create!(name: "Stephen Wilkins", age: 26, hometown: "Los Angeles", bachelorette_id: @brown.id)
    @haines = Contestant.create!(name: "Thomas Haines", age: 25, hometown: "San Francisco", bachelorette_id: @brown.id)
    @king = Contestant.create!(name: "Andrew King", age: 24, hometown: "Philidelphia", bachelorette_id: @brown.id)
    @bethune = Contestant.create!(name: "Cory Bethune", age: 27, hometown: "Vancouver", bachelorette_id: @white.id)

    @kick = Outing.create!(name: "Kickball", location: "here", date: "7/19/1988")
    @hot = Outing.create!(name: "Hot Springs", location: "there", date: "7/1/2021")
    @ride = Outing.create!(name: "Helicopter Ride", location: "Everywhere", date: "1/1/22")
    @library = Outing.create!(name: "Library", location: "The Library", date: "6/6/22")

    @reinhart.contestant_outings.create!(outing_id: "#{@kick.id}")
    @reinhart.contestant_outings.create!(outing_id: "#{@hot.id}")
    @reinhart.contestant_outings.create!(outing_id: "#{@ride.id}")
    @haines.contestant_outings.create!(outing_id: "#{@library.id}")
  end
  it "shows contestants name, season, season description, and outings" do
    visit contestant_path(@reinhart)

    expect(page).to have_content("Colin Reinhart")
    expect(page).to have_content("Season 2 - The Most Dramatic Season Yet")
    expect(page).to have_link("Kickball")
    expect(page).to have_link("Hot Springs")
    expect(page).to_not have_link("Library")
    expect(page).to have_link("Helicopter Ride")

    click_link "Helicopter Ride"
    expect(current_path).to eq("/outings/#{@ride.id}")
  end
end
