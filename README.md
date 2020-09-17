# Little-Elementor
Little-Elementor is a little library that gives you minimum information about an element (by the given atomic number)

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

There is also an `electron_configuration()` instance method with an optional named argument `sorted` (default: `true`) that returns an `Array` of instances of `Orbital`.
And Also the `Orbital#to_s` method is overwrited for more human-friendly output.

## Usage
```ruby
require 'little-elementor'
cu = LittleElementor::Element.new(30, -1) # the second argument (`charge`) is optional. (default: `0`)
puts cu # output:

 # Symbol: Cu
 # is a noble gas?: false
 # charge: -1
 # name: copper
 # atomic_number 29
 # sorted electron configuration: ["1S2", "2S2", "2P6", "3S2", "3P6", "3D10", "4S1"]
 # electron configuration: ["1S2", "2S2", "2P6", "3S2", "3P6", "4S1", "3D10"]
 # period: 4
 # group: 11

```
*Important*: Lanthanides and actinides are not supported yet. 