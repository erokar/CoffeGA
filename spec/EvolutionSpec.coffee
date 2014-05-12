
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

    it "should be initialized with mutationRate", ->
      expect(evolution.mutationRate).toEqual(0.1)

    it "should be initialized with correct fitnessFunction", ->
      expect(evolution.fitnessFunction(evolution.population[0])).toEqual(fitnessFunction(evolution.population[0]))

  describe "ranking", ->

    evolution = population = fitnessFunction = undefined
    beforeEach ->
      population = [[1,1,1], [2,2,2], [3,3,3]]
      fitnessFunction = (genome) => genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.7, mutationRate=0.1)

    it "should return the genome with the best fitness", ->
      expect(evolution.best()).toEqual([3,3,3])

  describe "tournamentSelection()", ->

    evolution = population = fitnessFunction = undefined
    beforeEach ->
      population = [[1,1,1], [2,2,2], [3,3,3], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1], [1,1,1]]
      fitnessFunction = (genome) => genome.reduce (previous, current, index, array) -> previous + current
      evolution = new Evolution(population, fitnessFunction, crossoverRate=0.3, mutationRate=0.1)

    it "should return a factor of crossoverRate parents", ->
      expect(evolution.tournamentSelection().length).toEqual(3)




