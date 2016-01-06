require 'rails_helper'
include RandomData
 
 RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:other_user) { create(:user) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }
   
    context "unauthenticated users" do
     it "GET index returns http unauthenticated" do
       get :index
       expect(response).to have_http_status(401)
     end
 
     it "GET show returns http unauthenticated" do
       get :show, id: my_comments.id
       expect(response).to have_http_status(401)
     end
   end
   
     it "GET show returns child comments" do
       get :show, id: my_comments.id
       expect([my_comments].to_json).to eq response.body
     end
 
 
   context "authenticated and unauthorized users" do
     before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end
 
     it "GET index returns http forbidden" do
       get :index
       expect(response).to have_http_status(403)
     end
 
     it "GET show returns http forbidden" do
       get :show, id: my_comments.id
       expect(response).to have_http_status(403)
     end
   end
 
 
   context "authenticated and authorized users" do
     before do
       my_user.admin!
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end
 
     describe "GET index" do
       before { get :index }
 
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "returns my_post serialized" do
         expect([my_comments].to_json).to eq response.body
       end
     end
 
 
     describe "GET show" do
       before { get :show, id: my_comments.id }
 
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "returns my_post serialized" do
         expect(my_comments.to_json).to eq response.body
       end
     end
   end
 end