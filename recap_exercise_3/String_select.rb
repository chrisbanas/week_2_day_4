# Extend the string class by defining a String#select method that accepts a block. The method should return a new string containing characters of the original string that return true when passed into the block. If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.

class String

    def select(&blk)
        new_str = ""
        blk ||= Proc.new { |ch| ch == ch }

        self.each_char { |char| new_str += char if blk.call(char) }

        if new_str == self
            return ""
        else
            return new_str
        end
    end

end



# Examples
p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""
