
class Crossover

  # TODO: For some problems some order needs to be preserved. This is not implemented.
  # Example: Traveling Salesman -- first and last allele must be preserved.
  # However, this need not be implemented here.

  # Number -> Number
  @randomIndex: (min, max) ->
    return Math.floor(Math.random() * (max - min + 1)) + min

  # Array -> Array
  @onePoint: (mom, dad) ->
    index = @randomIndex(0, mom.length)
    return mom.slice(0,index).concat(dad.slice(index))

  # Array -> Array
  @twoPoint: (mom, dad) ->
    leftIndex = @randomIndex(0, mom.length-2)
    rightIndex = @randomIndex(leftIndex, mom.length)
    child = []
    for element, index in mom
      if index in [leftIndex..rightIndex]
        child.push(dad[index])
      else
        child.push(element)
    return child

  # Array -> Array
  @uniform: (mom, dad) ->
    child = []
    for element, index in mom
      if Math.random() < 0.5 then child.push(element) else child.push(dad[index])
    return child

window.Crossover = Crossover
