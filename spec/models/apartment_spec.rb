require "rails_helper"
# Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
RSpec.describe Apartment, type: :model do
    it "Throws error if apartment does not contain street" do
        shack = Apartment.create street:nil, city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:street]).to_not be_empty
    end
    it "Throws error if apartment does not contain city" do
        shack = Apartment.create street:'howdy st', city:nil, state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:city]).to_not be_empty
    end
    it "Throws error if apartment does not contain state" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:nil, manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:state]).to_not be_empty
    end
    it "Throws error if apartment does not contain manager" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:nil, email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:manager]).to_not be_empty
    end
    it "Throws error if apartment does not contain email" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:nil, price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:email]).to_not be_empty
    end
    it "Throws error if apartment does not contain price" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:nil, bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:price]).to_not be_empty
    end
    it "Throws error if apartment does not contain bedrooms" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:nil, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:bedrooms]).to_not be_empty
    end
    it "Throws error if apartment does not contain bathrooms" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:nil, pets:'horses ok', image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:bathrooms]).to_not be_empty
    end
    it "Throws error if apartment does not contain pets" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:nil, image:'this is an image i swear', user_id:15151515
        expect(shack.errors[:pets]).to_not be_empty
    end
    it "Throws error if apartment does not contain image" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:nil, user_id:15151515
        expect(shack.errors[:image]).to_not be_empty
    end
    it "Throws error if apartment does not contain user_id" do
        shack = Apartment.create street:'howdy st', city:'yeehaw', state:'tx', manager:'t. hanks', email:'thanks@gmail.com', price:'big money', bedrooms:4, bathrooms:4, pets:'horses ok', image:'this is an image i swear', user_id:nil
        expect(shack.errors[:user_id]).to_not be_empty
    end
end