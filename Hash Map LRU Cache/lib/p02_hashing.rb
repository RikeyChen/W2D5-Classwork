# class Fixnum
#   # Fixnum#hash already implemented for you
# end
# 
# class Array
#   def hash
#     current_xor = self[0]
#     self.each_index do |i|
#       current_xor = current_xor ^ self[i+1] unless i == self.length - 1
#     end
# 
#     current_xor.hash
#   end
# end
# 
# class String
#   def hash
#   end
# end
# 
# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#   end
# end



# sum
# sum += item.hash ^ i