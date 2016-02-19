require( 'minitest/autorun' )
require_relative( '../warehouse_picker' )

class TestWarehousePicker < MiniTest::Test

  def setup

    @warehouse = [
      { b7: 'bath fizzers'},
      { a3: 'blouse'},        
      { a7: 'bookmark'},     
      { c8: 'candy wrapper'}, 
      { c3: 'chalk'},         
      { b10:'cookie jar'},   
      { b9: 'deodorant'},     
      { c2: 'drill press'},   
      { c6: 'face wash'},     
      { a9: 'glow stick'},    
      { a4: 'hanger'},       
      { c10: 'leg warmers'},
      { a8: 'model car'},     
      { b5: 'nail filer'},    
      { a1: 'needle'},        
      { c7:  'paint brush'},   
      { b4: 'photo album'},   
      { b3: 'picture frame'}, 
      { a10: 'rubber band'},  
      { a5: 'rubber duck'},   
      { c1: 'rusty nail'},    
      { b2: 'sharpie'},       
      { c9: 'shoe lace'},     
      { a6: 'shovel'},        
      { a2: 'stop sign'},    
      { c5: 'thermometer'},   
      { b1: 'tyre swing'},    
      { b8: 'tissue box'},    
      { b6: 'tooth paste'},   
      { c4: 'word search'}   
    ]
  end

# array of hashes.  Array lets u keep order and count distance between items;
# also lets u know where u r rel to entrance (index 0) and exit (index 29)
# hash lets u store link between bay and contents

# Given a bay, returns the item in that bay
#   - given "b5", should return 'nail filer'

def test_locate_item
  result = locate_item(@warehouse, :b5)
  assert_equal("nail filer" , result)
end

# this one tests for item not found
# def test_locate_item
#   result = locate_item(@warehouse, :b25)
#   assert_equal("Item not found." , result)
# end

  # Given an item return the bay that it is in.
  # - given "nail filer" should return "b5"

def test_find_bay
  result = find_bay(@warehouse, "nail filer")
  assert_equal(:b5, result)
end

# 3)
#   Given a list of bays, list the items in those bays
#   - given "b5, b10, and b6", determine that the products are "nail filer, cookie jar, and tooth paste", and they're five bays apart

def test_list_items
  result = list_items(@warehouse, ["b5", "b10", "b6"])
  assert_equal(["nail filer", "cookie jar", "tooth paste", 5],result)
end

# 4)
#   Given a list of items find the bays.
#   - given "shoe lace, rusty nail, leg warmers", determine that those items need to be collected from "c1, c9, and c10"

def test_find_bays
  result = find_bays(@warehouse, [ "rusty nail","shoe lace", "leg warmers"])
  assert_equal(["c1", "c9", "c10"], result)
end







end