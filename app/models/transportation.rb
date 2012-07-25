class Transportation < SumbarContent
  scope :recent, order("created_at desc")
end
