// Generated by CoffeeScript 1.7.1
(function() {
  var Evolution;

  Evolution = (function() {
    function Evolution(population, fitnessFunction, crossoverRate, mutationRate) {
      this.population = population;
      this.fitnessFunction = fitnessFunction;
      this.crossoverRate = crossoverRate;
      this.mutationRate = mutationRate;
    }

    Evolution.prototype.rank = function(genomes) {
      return genomes.sort((function(_this) {
        return function(a, b) {
          if (_this.fitnessFunction(a) > _this.fitnessFunction(b)) {
            return -1;
          } else {
            return 1;
          }
          return 0;
        };
      })(this));
    };

    Evolution.prototype.best = function() {
      this.population = this.rank(this.population);
      return this.population[0];
    };

    Evolution.prototype.tournamentSelection = function() {
      var i, numberOfParents, parents, selected, _i, _j, _ref;
      numberOfParents = Math.round(this.population.length * this.crossoverRate);
      parents = Array();
      for (i = _i = 1; 1 <= numberOfParents ? _i <= numberOfParents : _i >= numberOfParents; i = 1 <= numberOfParents ? ++_i : --_i) {
        selected = Array();
        for (i = _j = 0, _ref = Math.round(this.population.length * 0.3); 0 <= _ref ? _j <= _ref : _j >= _ref; i = 0 <= _ref ? ++_j : --_j) {
          selected.push(this.population[Math.floor(Math.random() * this.population.length)]);
        }
        selected = this.rank(selected);
        parents.push(selected[0]);
      }
      return parents;
    };

    return Evolution;

  })();

  window.Evolution = Evolution;

}).call(this);

//# sourceMappingURL=Evolution.map