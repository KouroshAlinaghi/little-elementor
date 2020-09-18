require_relative "little-elementor/orbital"

module LittleElementor

  class Element
    include LittleElementor::Helpers

    attr_reader :period, :atomic_number, :group, :charge, :is_nobel_gas, :symbol, :name
    def initialize(opts)
      opts = opts.has_key?(:charge) ? opts : opts.merge({:charge => 0})
      if opts.has_key?(:atomic_number)
        @atomic_number = opts[:atomic_number] + opts[:charge]
        @symbol = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:sym]
      elsif opts.has_key?(:symbol)
        @atomic_number = LittleElementor::Helpers::ELEMENTS.find_index{|i| i[:sym] == opts[:symbol]} + 1
        @symbol = opts[:symbol]
      end
      @group = @atomic_number == 2 ? 18 : get_group()
      @is_nobel_gas = @group == 18
      @name = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:name]
      @period = electron_configuration.map(&:n).max
      @charge = opts[:charge]
    end

    def electron_configuration(sorted: true)
      get_e_c(sorted)
    end

    def to_s
      "Symbol: #{@symbol}\nis a noble gas?: #{@is_nobel_gas}\ncharge: #{@charge}\nname: #{@name}\natomic_number #{@atomic_number}\nsorted electron configuration: #{electron_configuration.map(&:to_s)}\nelectron configuration: #{electron_configuration(sorted: false).map(&:to_s)}\nperiod: #{@period}\ngroup: #{@group}"
    end
  end
end

e = LittleElementor::Element.new(atomic_number: 30, charge: -1)
puts e
