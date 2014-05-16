
describe "Evolution", ->

  describe "initialization", ->

    evolution = undefined
    population = undefined
    fitnessFunction = undefined
    beforeEach ->
      population = (new Individual().genome for i in [0..10])
      fitnessFunction = (genome) -> genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.7, mutationRate=0.1)

    it "should have the correct population", ->
      expect(evolution.population).toEqual(population)

    it "should be initialized with crossoverRate", ->
      expect(evolution.crossoverRate).toEqual(0.7)

    it "should be initialized with correct fitnessFunction", ->
      expect(evolution.fitnessFunction(evolution.population[0])).toEqual(fitnessFunction(evolution.population[0]))

  describe "ranking", ->

    evolution = population = fitnessFunction = undefined
    beforeEach ->
      population = [[1,1,1], [2,2,2], [3,3,3]]
      fitnessFunction = (genome) => genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.7)

    it "should return the genome with the best fitness", ->
      expect(evolution.best()).toEqual([3,3,3])

  describe "tournamentSelection()", ->

    evolution = population = fitnessFunction = undefined
    beforeEach ->
      population = [[1,1,1], [2,2,2], [3,3,3], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1]]
      fitnessFunction = (genome) => genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.3)

    it "should return a factor of crossoverRate parents", ->
      expect(evolution.tournamentSelection().length).toEqual(3)

  describe "evolution works", ->
    winner = evolution = population = fitnessFunction = undefined
    beforeEach ->
      population = []
      for i in [0...10]
        population.push(((if Math.random() < 0.5 then  1 else 0) for x in [0...10]))
      fitnessFunction = (genome) => genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.3)

      generations = 0
      while winner is undefined
        generations++

        parents = evolution.tournamentSelection()
        children = []

        i = 0
        while i < parents.length - 1
          children.push(Crossover.onePoint(parents[i], parents[i+1]))
          i++

        # replace worst of children with new parents
        evolution.best() # implicitly ranks the population, not too clear...
        evolution.population.slice((evolution.population.length - children.length), (evolution.population.length))
        evolution.population.concat(children)

        #mutate population
        mutations = Math.round(evolution.population.length * 0.3)
        for i in [0..mutations]
          randomIndex = Crossover.randomIndex(0, evolution.population.length-1)
          evolution.population[randomIndex] = Mutation.bitFlip(evolution.population[randomIndex])

        for genome in evolution.population
          if fitnessFunction(genome) is 10
            winner = genome.slice()
            console.log(generations)


    it "should have a fitness of ten", ->
      expect(fitnessFunction(winner)).toEqual(10)

    it "should have a genome of only 1's", ->
      expect(winner).toEqual([1,1,1,1,1,1,1,1,1,1])














