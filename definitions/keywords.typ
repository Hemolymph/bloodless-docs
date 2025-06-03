= Keywords
At long last, this document provides a description of Bloodless keywords. When it's still unclear how to implement a keyword, a possible technical implementation is given. Sometimes, technical details may be given as well.

== Flying
When another creature attacks the space with this creature, it attacks as if it were an empty space.

=== Possible Technical Implementations
I think that instead of trying to figure out how to make this work as a form of triggered ability, Attacks can just care about Flying

== Flying Defense
When a creature with Flying attacks the space with this creature, it does not attack as if it were an empty space.

=== Possible Technical Implementations
Make Flying care about Flying Defense, not the other way around.

== Bifurcated Strike
This creature attacks the spaces to the sides of the space in front of it.

== Piercing
When this creature deals overkill damage to another creature, the other creature's defense cannot protect its controller.

=== Possible Technical Implementations
Bake it into attacks as well.

== Kin Call
When this creature is played, play another creature of the same kin for free.

== Kin Strength
This creature's strength is added to the number of creatures of its kin that are in the board.

== Kin Defense
This creature's defense is added to the number of creatures of its kin that are in the board.

== Explosive
#strike[This creature attacks the space in front of it and, if they have creatures, the spaces to its side.]

This keyword is being phased out. Explicit descriptions will be used instead.

== Cumulative
When this [card] enters [play zone], it gains 1 'Accumulate' counter.

Whenever you play another "[card name]", instead discard it and add one 'Accumulate' counter to this [card].

When this card has zero 'Accumulate' counters, it [dies/is terminated]

== Flip: [COST]
When you play this card, don't reveal it to your opponent.

You may [pay COST] to reveal it.

Unrevealed creatures are 1/1/1 with no text.

Unrevealed commands are 1/1/1 extended commands.

The cost may be a blood cost or it may be an action the player must perform.

=== Technical Notes
This works out because a card's abilities are active once they're in the play zone (and are known to both players). This means that revealing a command and a creature will work exactly as you are expecting.

The check that puts TAs into effect is done after every event.

== Expendable
Used to be 'Spell'. You may move this card to discard if you didn't play it this turn.

== Wandering [direction: left/right]
At the end of your turn, this creature moves one space to the [direction]


