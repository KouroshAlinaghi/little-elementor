require_relative "little-elementor/orbital"

module LittleElementor

  class Element
    include LittleElementor::Helpers

    attr_reader :period, :atomic_number, :group, :charge, :is_nobel_gas, :symbol, :name, :fake_atomic_number
    def initialize(opts)
      opts = opts.has_key?(:charge) ? opts : opts.merge({:charge => 0})
      @charge = opts[:charge]
      if opts.has_key?(:atomic_number)
        @fake_atomic_number = opts[:atomic_number] 
        @atomic_number = @fake_atomic_number + @charge
        @symbol = LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:sym]
      elsif opts.has_key?(:symbol)
        @atomic_number = LittleElementor::Helpers::ELEMENTS.find_index{|i| i[:sym] == opts[:symbol]} + 1
        @fake_atomic_number = @atomic_number + @charge
        @symbol = opts[:symbol]
      end
      @group = @atomic_number == 2 ? 18 : get_group()
      @is_nobel_gas = @group == 18
      @name = get_name()
      @period = electron_configuration.map(&:n).max
    end

    def electron_configuration(sorted: true)
      get_e_c(sorted)
    end

    def to_s
      "Compressed Electron Configuration: #{human_friendly_c_e_c}\nSymbol: #{@symbol}\nis a noble gas?: #{@is_nobel_gas}\ncharge: #{@charge}\nname: #{@name}\natomic_number #{@atomic_number}\nsorted electron configuration: #{electron_configuration.map(&:to_s)}\nelectron configuration: #{electron_configuration(sorted: false).map(&:to_s)}\nperiod: #{@period}\ngroup: #{@group}\nfake_atomic_number: #{@fake_atomic_number}"
    end

    def compressed_electron_configuration
      if @compressed_electron_configuration
        @compressed_electron_configuration
      else
        @compressed_electron_configuration = get_c_e_c()
      end
    end

    def human_friendly_c_e_c
      sym = @period == 1 ? "" : "[#{compressed_electron_configuration[0].symbol}] "
      "#{sym}#{compressed_electron_configuration[1].map(&:to_s).join ", "}"
    end
  end
end
