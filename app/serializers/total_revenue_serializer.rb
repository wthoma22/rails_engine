class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    (object["revenue"].to_f/100).to_s
  end

end
