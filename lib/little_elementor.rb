require_relative "little-elementor/orbital"

module LittleElementor

  class Element
    include LittleElementor::Helpers

    attr_reader :period, :atomic_number, :group, :charge, :is_nobel_gas, :symbol, :name
    def initialize(atomic_number, charge = 0)
      @atomic_number = atomic_number + charge
      @is_nobel_gas = [2, 10, 18, 36, 54, 86, 118].include?(@atomic_number)
      @name = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:name]
      @period = electron_configuration.map(&:n).max
      @charge = charge
      @group = get_group()
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
