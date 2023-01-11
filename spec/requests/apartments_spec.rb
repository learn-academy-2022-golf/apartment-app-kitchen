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
        User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(200)

      apartment = Apartment.first
      expect(apartment.state).to eq "Surrey"
    end
    it "cannot create an apartment without a street" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['street']).to include "can't be blank"
    end
    it "cannot create an apartment without a city" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['city']).to include "can't be blank"
    end
    it "cannot create an apartment without a state" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['state']).to include "can't be blank"
    end
    it "cannot create an apartment without a manager" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['manager']).to include "can't be blank"
    end
    it "cannot create an apartment without a email" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to include "can't be blank"
    end
    it "cannot create an apartment without a price" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['price']).to include "can't be blank"
    end
    it "cannot create an apartment without bedrooms" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['bedrooms']).to include "can't be blank"
    end
    it "cannot create an apartment without bathrooms" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['bathrooms']).to include "can't be blank"
    end
    it "cannot create an apartment without pets" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['pets']).to include "can't be blank"
    end
    it "cannot create an apartment without an image" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['image']).to include "can't be blank"
    end
    it "cannot create an apartment without a user id" do
      User.create(
        email: "test@example.com", 
        password: "password", 
        password_confirmation: "password")
        user = User.first

        apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
        }}

      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)  
      json_response = JSON.parse(response.body)
      expect(json_response['user_id']).to include "can't be blank"
    end
  end

  describe "PATCH /update" do
    let(:user){User.create(
      email: "test@example.com", 
      password: "password", 
      password_confirmation: "password")}
    let(:apartment){user.apartments.create(
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
    )}
    it "updates an apartment" do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      updated_apartment = Apartment.find(apartment.id)
      expect(response).to have_http_status(200)
      expect(updated_apartment.price).to eq '2850'
    end
    it 'cannot update an apartment at particular ID without a street' do
      apartment_params = {apartment: {
          street: nil,
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['street']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a city' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: nil,
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['city']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a state' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: nil,
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['state']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a manager' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: nil,
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['manager']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a email' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: nil,
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a price' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: nil,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['price']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a bedrooms' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: nil,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['bedrooms']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a bathrooms' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: nil,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['bathrooms']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a pets' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: nil,
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['pets']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a image' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: nil,
          user_id: user.id
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['image']).to include "can't be blank"
    end
    it 'cannot update an apartment at particular ID without a user id' do
      apartment_params = {apartment: {
          street: "4 Privet Drive",
          city: "Little Whinging",
          state: "Surrey",
          manager: "Mr. Potter",
          email: "potter@example.com",
          price: 2850,
          bedrooms: 3,
          bathrooms: 2,
          pets: "yes",
          image: "https://c8.alamy.com/comp/B0RJGE/small-bungalow-home-with-pathway-in-addlestone-surrey-uk-B0RJGE.jpg",
          user_id: nil
        }}

      patch "/apartments/#{apartment.id}", params: apartment_params
      expect(response).to have_http_status(422)
      json_response = JSON.parse(response.body)
      expect(json_response['user_id']).to include "can't be blank"
    end
  end
  describe "DESTROY /delete" do
    it "deletes an apartment" do
      user = User.create(
      email: "test@example.com", 
      password: "password", 
      password_confirmation: "password")
      apartment = user.apartments.create(
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
      expect do 
        delete apartment_url(apartment)
      end.to change(Apartment, :count).by(-1)
    end
  end 
end