= Passive Everything
An extension of passive modifications.

A property from similar card games that would be interesting to also have in bloodless is the fact that cards have the ability to override rules of the game. Because Bloodless is defined as an algorithm, however, this is difficult to implement. While injecting behavior into parts of the game's processes is not necessarily difficult (the events system is just one example of such an injection system), we need ways to inject behavior into every structure the game defines as well.

The game is already considered to do this through the majorly undocumented mechanism of Passive Modifications. It is said that, when a number on a card is looked at, it is then put through these modifications. The actual value utilized is returned at the end of this pipeline. This naive description comes with certain problems (like would be infinite loops), but those will be addressed in this proposal.

Under this proposal, every part of the game would be capable of having its own layer of modifications before being truly observed. As an example, to obtain a space's adjacencies, you check if there are no modifications altering the base adjacencies.

== Looping
The main problem with passive modifications is infinite loops. Consider the following two effects:

- Creatures with 1 health gain +1 power.
- Creatures with 1 power gain +1 health.

Let's consider a 1/0/0 creature.

- Suppose we want to know a creature's power.
- During checking the power, we find a modification cares about the health, so we check that first.
- During checking the health, we find an modification that cares about power, so we check that first.
- During checking the power, we find a modification cares about the health, so we check that first.
- This is an ability we've seen before, causing an infinite loop.

Our proposed solution is to force looping points to return an unchanged state. The previous step would end up like this:

- This is a loop, so we return a base health. It is a 1/0/0
- Health is 1, so the creature gains +1 power. It is a 1/0/1
- Power is 1, so the creature gains +1 health. it is a 2/0/1
- Health is 2, so the power stays at 2.
- The creature's power is 2.

Now consider the case where we want to know its health.

- Suppose we want to know a creature's health.
- During checking the health, we find a modification cares about the power, so we check that first.
- During checking the power, we find an modification that cares about health, so we check that first.
- During checking the health, we find a modification cares about the power, so we check that first.
- This is an ability we've seen before, so we return base power. 1/0/0
- Power is 0, so health is unchanged. 1/0/0
- Health is 1, so power is changed. 1/0/1
- Power is one, so health is changed. 2/0/1

As you can see, the result is the same.
