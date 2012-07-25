class GettingThere < SumbarContent
  scope :recent, order("created_at desc")
end
