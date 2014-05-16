


describe "Crossover", ->

  mom = undefined
  dad = undefined
  beforeEach ->
    mom = new Individual()
    dad = new Individual()

  describe "one point crossover", ->

    onePoint = undefined
    beforeEach ->
      onePoint = Crossover.onePoint(mom.genome, dad.genome)

    it "should return a genome of correct length", ->
      expect(onePoint.length).toEqual(mom.genome.length)

    it "should return a genome containing the correct values", ->
      expect(onePoint).toMatch([1,0])

  describe "two point crossover", ->

    twoPoint = undefined
    beforeEach ->
      twoPoint = Crossover.twoPoint(mom.genome, dad.genome)

    it "should return a genome of correct length", ->
      expect(twoPoint.length).toEqual(mom.genome.length)

  describe "uniform crossover", ->

    uniform = undefined
    beforeEach ->
      uniform = Crossover.uniform(mom.genome, dad.genome)

    it "should return a genome of correct length", ->
      expect(uniform.length).toEqual(mom.genome.length)
