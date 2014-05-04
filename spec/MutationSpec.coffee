
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

    it "should return a different genome", ->
      expect(bitFlip).not.toEqual(individual.genome)

  describe "inverse() mutation", ->

    inverse = undefined
    beforeEach ->
      inverse = Mutation.inverse(individual.genome)

    it "should return a genome of the correct length", ->
      expect(inverse.length).toEqual(individual.genome.length)

    it "should return a different genome", ->
      expect(inverse).not.toEqual(individual.genome)

