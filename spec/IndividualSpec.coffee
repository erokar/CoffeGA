describe "Individual", ->

  describe "initialized without params", ->

    individual = new Individual()
    it "should be initialized as random binary array", ->
      expect(individual.genome).toMatch(1,0)

    it "should have a length of 10", ->
      expect(individual.genome.length).toEqual(10)

  describe "initialized with params", ->

    it "should have the right genome", ->
      genome = [{1,2}, {1,2}, {1,4}]
      individual = new Individual({genome: genome})
      expect(individual.genome).toEqual(genome)

    it "should have the right length", ->
      length = 20
      individual = new Individual({length: length})
      expect(individual.length).toEqual(length)

    it "should have the right permutations", ->
      alleles = ["a", "b", "c"]
      individual = new Individual({alleles: alleles})
      expect(individual.alleles).toEqual(alleles)

