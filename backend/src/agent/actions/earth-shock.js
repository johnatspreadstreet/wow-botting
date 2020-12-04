const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.playerInCombat &&
    s.spells.earthShock.castable &&
    s.spells.earthShock.equipped &&
    s.manaCurrent >= 500,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Earth Shock'),
};
