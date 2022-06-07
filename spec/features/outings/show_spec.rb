require "rails_helper"

RSpec.describe "Outings show page" do
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
    @ride = Outing.create!(name: "Helicopter Ride", location: "Everywhere", date: "1/1/2022")
    @library = Outing.create!(name: "Library", location: "The Library", date: "6/6/22")

    @co1 = ContestantOuting.create!(contestant_id: @reinhart.id, outing_id: @kick.id)
    @co2 = ContestantOuting.create!(contestant_id: @reinhart.id, outing_id: @hot.id)
    @co3 = ContestantOuting.create!(contestant_id: @reinhart.id, outing_id: @ride.id)
    @co4 = ContestantOuting.create!(contestant_id: @reinhart.id, outing_id: @library.id)
    @co5 = ContestantOuting.create!(contestant_id: @wilkins.id, outing_id: @ride.id)
    @co6 = ContestantOuting.create!(contestant_id: @bethune.id, outing_id: @ride.id)

    visit outing_path(@ride)
  end
  it "shows name, location, and date of outing" do

    expect(page).to have_content("Helicopter Ride")
    expect(page).to have_content("Everywhere")
    expect(page).to have_content("1/1/2022")
  end
  it "shows total number of contestants on the outing" do
    expect(page).to have_content("Count of Contestants: 3")
  end
  it "lists all contestants on the outing" do
    expect(page).to have_content("Colin Reinhart")
    expect(page).to have_content("Stephen Wilkins")
    expect(page).to have_content("Cory Bethune")
  end
end
