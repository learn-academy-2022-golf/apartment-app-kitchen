class ApartmentsController < ApplicationController


    def index
        if user_signed_in?
          @apartments = current_user.apartments
        else
          @apartments = Apartment.all
        end
      end
end
