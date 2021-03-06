const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.targetDebuffs.slow &&
    s.playerInCombat === true &&
    s.spells.slow.castable &&
    s.spells.slow.equipped &&
    s.manaCurrent > 243,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 7,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting slow'),
};
