def seed_model_resets
  p "Clear all models instances"
  models = [User, Label, Activity, RecommendedItemLabel, Trip]
  models.each do |model|
    p "\n before"
    p model
    p model.all
   p "-----------DESTROY-----------"
    model.destroy_all
    p "\n after"
    p model
    p model.all
  end
end