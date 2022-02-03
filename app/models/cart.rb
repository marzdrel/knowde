class Cart < ApplicationRecord
  def to_param
    marker
  end
end
