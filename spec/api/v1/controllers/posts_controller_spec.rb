require 'rails_helper'
include RandomData
 
 RSpec.describe Api::V1::PostsController, type: :controller do
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
       get :show, id: my_post.id
       expect(response).to have_http_status(401)
     end
   
    it "PUT update returns http unauthenticated" do
       put :update, id: my_post.id, post: {title: "Post title", body: "Post Description"}
       expect(response).to have_http_status(401)
     end
 
     it "POST create returns http unauthenticated" do
       post :create, post: {title: "Post Name", body: "Post Description"}
       expect(response).to have_http_status(401)
     end
 
     it "DELETE destroy returns http unauthenticated" do
       delete :destroy, id: mu_post.id
       expect(response).to have_http_status(401)
     end
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
       get :show, id: my_post.id
       expect(response).to have_http_status(403)
     end
     
      it "PUT update returns http forbidden" do
       put :update, id: my_post.id, post: {title: "Post Name", body: "Post Description"}
       expect(response).to have_http_status(403)
     end
 
     it "POST create returns http forbidden" do
       post :create, post: {title: "Post Name", body: "Post Description"}
       expect(response).to have_http_status(403)
     end
 
     it "DELETE destroy returns http forbidden" do
       delete :destroy, id: my_post.id
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
         expect([my_post].to_json).to eq response.body
       end
       
       
     describe "PUT update" do
       before { put :update, id: my_post.id, post: {title: @new_post.title, body: @new_post.body} }

       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "updates a post with the correct attributes" do
         updated_post = Post.find(my_post.id)
         expect(updated_post.to_json).to eq response.body
       end
     end
   end
       
     describe "GET show" do
       before { get :show, id: my_post.id }
 
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "returns my_post serialized" do
         expect(my_post.to_json).to eq response.body
       end
     end
     
      describe "POST create" do
       before { post :create, post: {title: @new_post.title, body: @new_post.body} }
 
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "creates a topic with the correct attributes" do
         hashed_json = JSON.parse(response.body)
         expect(@new_post.title).to eq hashed_json["title"]
         expect(@new_post.body).to eq hashed_json["body"]
       end
     end
     
      describe "DELETE destroy" do
       before { delete :destroy, id: my_post.id }
 
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end
 
       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end
 
       it "returns the correct json success message" do
         expect(response.body).to eq({"message" => "Post destroyed","status" => 200}.to_json)
       end
 
       it "deletes my_post" do
         expect{ Post.find(my_post.id) }.to raise_exception(ActiveRecord::RecordNotFound)
       end
     end
   end
 end