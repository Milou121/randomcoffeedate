module CupsHelper
  def human_cup_time(cup)
    Pot.human_attribute_name(cup.time)
  end
end
