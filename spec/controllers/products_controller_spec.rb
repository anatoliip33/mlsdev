require 'rails_helper'

describe ProductsController do
  let(:product) { FactoryGirl.create(:product) }

  let(:valid_attributes) { attributes_for(:product) }
  let(:invalid_attributes) { attributes_for(:invalid_product) }


  describe "GET #index" do
    before :each do
      get :index
    end

    it "populates an array of products" do
      expect(assigns(:products)).to match_array [product]
    end

    it "renders the :index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      get :show, id: product
    end

    it "assigns the requested product to @product" do
      expect(assigns(:product)).to eq product
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "assigns a new Product to @product" do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, id: product
    end

    it "assigns the requested product to @product" do
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid_attributes" do

      it "creates a new product" do
        expect{
          post :create, product: attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "redirects to the new product" do
        post :create, product: attributes_for(:product)
        expect(response).to redirect_to Product.last
      end
    end

    context "with invalid_attributes" do

      it "does not save the new product in the database" do
        expect{
          post :create, product: attributes_for(:invalid_product)
        }.not_to change(Product, :count)
      end

      it "re-renders the new method" do
        post :create, product: attributes_for(:invalid_product)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      product = create(:product, name: 'Vasya', description: 'the village')
    end
    context "valid_attributes" do
      it "locates the requested product" do
        allow(product).to \
            receive(:update).with(valid_attributes.stringify_keys) { true }
        patch :update, id: product, product: attributes_for(:product)
        expect(assigns(:product)).to eq product
      end

      it "changes product attributes" do
        patch :update, id: product, product: attributes_for(:product, name: 'Petro', description: 'the village')
        product.reload
        expect(product.name).to eq('Petro')
        expect(product.description).to eq('the village')
      end

      it "redirects to the updated product" do
        patch :update, id: product, product: attributes_for(:product)
        expect(response).to redirect_to product
      end
    end

    context "with invalid_attributes" do

      it "does not change the product's attributes" do
        product = create(:product, name: 'Valera', description: 'the village')
        patch :update, id: product, product: attributes_for(:product, name: 'Petro', description: nil)
        product.reload
        expect(product.name).not_to eq('Petro')
        expect(product.description).to eq('the village')
      end

      it "re-renders the edit template" do
        patch :update, id: product, product: attributes_for(:invalid_product)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @product = create(:product)
    end

    it "deletes the product" do
      expect{
        delete :destroy, id: @product
      }.to change(Product,:count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, id: @product
      expect(response).to redirect_to products_url
    end
  end

end
