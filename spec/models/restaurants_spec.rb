require 'spec_helper'

describe "visit '/restaurants/new'", driver: selenium do
	before do
		visit '/restaurants/new'
	end

	it "creates a new restaurant and renders show" do
		restaurant_name = "Mc Johns"
		fill_in 'restaurant_name', with: restaurant_name
		click_button 'submit!'
		expect(page).to have_content(restaurant_name)
	end

	context "no restaurant name provided" do
		it "redirects to root" do
			click_button 'submit!'
			expect(page).to have_content("New Restaurantly Spots")
		end
	end
end

describe "visit '/'" do
	context "displays ", :driver => :selenium do
		before do
			visit '/'	
		end

		it "Restaurantly Spots!" do
			expect(page).to have_content 'Restaurantly Spots!'
		end
	end
end

describe "edit links work" do
	context "works", :driver => :selenium do
		it "properly" do
			visit '/restaurants/new'
			fill_in 'restaurant_name', with: "mc ruby"
			click_button 'submit!'
			visit '/'
			click_link 'edit'
			fill_in 'restaurant_name', with: "mc rails"
			click_button 'update'
			expect(page).to have_content 'mc rails'
		end
	end
end

describe "destroy" do
	context "works", :driver => :selenium do
		it "properly" do
			visit '/restaurants/new'
			fill_in 'restaurant_name', with: "mc ruby"
			click_button 'submit!'
			visit '/'
			click_link 'edit'
			fill_in 'restaurant_name', with: "mc rails"
			click_button 'update'
			expect(page).to have_content 'mc rails'
		end
	end
end