class Shop < ActiveRecord::Base
  # C=>Create
  def self.create_with_title(title)
    Shop.create(title: title)
  end

  # R=>Read
  def self.first_shop
    Shop.first
  end

  def self.last_shop
    Shop.last
  end

  def self.shop_count
    Shop.count
  end

  def self.find_shop_by_id(id)
    Shop.find(id)
  end

  def self.find_shop_with_attributes(attr)
    Shop.find_by(title: attr[:title])
  end

  # We tried to make the method general so that you can pass any year
  def self.find_shops_after(year)
    Shop.where("opening_date > #{year}")
  end

  # U=>Update
  def update_shop_with_attributes(attr)
    self.update(opening_date: attr[:opening_date])
  end


  def self.update_all_titles(title)
    Shop.update_all(title: title)
  end

  # D=>Delete
  def self.delete_by_id (id)
    # find record
    shop_to_delete = Shop.find(id)
    shop_to_delete.destroy
  end

  def self.delete_all_shops
    Shop.destroy_all
  end


end
