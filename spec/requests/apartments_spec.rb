require "rails_helper"

RSpec.describe "Apartments", type: :request do
  describe "GET /index" do
    it "gets a list of apartments" do
      user = User.create(
      email: "test@example.com", 
      password: "password", 
      password_confirmation: "password")
      user.apartments.create(
        street: "4 Privet Drive",
        city: "Little Whinging",
        state: "Surrey",
        manager: "Mr. Potter",
        email: "potter@example.com",
        price: 2000,
        bedrooms: 3,
        bathrooms: 2,
        pets: "yes",
        image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg"
      )

      get '/apartments' 

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates an apartment" do
        user = User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        apartment_params = {user.apartments: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg"
        }
      }

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(200)

      apartment = Apartment.first
      expect(apartment.state).to eq 'Surrey'
    end
  end
end