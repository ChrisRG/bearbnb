descriptions = {
koala: "Loves eucalyptus leaves, hates bright colors. Fun!", 
grizzly: "Your best friend in catching salmon and eating them raw. Delicious!", 
panda: "Who knew sleeping 20 hours a day could be this fun? ZzZzZz!", 
brown: "Ha ha, who knows what this one is thinking? Be careful!", 
polar: "He might complain about the heat, but he sure knows his cars. Handy!"
}

Bear.all.each do |bear|
  bear.description = descriptions[bear.species.to_sym]
  bear.save
end
