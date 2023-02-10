# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple of both of the given numbers

    # it "should return the least common multiple of 4 and 10" do
    #     expect(least_common_multiple(4, 10)).to eq(20)
    #     expect(least_common_multiple(10, 4)).to eq(20)
    # end

    # it "should return the least common multiple of 7 and 21" do
    #     expect(least_common_multiple(7, 21)).to eq(21)
    #     expect(least_common_multiple(21, 7)).to eq(21)

   # the least common multiple cannot be greater than the two * together and then you flip the order of % taking the iterator and putting it against the num. This allows you to keep counting up to the higest number that is % = 0

def least_common_multiple(num_1, num_2)

    i = 1
    while i <= num_1 * num_2
        return i if i % num_1 == 0 && i % num_2 == 0
        i += 1
    end

end

# def prime?(num)

#     if num <= 1
#         return false
#     end

#     if num == 2
#         return true
#     end

#     (2...num).each do |x|
#         if num % x == 0
#             return false
#         end
#     end

#     true

# end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the most in the string.

# it "should return the bigram that appears the most in the string" do
#     expect(most_frequent_bigram("thethrillofit")).to eq("th")
#     expect(most_frequent_bigram("gotothemoonsoonforproof")).to eq("oo")
#     expect(most_frequent_bigram("bananasareanotherfruit")).to eq("an")
# end

def most_frequent_bigram(str)

    bigrams = Hash.new(0)

    str.each_char.with_index do |char, i|
        if i == str.length - 1
            break
        else
            bigrams[str[i] + str[i + 1]] += 1
        end
    end

    max = bigrams.values.sort[-1]

    bigrams.each { |k, v| return k if max == v }

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse

        hash = {}

        self.each { |k, v| hash[v] = k }

        hash

    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target

    # it "should return the number of pairs of elements that add to the given num" do
    #     expect([1, 2, 1, 3, 8].pair_sum_count(5)).to eq(1)
    #     expect([10, 3, 6, 5, 7].pair_sum_count(13)).to eq(2)
    #     expect([10, 3, 6, 5, 7].pair_sum_count(4)).to eq(0)

    def pair_sum_count(num)

        count = 0

        self.each_with_index do |num_1, i_1|
            self.each_with_index do |num_2, i_2|
                if i_2 > i_1 && num_1 + num_2 == num
                    count += 1
                end
            end
        end

        count

    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)

    # context "when no proc is given as an arg" do
    #     it "should sort the array in increasing order by default" do
    #         expect([4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort).to eq([1, 2, 4, 8, 9, 12, 14, 24, 25, 81])

    # context "when a proc is given as an arg" do
    #     it "should sort the array according to proc" do
    #         actual = [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s } # this block will sort the numbers "alphabetically" by characters
    #         expect(actual).to eq([1, 12, 14, 2, 24, 25, 4, 8, 81, 9])

    def bubble_sort(&prc)

       # prc ||= Proc.new { |a, b| a <=> b } this is essentially saying that if a prc is not called in then to take the block on the right of the || statement which is essenitally a regular bubble sort.

        sorted = false

        if prc == nil
            while !sorted
                sorted = true
                (0...self.length - 1).each do |i|
                    if (self[i] <=> self[i + 1]) == 1
                        self[i], self[i + 1] = self[i + 1], self[i]
                        sorted = false
                    end
                end
            end
        else
            while !sorted
                sorted = true
                (0...self.length - 1).each do |i|
                    if (prc.call(self[i], self[i + 1])) == 1
                        self[i], self[i + 1] = self[i + 1], self[i]
                        sorted = false
                    end
                end
            end
        end

        self

    end
end
