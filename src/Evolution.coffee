


class Evolution

  constructor: (@population, @fitnessFunction, @crossoverRate, @mutationRate) ->

  rank: (genomes) ->
    genomes.sort (a, b) =>
      if @fitnessFunction(a) > @fitnessFunction(b) then return -1 else return 1
      return 0

  best: ->
    @population = @rank(@population)
    return @population[0]

  tournamentSelection: ->
    numberOfParents = Math.round(@population.length * @crossoverRate)
    parents = Array()
    for i in [1..numberOfParents]
      selected = Array()
      for i in [0..Math.round(@population.length * 0.3)]
        selected.push(@population[Math.floor(Math.random() * @population.length)])
      selected = @rank(selected)
      parents.push(selected[0])
    return parents



window.Evolution = Evolution
