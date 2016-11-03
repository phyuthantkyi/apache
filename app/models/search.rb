class Search < ApplicationRecord
  def products
    @products ||= find_products
  end

private

  def find_products
    Product.find(:all, :conditions => conditions)
  end

  def keyword_conditions
    ["products.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end

  def minimum_price_conditions
    ["products.price >= ?", minium_price] unless minium_price.blank?
  end

  def maximum_price_conditions
    ["products.price >= ?", maximum_price] unless maximum_price.blank?
  end

  def productt_conditions
    ["products.id = ?", product_id] unless product_id.blank?
  end

  def conditions
    [conditions_clauses.join('AND')]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def condition_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    methods.grep(/_conditions$/).map { |m| send(m) }.compact
  end

  # private
  #
  # def find_products
  #   products = Product.order(:name)
  #   products = Product.where("name LIKE ?", "%#{keywords}%") if keywords.present?
  #   products = Product.where("price LIKE ?", price) if price.present?
  #   products
  # end
end
