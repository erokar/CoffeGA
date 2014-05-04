
class Mutation

  @randomIndex: (min, max) ->
    return Math.floor(Math.random() * (max - min + 1)) + min

  # Array of (0,1) -> Array of (0,1)
  # NB: Can only be used with binary values
  @bitFlip: (genome, rate=0.2) ->
    genomeLength = genome.length
    numberOfMutations = Math.floor(genomeLength * rate)
    for i in [0...numberOfMutations]
      index = Math.floor(Math.random() * genomeLength)
      if genome[index] == 0
        genome[index] = 1
      else
        genome[index] = 0
    return genome

  # Array -> Array
  # swaps the position of to elements in the genome
  # NB: The first and last elements are not affected (to make it work with
  # The Traveling Salesman Problem)
  @inverse: (genome) ->
    index1 = @randomIndex(1, genome.length - 1)
    index2 = @randomIndex(1, genome.length - 1)
    [genome[index1], genome[index2]] = [genome[index2], genome[index1]]
    return genome

this.Mutation = Mutation
