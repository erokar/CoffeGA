
describe "Mutation", ->

  individual = undefined
  beforeEach ->
    individual = new Individual()

  describe "bitFlip() mutation", ->

    bitFlip = undefined
    beforeEach ->
      bitFlip = Mutation.bitFlip(individual.genome)

    it "should return a genome of the correct length", ->
      expect(bitFlip.length).toEqual(individual.genome.length)

  describe "inverse() mutation", ->

    inverse = undefined
    beforeEach ->
      inverse = Mutation.inverse(individual.genome)

    it "should return a genome of the correct length", ->
      expect(inverse.length).toEqual(individual.genome.length)


