def locate_item(warehouse, bay)

  for location in warehouse
      for k, v in location
         return v.to_s if k == bay
      end 
  end
  return "Item not found."
end

def find_bay(warehouse, item)
  for location in warehouse
    for k, v in location
      return k if v == item
    end
  end
end

def list_items(warehouse, bays)
  item_list = []
  indices = []
  for bay in bays
    for location in warehouse
      for k, v in location 
        if k == bay.to_sym
            item_list << v

#as warehouse array is in random order we sort the location by an index: 1 near the
# door, 30 near the exit, acc to the formula:
# can refactor out to separate function later
          letter, digits = bay.to_s[0],bay.to_s[1..2]
          if letter == "a"
            indices << 10 - digits.to_i + 1
          elsif letter == "b"
            indices << 20 +  digits.to_i
          else
            indices << 10 +  digits.to_i
          end
        end

      end
    end
  end
      indices.sort!
      distance_between_them = indices.last - indices.first
      item_list << distance_between_them
      return item_list

end

def find_bays(warehouse, items)
  places = []
  for item in items
    for location in warehouse
      for k,v in location
        places << k.to_s if v == item
      end
    end
  end
  return places
end




