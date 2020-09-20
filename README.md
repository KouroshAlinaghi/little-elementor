# Little-Elementor
[Little-Elementor](https://elementor-web.herokuapp.com/) is a little library that gives you minimum information about an element (by the given atomic number)

## Classes

The program has two classes:

### Orbital

Here are the `Orbital`'s instance variables:

| Name | Type | 
| ---- | ---- |
| `@n` | `Integer`  |
| `@l` | `Integer`  |
| `@electrons_count` | `Integer` |

### Element

| Name | Type |
| ---- | ---- |
| `@atomic_number` | `Integer` |
| `@is_nobel_gas`  | `Boolean` |
| `@name` | `String` |
| `@period` | `Integer` |
| `@group` | `Integer` |
| `@charge` | `Integer` |
| `@symbol` | `String` |
| `@compressed_electron_configuration` | `[Orbinal's instance, [...electron_configuraition...]]` |

**Tip:** Call `ELement#human_friendly_c_e_c()` for human-friendly output.
There is also an `electron_configuration()` instance method with an optional named argument `sorted` (default: `true`) that returns an `Array` of instances of `Orbital`.
And Also the `Orbital#to_s` method is overwrited for more human-friendly output.

## Usage
```ruby
require 'little_elementor'
cu = LittleElementor::Element.new(atomic_number: 30, charge: -1) # the second argument (`charge`) is optional. (default: `0`)
puts cu # output:

 # Compressed Electron Configuration: [Ar] 3D5, 4S1
 # Symbol: Cu
 # is a noble gas?: false
 # charge: -1
 # name: copper
 # atomic_number 29
 # sorted electron configuration: ["1S2", "2S2", "2P6", "3S2", "3P6", "3D10", "4S1"]
 # electron configuration: ["1S2", "2S2", "2P6", "3S2", "3P6", "4S1", "3D10"]
 # period: 4
 # group: 11

 # to create a new element instance, you can use three named arguments: symbol, atomic_number, charge (optional)

```

**Important**: Lanthanides and actinides and Transition metals are not supported yet. 
