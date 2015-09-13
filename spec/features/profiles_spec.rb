require 'rails_helper'

describle "Visiting profiles" do 

    include TestFactories

    before do 
        @user = authenticated_user
    end 

    describe "not signed in" do 

        it "shows profile" do 
        expect (current_path).to eq(user_path(@user))
    end

    end 
end      