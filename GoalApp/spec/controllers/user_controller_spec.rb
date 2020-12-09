require 'rails_helper'

RSpec.describe UserController, type: :controller do
    describe 'GET #new' do
        it 'renders sign up page' do 
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST #create' do 
    # context 'when already logged in '
    #     before :each do 
    #         create :user
    #         allow(subject).to recieve(:current_user).and_return(User.last)
    #     end
    # end
        let (:valid_params) { {user: {username: "john", password: "dragonball"}}  }

        context 'with valid params' do 
            post :create
            before(:each) {user :create, params: valid_params }
        end


    end 

end
#    Prefix Verb   URI Pattern                                                                              Controller#Action
#    users POST   /users(.:format)                                                                         users#create
#     new_user GET    /users/new(.:format)                                                                     users#new
#    new_session GET    /session/new(.:format)                                                                   sessions#new
#   session DELETE /session(.:format)                                                                       sessions#destroy
#    POST   /session(.:format)                                                                       sessions#create