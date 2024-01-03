require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post1) { FactoryBot.create(:post) }
  let(:valid_attributes) { attributes_for(:post) }
  describe "GET #index" do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end
# ===================================

  describe "GET #show" do
    it 'returns a successful response' do
      get :show, params: { id: post1.id }
      expect(response).to be_successful
    end
  end
# ===================================

  describe "GET #edit" do
  it 'returns a successful response' do
    get :edit, params: { id: post1.id }
    expect(response).to be_successful
  end
end
# ===================================

describe "POST #create" do
  it 'returns a successful response' do
    post :create, params: { post: valid_attributes }
    expect(response).to have_http_status(:created)
  end
end
# ===================================

describe 'PATCH #update' do
let(:post1) { FactoryBot.create(:post) }

  context 'with valid parameters' do
    it 'updates the post' do
      patch :update, params: { id: post1.id, post: { title: 'New Title', content: 'New Content' } }

      expect(response).to have_http_status(:ok)
     
    end
  end
end
# ===================================
describe "DELETE #destroy" do
  it 'returns a successful response' do
    delete :destroy, params: { id: post1.id }
    expect(response).to have_http_status(:no_content)
  end
end
end
