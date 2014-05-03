
class Individual

  constructor: (args = {}) ->
    @length = args.length ? 10
    @alleles = args.alleles ? [1,0]
    @_genome = args.genome ? @initialize()

  Object.defineProperties @prototype,
    genome:
      get: -> @_genome.slice()
      set: (genome) -> @_genome = genome

  initialize: ->
    @alleles[Math.floor(Math.random() * @alleles.length)] for i in [1..@length]
    #result = []
    #for i in [1..@length]
    #  result.push(@alleles[Math.floor(Math.random() * @alleles.length)])
    #return result

window.Individual = Individual