const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.targetInMeleeRange &&
    s.playerInCombat &&
    s.spells.dragonsBreath.castable &&
    s.spells.dragonsBreath.equipped &&
    s.manaCurrent >= 500,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 8,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Dragons Breath'),
};
