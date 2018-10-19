puts "Welcome to the Road Trip Comparison Tool! This program will help you decide which vehicle(s) to use for your upcoming road trip."
puts ""

# 2. create super array with all 4 vehicles' infos
## initialize all the necessary storage
all_vehicle_info = Array.new
tracking_vehicle = 0

4.times {

  # 1. create one hash for one vehicle input
  individual_vehicle_info = Hash.new

  puts "Please enter the following information for vehicle #{tracking_vehicle + 1}"

  print "Average Miles per Gallon: "
  user_vehicle_input = gets.chomp.to_i
  individual_vehicle_info["mpg"] = user_vehicle_input

  print "Gallon Capacity: "
  user_vehicle_input = gets.chomp.to_i
  individual_vehicle_info["capacity"] = user_vehicle_input

  print "Vehicle Maintenance Cost: "
  user_vehicle_input = gets.chomp.to_i
  individual_vehicle_info["maintenance"] = user_vehicle_input

  puts ""

  all_vehicle_info << individual_vehicle_info
  tracking_vehicle += 1

}
puts " ~~~~~~~~~~~~ "

# 4. iterate to output information about all cars
all_vehicle_summary = Array.new
tracking_vehicle = 0
total_distance = 3000.0
gas_price = 3

4.times {
# 3. calculate summary info and output information about car 1
  distance_per_tank = all_vehicle_info[tracking_vehicle]["mpg"] * all_vehicle_info[tracking_vehicle]["capacity"]

  refueling_stops = (total_distance.to_i/distance_per_tank)
    # ensure value is ceiling value
    if total_distance % distance_per_tank != 0
      refueling_stops += 1
    end

  total_gallons = total_distance/all_vehicle_info[tracking_vehicle]["mpg"]
  total_cost = (total_gallons * gas_price) + (refueling_stops * all_vehicle_info[tracking_vehicle]["maintenance"])

  total_cost = total_cost.round(2)
  currency_format = (total_cost * 10)/2

  puts "VEHICLE #{tracking_vehicle + 1} SUMMARY"
  puts "Distance per gas tank (in miles): #{distance_per_tank}"
  puts "Number of refueling stops needed: #{refueling_stops}"
  if currency_format % 2 == 0
    puts "Total cost of trip: $#{total_cost}0"
  else
    puts "Total cost of trip: $#{total_cost}"
  end
  puts ""

  individual_vehicle_summary = Hash.new

  individual_vehicle_summary["distance per tank"] = distance_per_tank
  individual_vehicle_summary["refueling stops"] = refueling_stops
  individual_vehicle_summary["total cost"] = total_cost
  individual_vehicle_summary["total gallons"] = total_gallons

  all_vehicle_summary << individual_vehicle_summary
  tracking_vehicle += 1
}

puts " ~~~~~~~~~~~~ "
puts "ADDITIONAL INFO + TIP"


# 5. calculate total gallons used
collective_total_gallons = 0
all_vehicle_summary.each { |info|
  collective_total_gallons += info["total gallons"]
}
puts "1. If each person takes their own vehicle, the group will burn a collective total of approximately #{collective_total_gallons.round(2)} gallons of fuel! :("
puts ""

# 6. calculate which car is most economical
total_cost_array = [all_vehicle_summary[0]["total cost"], all_vehicle_summary[1]["total cost"], all_vehicle_summary[2]["total cost"], all_vehicle_summary[3]["total cost"]]

index = 0
index_array = [index]
lowest_value = total_cost_array[index]
total_cost_array.each { |cost|
  if index > 0
    if cost < lowest_value
      lowest_value = cost
      index_array.clear
      index_array << index
    elsif cost == lowest_value
      index_array << index
    end
  end
  index += 1
}

# 7. calculate the total cost of trip.
trip_total = 0
all_vehicle_summary.each { |info|
  trip_total += info["total cost"]
}


# 8. output info on most economical car & cost saved
if index_array.length == 1
  cost_saved = trip_total - all_vehicle_summary[index_array[0]]["total cost"]

  puts "2. You will save the most money and help keep the environment clean if you carpool and use vehicle number ##{index_array[0]+1}!"
  puts "By carpooling with this vehicle, you would save a whole $#{cost_saved.round(2)}!"
elsif index_array.length == 2
  cost_saved = trip_total - all_vehicle_summary[index_array[1]]["total cost"]

  puts "You will save the most money and help keep the evironment clean if you carpool and use vehicle number ##{index_array[0]+1} or ##{index_array[1]+1}!"
  puts "By carpooling with this vehicle, you would save a whole $#{cost_saved.round(2)}!"

elsif index_array.length == 3
  cost_saved = trip_total - all_vehicle_summary[index_array[2]]["total cost"]

  puts "You will save the most money and help keep the evironment clean if you carpool and use vehicle number ##{index_array[0]+1}, ##{index_array[1]+1}, or ##{index_array[2]+1}!"
   puts "By carpooling with this vehicle, you would save a whole $#{cost_saved.round(2)}!"

else
  cost_saved = trip_total - all_vehicle_summary[index_array[1]]["total cost"]

  puts "2. You will spend the same amount of money carpooling and using any of the four vehicles."
  puts "By carpooling, the group would save a whole $#{cost_saved.round(2)}!"
end
