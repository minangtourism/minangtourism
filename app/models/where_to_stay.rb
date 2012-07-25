class WhereToStay < SumbarContent
  scope :recent, order("created_at desc")
end
