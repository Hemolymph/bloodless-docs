#show heading.where(depth: 1): set align(center);
#show heading.where(depth: 2): set align(center);
#set text(hyphenate: false, size: 12pt);
#set par(justify: true);

= Bloodless
Bloodless is a competitive 2-player card game where players make their own decks of cards and use them to combat against each other. The main quirk of Bloodless is that both players have a shared health pool. When a player is damaged, this shared pool goes down.

The health pool starts at 20. The player who brings it to zero is the winner.

== Getting Started
Before you play a game of Bloodless, you must build two decks: Your Main Deck and your Blood Deck.

Your Blood Deck consists of 6 cards whose type is Blood Flask. Four of these cards have to be named "Blood Flask". Most cards have their type written under their image, and their name above it. If a card does not have its type written anywhere, it is a Creature.

Your Main Deck consists of 50 cards whose type is neither Blood Flask nor a Vestige type. The same card name cannot appear more than 5 times in a row, although some cards override this limit.

Cards that override this limit will have something like "Limit: 12" (for a card whose name can appear 12 times in your deck) or "Unlimited" (for a card that can appear as many times as you want) written on them.

There is no limit to how many cards your Main Deck can have, as long as you follow these rules. You also need physical tokens to represent how much health there is left, how much damage a card has received, how much blood you have, among other things. Make sure you can remember what each token means!


== The Zones

The space where Bloodless is played is divided in a few zones:

#figure(
  image("images/board.svg", width: 80%),
)

- The players' Hands: This is where you can play cards from. Cards in your hand are only known to you.
- The players' Decks: This is where you draw cards.
- The players' Discard Piles: This is where cards go when they're out of play.
- The players' Timeline: Some cards called "commands" are played here. You will read about them in the *Card Types* section.
- The Board: This is where combat happens and where creatures are played.

The Timeline is the zone where Commands are played. 

== How To Read A Card
Most cards are structured like this:

#figure(
  image("images/bee.svg", width: 80%),
)

At the very top of the card, is its name. This is a "Bee".

On the top right corner of its image, is its blood cost. If a card costs no blood, nothing will appear there. If a card costs 1 blood, it will only have the icon of a drop of blood. In all other cases, the amount of blood appears together with the blood icon. This Bee costs 1 blood.

Below the image, the card's type line may appear. If there is no type line, the card is of type "Creature". You can read everything about types in the *Card Types* section. This Bee has no type line, so it is a Creature. A type line might look something like this:

#figure(
  image("images/typeline.png", width: 80%),
)

Below the card's type line (or below the image, if there is no type line) is the card's text. The text in a card tells you what it does, including things like kins, keywords and "devours" or "evolves" conditions.

The lighter-colored text below the rules text is the flavor text, which is not considered part of the card's text at all, and doesn't affect the game in any way. The flavor text tells you more about a card's relation to the world and characters of Bloodless.

#figure(
  image("images/flavor.png", width: 80%),
)

On creatures, the numbers at the bottom indicate its Health, Defense and Power. Power is how much damage your card does in a single strike, and Health is how much damage it can take before it dies. Defense is how much it can protect you from Overkill Damage, and will be explained in the *Card Types* section

== Card Types
=== Creatures
A Creature is played it one of four spaces on the Board. During your attack phase, all your creatures attack from left to right from your perspective. A Creature may also have other abilities written on it.

A Blood Flask is a kind of Creature. When you play a Blood Flask, you gain one blood, which you can use to play other cards. You can discard a Blood Flask on any turn except for the same turn you where you played it.

When a creature takes damage, that damage stays on it permanently, and is not regenerated at end of turn like in other card games. When a creature's health is zero, it dies, and is moved to discard.

If a creature takes more damage than it currently has health (called Overkill Damage), this extra damage goes to the shared health pool. However, its Defense will protect them from some (or all) of this damage. If Defense is not enough to protect your opponent from Overkill Damage, you gain 1 blood.

When a creature dies, its controller gains 1 blood.

=== Commands
A Command is played on the Timeline. A non-extended command will move to discard right after its effect is completed.

An Extended command will stay on the Timeline, and it will only be Finished once some condition (which is written on the card) is met. Unlike similar card types from other games, a Command can only be executed during your turn's main phase.

=== Vestiges

A Vestige is a card of any other type that cannot start in your deck. It does not exist within the game until it is "created" or "spawned" by another card's abilities. A Vestige still counts as the type contained within it, so a "Creature Vestige" is still a kind of Creature.

=== In Card Text

When reading a card, the words "creature" or "command" refer to cards of type Creature (or Command) that are currently in play. "Creature card" and "command card" are the same, but for out-of-play cards. Similarly, "card" only refers to out-of-play cards of any type.

The only exception to this rule are effects that directly involve moving a card to its play zone. In these, the words "command" and "creature" also include (but are not limited to) creature cards and command cards.

== Playing a Card
Playing a card is simple. You pay an amount of blood, and the card moves to its play zone.

When you play a Command, it moves to your Timeline, and its effect takes place.

An effect may be affected by other cards' abilities. For example, a command may say "draw a card" while an ability from something that's already in play says "whenever you draw a card, your opponent draws a card".

In this case, the command's effect is only completed once your opponent has also drawn the card. At this point, it moves to discard.

When you play a Creature, it goes to an empty space on the Board (you can choose which). After it goes there, all of its abilities become active. When it leaves the Board, its abilities stop being active.

The effects created by a creature can also be affected by other effects.

If an ability is triggered when you play a card or when it enters its play zone, it _can_ trigger itself when you play.

For example, you must draw a card when you play a creature that says "whenever you play a creature, draw a card".

== Start The Game
When the game starts, both players draw 5 cards from their main deck, and 1 card from their blood deck. If a player doesn't like the card that they drew, they can shuffle them back into their decks and draw new ones. This is called a Mulligan. A player can only do one Mulligan per game.

Once it is decided that both players will keep their hands, the game can start.

== Playing a Turn
Bloodless is played in turns. Your turn has a Main phase and an Attack phase. The Main phase is where you can play cards. The Attack phase is where your creatures attack.

Once per turn, while there are no ongoing effects being resolved, you can draw a card from either your main deck or your blood deck. You cannot do this if this is your first turn.

At any moment, while no effects are ongoing, the player may choose to enter the attack phase, where creatures attack from left to right from their perspective.

If a creature that already attacked is moved to a space that has not yet attacked, it will get to attack twice. The opposite is true - if a creature that has not attacked yet moves to a space that already attacked, it will not attack.

If a creature attacks an empty space, the shared health pool is damaged instead, and the owner of the creature gains 1 blood.

Once all your creatures attack, your turn ends, and your opponent's turn begins. If the attack phase is ended prematurely (by a card ability that skips your turn, for example), the cards that have not yet attacked will *not* attack, but ongoing effects will finish resolving.

= A Few Final Things!

Striking is not the same as Attacking. When a card says that a creature attacks somewhere, that's a change to the pattern it will use during the attack phase, whereas saying that a creature strikes somewhere makes the card strike right then and there.

Abilities that say "once something happens ..." become inactive once they are triggered. Moving the card out and back into play will reset this, though, as ablities become active when their card enters its play zone.

When a card tells you to draw a card and does not say from which deck, assume it is your main deck.