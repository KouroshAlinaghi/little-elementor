require_relative "little-elementor/orbital"

module LittleElementor

  class Element
    include LittleElementor::Helpers

    attr_reader :period, :atomic_number, :group, :charge, :is_nobel_gas, :symbol, :name
    def initialize(atomic_number, charge = 0)
      @atomic_number = atomic_number + charge
      raise "atomic number is out of range" unless (1..118).include?(@atomic_number)
      raise "Lanthanides and actinides are not supported yet." if ((57..71).to_a+(89..103).to_a).include? @atomic_number
      raise "Transition metals are not supported yet." if ((39..48).to_a+(72..80).to_a+(104..112).to_a).include? @atomic_number
      @group = get_group()
      @is_nobel_gas = @group == 18
      @name = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:name]
      @period = electron_configuration.map(&:n).max
      @charge = charge
      @symbol = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:sym]
    end

    def electron_configuration(sorted: true)
      get_e_c(sorted)
    end

    def to_s
      "Symbol: #{@symbol}\nis a noble gas?: #{@is_nobel_gas}\ncharge: #{@charge}\nname: #{@name}\natomic_number #{@atomic_number}\nsorted electron configuration: #{electron_configuration.map(&:to_s)}\nelectron configuration: #{electron_configuration(sorted: false).map(&:to_s)}\nperiod: #{@period}\ngroup: #{@group}"
    end
  end
end

e = LittleElementor::Element.new(123)
puts e
