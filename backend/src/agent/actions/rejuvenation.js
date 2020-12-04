const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    s.spell.rejuvenation.active === false &&
    s.spells.rejuvenation.castable &&
    s.spells.rejuvenation.equipped &&
    s.health < 85 &&
    s.mana > 30,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 2,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Rejuvenation'),
};
