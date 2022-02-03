class Product::SummaryScope
  def self.call(...) = new(...).call

  def call
    module_parent
      .select(select_query)
      .group(:id)
      .order("MIN(code)")
  end

  delegate :module_parent, to: :class

  private

  def select_query
    <<~SQL.squish
      name,
      code,
      price,
      SUM(price) AS total,
      COUNT(*) AS qty
    SQL
  end
end
