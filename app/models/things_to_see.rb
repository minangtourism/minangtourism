class ThingsToSee < SumbarContent
  scope :recent, order("created_at desc")
end
