require_relative "helpers"

module LittleElementor

  class Orbital

    attr_reader :n, :l, :electrons_count
    def initialize(n, l, electrons_count)
      @n = n
      @l = l
      @electrons_count = electrons_count
    end

    def to_s
      "#{@n}#{Helpers::L[@l]}#{@electrons_count}"
    end

    def self.gen_orbitals 
      i = 0
      n = 1
      al_lay = []
      while n < 9
        break if n > 7 
        l = 0
        while l < n
          max = l*4 + 2
          break if n > 7 or l >= n 
          al_lay << Orbital.new(n, l, max)
          i += max
          l+=1
        end
        n+=1
      end
      al_lay.sort_by{|o| [o.n + o.l, o.n]}
    end
  end
end
