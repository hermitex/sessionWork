describe Shop do
  let(:shop) { Shop.new }
  let(:attributes) do
    {
      title: "Barber",
      opening_date: 1973,
      owner: "George Omondi",

    }
  end

  it 'inherits from ActiveRecord::Base' do
    expect(Shop.superclass).to eq(ActiveRecord::Base)
  end

  it 'has a title' do
    shop.title = "The Shop"
    expect(shop.title).to eq("The Shop")
  end

  it 'has a opening date' do
    shop.opening_date = 1999
    expect(shop.opening_date).to eq(1999)
  end

  it 'has a owner' do
    shop.owner = "The Wachowski Sisters"
    expect(shop.owner).to eq("The Wachowski Sisters")
  end


  it 'can be instantiated with a hash of attributes' do
    expect { Shop.new(attributes) }.not_to raise_error
  end

  describe 'Create' do

    describe '.create_with_title' do
      it 'saves the title to the shop' do
        titled_shop = Shop.create_with_title("This is a title.")
        expect(titled_shop.title).to eq("This is a title.")
      end

      it 'creates a new record in the database' do
        expect { Shop.create_with_title("This is a title.") }.to change(Shop, :count).by(1)
      end
    end

  end


  describe 'Read' do
    before do
      Shop.create(title: "Shop_1", opening_date: 1922, owner: "John Doe")
      Shop.create(title: "Shop_2", opening_date: 2000, owner: "Jane Doe")
      Shop.create(title: "Shop_3", opening_date: 2002, owner: "Rose Doe")
      Shop.create(title: "Shop_4", opening_date: 1922, owner: "Mary Anjente")
      Shop.create(title: "Shop_5", opening_date: 2001, owner: "James Doe")
    end

  describe '.first_shop' do
    it 'Should return the first shop' do
      expect(Shop.first_shop.title).to eq('Shop_1')
    end
  end

  describe '.last_shop' do
    it 'Should return the last shop' do
      expect(Shop.last_shop.title).to eq('Shop_5')
    end
  end

  describe '.shop_count' do
    it 'Should return the total number of shops' do
      expect(Shop.shop_count).to eq(5)
    end
  end

  describe '.find_shop_by_id' do
    it 'Should return the a shop with provided id' do
      expect(Shop.find_shop_by_id(1).title).to eq("Shop_1")
    end
  end

  describe '.find_shop_with_attributes' do
    it 'Should return the a shop with provided attributes' do
      shop = Shop.find_shop_with_attributes(title: "Shop_1", opening_date: 2000, owner: "John Doe")
      expect(shop.title).to eq("Shop_1")
    end
  end

  describe '.find_shops_after' do
    it 'Should return shops before a given year' do
      shops = Shop.find_shops_after(2000)
      expect(shops).to match_array([
        have_attributes(class: Shop, title: "Shop_3", opening_date: 2002, owner: "Rose Doe"),
        have_attributes(class: Shop,  title: "Shop_5", opening_date: 2001, owner: "James Doe")
      ])
    end
  end

  describe 'Update' do

    describe '#update_shop_with_attributes' do
      it 'Should update one shop' do
        shop = Shop.create(title: "Hermit's", opening_date: 2023, owner: 'Hermit')
        expect do
          shop.update_shop_with_attributes(opening_date: 2019)
        end.to change(shop, :opening_date).from(2023).to(2019)
        end
      end
    end


    describe '#update_all_titles' do
      it 'Should update one shop' do
        shop = Shop.create(title: "Hermit's", opening_date: 2023, owner: 'Hermit')
        shop = Shop.create(title: "Hermit's", opening_date: 2023, owner: 'Hermit')
        Shop.update_all_titles("Hermitex")
        expect(Shop.where(title: "Hermitex").count).to be(7)
        end
      end
    end


describe 'Delete' do
  before do
    Shop.create(title: "Shop_0", opening_date: 2000, owner: "John Doe")
    Shop.create(title: "Shop_1", opening_date: 2001, owner: "John Doe")
    Shop.create(title: "Shop_2", opening_date: 2002, owner: "John Doe")
    Shop.create(title: "Shop_3", opening_date: 2003, owner: "John Doe")
    Shop.create(title: "Shop_4", opening_date: 2004, owner: "John Doe")
  end

  describe '.delete_by_id' do
    it 'deletes the record with the provided id' do
      expect { Shop.delete_by_id(1) }.to change(Shop, :count).from(5).to(4)
    end
  end

  describe '.delete_all_shops' do
    it 'deletes all the shops from the shops table' do
      expect { Shop.delete_all_shops }.to change(Shop, :count).from(5).to(0)
    end
  end
end


end
