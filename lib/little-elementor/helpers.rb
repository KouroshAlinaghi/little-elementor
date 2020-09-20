module LittleElementor
  module Helpers

    PERIODS = [2, 8, 8, 18, 18, 18, 18]
    L = ["S", "P", "D", "F", "G", "H", "I", "J"]
    ELEMENTS = [
      {name: "hydrogen", sym: "H"},
      {name: "helium", sym: "He"},
      {name: "lithium", sym: "Li"},
      {name: "beryllium", sym: "Be"},
      {name: "boron", sym: "B"},
      {name: "carbon", sym: "C"},
      {name: "nitrogen", sym: "N"},
      {name: "oxygen", sym: "O"},
      {name: "fluorine", sym: "F"},
      {name: "neon", sym: "Ne"},
      {name: "sodium", sym: "Na"},
      {name: "magnesium", sym: "Mg"},
      {name: "aluminium", sym: "Al"},
      {name: "silicon", sym: "Si"},
      {name: "phosphorus", sym: "P"},
      {name: "sulfur", sym: "S"},
      {name: "chlorine", sym: "Cl"},
      {name: "argon", sym: "Ar"},
      {name: "potassium", sym: "K"},
      {name: "calcium", sym: "Ca"},
      {name: "scandium", sym: "Cs"},
      {name: "titanium", sym: "Ti"},
      {name: "vanadium", sym: "V"},
      {name: "chromium", sym: "Cr"},
      {name: "manganese", sym: "Mn"},
      {name: "iron", sym: "Fe"},
      {name: "cobalt", sym: "Co"},
      {name: "nickel", sym: "Ni"},
      {name: "copper", sym: "Cu"},
      {name: "zinc", sym: "Zn"},
      {name: "gallium", sym: "Ga"},
      {name: "germanium", sym: "Ge"},
      {name: "arsenic", sym: "As"},
      {name: "selenium", sym: "Se"},
      {name: "bromine", sym: "Br"},
      {name: "krypton", sym: "Kr"},
      {name: "rubidium", sym: "Rb"},
      {name: "strontium", sym: "Sr"},
      {name: "yttrium", sym: "Y"},
      {name: "zirconium", sym: "Zr"},
      {name: "niobium", sym: "Nb"},
      {name: "molybdenum", sym: "Mo"},
      {name: "technetium", sym: "Tc"},
      {name: "ruthenium", sym: "Ru"},
      {name: "rhodium", sym: "Rh"},
      {name: "palladium", sym: "Pd"},
      {name: "silver", sym: "Ag"},
      {name: "cadmium", sym: "Cd"},
      {name: "indium", sym: "In"},
      {name: "tin", sym: "Sn"},
      {name: "antimony", sym: "Sb"},
      {name: "tellurium", sym: "Te"},
      {name: "iodine", sym: "I"},
      {name: "xenon", sym: "Xe"},
      {name: "cesium", sym: "Cs"},
      {name: "barium", sym: "Ba"},
      {name: "lanthanum", sym: "La"},
      {name: "cerium", sym: "Ce"},
      {name: "praseodymium", sym: "Pr"},
      {name: "neodymium", sym: "Nd"},
      {name: "promethium", sym: "Pm"},
      {name: "samarium", sym: "Sm"},
      {name: "europium", sym: "Eu"},
      {name: "gadolinium", sym: "Gd"},
      {name: "terbium", sym: "Tb"},
      {name: "dysprosium", sym: "Dy"},
      {name: "holmium", sym: "Ho"},
      {name: "erbium", sym: "Er"},
      {name: "thulium", sym: "Tm"},
      {name: "ytterbium", sym: "Yb"},
      {name: "lutetium", sym: "Lu"},
      {name: "hafnium", sym: "Hf"},
      {name: "tantalum", sym: "Ta"},
      {name: "tungsten", sym: "W"},
      {name: "rhenium", sym: "Re"},
      {name: "osmium", sym: "Os"},
      {name: "iridium", sym: "Ir"},
      {name: "platinum", sym: "Pt"},
      {name: "gold", sym: "Au"},
      {name: "mercury", sym: "Hg"},
      {name: "thallium", sym: "Tl"},
      {name: "lead", sym: "Pb"},
      {name: "bismuth", sym: "Bi"},
      {name: "polonium", sym: "Po"},
      {name: "astatine", sym: "At"},
      {name: "radon", sym: "Rn"},
      {name: "francium", sym: "Fr"},
      {name: "radium", sym: "Ra"},
      {name: "actinium", sym: "Ac"},
      {name: "thorium", sym: "Th"},
      {name: "protactinium", sym: "Pa"},
      {name: "uranium", sym: "U"},
      {name: "neptunium", sym: "Np"},
      {name: "plutonium", sym: "Pu"},
      {name: "americium", sym: "Am"},
      {name: "curium", sym: "Cm"},
      {name: "berkelium", sym: "Bk"},
      {name: "californium", sym: "Cf"},
      {name: "einsteinium", sym: "Es"},
      {name: "fermium", sym: "Fm"},
      {name: "mendelevium", sym: "Md"},
      {name: "nobelium", sym: "No"},
      {name: "lawrencium", sym: "Lr"},
      {name: "rutherfordium", sym: "Rf"},
      {name: "dubnium", sym: "Db"},
      {name: "seaborgium", sym: "Sg"},
      {name: "bohrium", sym: "Bh"},
      {name: "hassium", sym: "Hs"},
      {name: "meitnerium", sym: "Mt"},
      {name: "darmstadtium", sym: "Ds"},
      {name: "roentgenium", sym: "Rg"},
      {name: "copernicium", sym: "Cn"},
      {name: "nihonium", sym: "Nh"},
      {name: "flerovium", sym: "Fl"},
      {name: "moscovium", sym: "Mc"},
      {name: "livermorium", sym: "Lv"},
      {name: "tennessine", sym: "Ts"},
      {name: "oganesson", sym: "Og"}
    ]

    def get_group()
      case electron_configuration.last.l
      when 1
        electron_configuration.last.electrons_count + 12
      when 0
        if electron_configuration.any?{|o| o.l == 2}
          electron_configuration.last.electrons_count + electron_configuration.select{|o| o.l==2}.max{|o| o.electrons_count}.electrons_count
        else
          electron_configuration.last.electrons_count
        end
      end
    end
    
    def get_name()
      LittleElementor::Helpers::ELEMENTS[@atomic_number-1][:name]
    end

    def get_e_c(sorted)                                                                                
      i = 0
      arr = []
      LittleElementor::Orbital.gen_orbitals.each do |orbital|
        break if i >= @atomic_number
        if (i == 18) and (@atomic_number == 29 or @atomic_number == 24)
          els = 1
        elsif (@atomic_number == 24 or @atomic_number == 29) and (i == 19)
          els = @atomic_number - 19
        else
          els = orbital.electrons_count > @atomic_number - i ? @atomic_number - i : orbital.electrons_count
        end
        arr << LittleElementor::Orbital.new(orbital.n, orbital.l, els)
        i+=els
      end
      return sorted ? arr.sort_by{|o| o.n} : arr
    end
  
    def get_c_e_c()
      if @period == 1
        [nil, electron_configuration]
      else
        i = LittleElementor::Helpers::PERIODS[0..@period-2].sum
        nobel_gas = LittleElementor::Element.new(atomic_number: i)
        c_e_c = electron_configuration.slice(nobel_gas.electron_configuration.length, electron_configuration.length-1).map(&:to_s)
        [nobel_gas, c_e_c]
      end
    end
  end
end
