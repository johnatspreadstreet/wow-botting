const robot = require('robotjs');

module.exports = {
  condition: (s) =>
    !s.buffs.innerFire &&
    s.spells.innerFire.castable &&
    s.spells.innerFire.equipped,
  effect: (s) => {
    s.targetIsDead = true;
    return s;
  },
  cost: (s) => 9,
  act: (k) => robot.keyTap(k),
  log: (l) => l.info('Casting Inner Fire'),
};
