require "rails_helper"

RSpec.describe "project show page" do

  before :each do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
  end

  it "user can see project name and material and theme of the challange" do
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content("Material: #{@news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{@recycled_material_challenge.theme}")
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 12.5")
  end

  it "user can add a contestant" do
    visit "/projects/#{@news_chic.id}"
    fill_in "Contestant ID:", with: @kentaro.id
    click_button "Add Contestant To Project"
    expect(current_path).to eq("/projects/#{@news_chic.id}")
    expect(page).to have_content("Number of Contestants: 3")

    visit "/contestants"
    within "#contestant-#{@kentaro.id}" do
      expect(page).to have_content("Projects: #{@news_chic.name}")
    end
  end
end
