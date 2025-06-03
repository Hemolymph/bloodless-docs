#show heading.where(depth: 1): set align(center);
#show heading.where(depth: 2): set align(center);
#set text(hyphenate: false, size: 12pt);
#set par(justify: true);

#[
  #set align(horizon + center)
  
  = The Comprehensive Rules of Bloodless
  Draft: 1.0.1


  #set align(bottom)
  The Bloodless Team

  May 20th, 2025
  
]


#pagebreak()

#set page(numbering:"1");
== Semantic Versioning
#set align(left)
This document is versioned using the following pattern:

#align(center)[`<major version>.<minor version>.<patch>`]

Changes in the patch version will consist only of minor additions or changes to Bloodless, and aren't expected to have great ramifications in the majority of games. The order of rules is guaranteed not to change between patch versions.

Changes in the minor patch version will consist of additions that are expected to have ramifications in the game. The order of rules is guaranteed to not change between minor patch versions.

Changes in the major patch version are guaranteed to change the order of rules, and may change the meanings.
Changes in a major version may be labeled "style patches," meaning that the content of the rules has not been changed, but their order has. It is _not_ guaranteed that their meaning will not change, but this will be attempted.

#pagebreak()


#set enum(full: true)

= The Rules

+ General Rules
  + These rules apply to any Bloodless game.
  + In any situation where a card requires a player to violate a Bloodless rule, the card supersedes. The only exceptions are the rules in this "General Rules" section.
  + A player may concede at any time. Conceding a game results in a loss for the player that conceded, and a win for the opposite player.
  + A game's judges may declare that a game is unfinishable. Once they do, the game ends in a draw for both players.
  + When a player wins, their opponent loses. When a player draws the game, so does their opponent.
+ Numbers
  + Natural numbers are defined as the set of positive integers with zero appended.
  + In Bloodless, a number is a natural number.
  + Whenever an operation between numbers results in a number outside the natural integers, the result is zero.
  + "Extended numbers" are natural numbers with positive infinity (#sym.infinity) appended. Positive infinity is defined by the following two properties:
    + It is greater than every natural number.
    + It is equal to itself.
+ Cards
  + A card is a play element of Bloodless. A card has: Name (a string of characters), Type (a card type), and Cost (a number which may be a variable).
  + There exist certain rules that apply only to cards of a certain Type.
  + While a card is in an owned zone, the owner of that zone is the card's "controller".
  + A card's owner is the player who controls it when the game begins, or when it is created.
  + The basic Types are Creature and Command.
    + Blood Flask is a variant of Creature. It is unique in that "Creature" is not written in its full type name.
    + Creature and Extended Command both have Saga variants. 
    + Extended Command is a variant of Command.
    + All types, except for Vestige types, have a Vestige variant.
    + When a type is a variant of another one, it can also be used in its place. For example, a Creature Saga Vestige counts as a Creature and as a Creature Saga, but a Command does not count as a Command Vestige.
  + Type Properties
    + Creatures have Power, Defense and Strength. They also have an Attack, which consists of a pattern of relative directions to spaces in the Board.
  + Variables
    + A number in a card may be variable. A variable is represented with a letter from the Latin or Greek alphabet. Variable numbers have two variants: Undefined and Defined. Their default state is Undefined.
    + All numbers in a card represented with the same letter are the same number.
    + The Defined variant of a variable number contains a natural integer. The Undefined variant contains no extra structure.
    + When the value of a number that is variable is needed and that number is in a Defined variant, the number it is Defined with is used.
    + When the value of a number that is variable is needed and that number is in its Undefined variant, one of the following can happen:
      + If the same variable appears in the card's Cost, Power, Defense or Strength, it is zero.
      + Otherwise, the player chooses a value for it, following the restrictions specified on the card.
+ Deck Building
  + Every name has a limit associated with it, which may be any extended number. This is the maximum number of cards with that name that may be in a main deck.
    + All cards printed with a name where this number is other than five must have this limit printed on the card.
    + If a name does not have a number associated with it, it is five.
  + Deck building is the act of assembling a deck to use in Bloodless games.
  + During deck building, one must use only official Bloodless cards whose type is not a Vestige type.
  + Blood Decks
      + A blood deck is built out of six cards of Blood Flask type, four of which must be named "Blood Flask".
  + Main Decks
    + A main deck is built out of at least fifty cards. Each name in the card must not appear more times than its associated limit.
+ Zones
  + A Zone is a place where a card may be, and have an Owner. The zones are:
    + Discard Pile: An unordered collection of cards.
    + Board
      + A player's Board has four spaces in a row. Every card in the Board must be in a space. Every space can have at most one card.
      + Each of a player's spaces oppose one of their opponent's spaces.
      + The leftmost space of a player opposes the rightmost space of another player, and vice versa. The same applies to the two middle spaces.
      + Only cards of Creature type may be on the Board.
    + Timeline: An ordered list of cards.
      + Only cards of Command type can be on the Timeline.
    + Hand: An unordered list of cards.
    + Deck: An ordered list of cards.
    + Aside: An unordered list of cards.
      + Cards in the Aside cannot be directly referenced by other cards, unless they had been referenced before they entered this zone.
  + In card text, cards in the Board are called "creatures" and cards in the Timeline are called "commands", whereas cards in other zones are called "cards." Their type may be specified such as "creature card" or "command card."
+ The Bloodless State
  + The Bloodless State contains:
    + A record of all cards that exist in the current game.
    + The health pool, which is a number.
    + The state of each player.
    + A list of Event-Creating Triggered Abilities.
    + A list of Event-Modifying Triggered Abilities.
  + The state of a player contains:
    + Their amount of Blood.
    + The state of all of their Zones.
    + Their additional card draws.
+ Events
  + An event represents a change to the state of the game. Applying them to the state of the game may require a player to make a choice.
  + When an event is processed, it creates an Outcome. The Outcome may be a Failure or a Success, containing information about all cards and players involved in the event.
  + Before an event is processed, Event-Modifying Triggered Abilities are ran on it. The resulting events are executed, with Event-Creating Triggered Abilities ran on each outcome.
+ Triggered Abilities
  + All triggered abilities have a Trigger, which is an Event Pattern.
  + All triggered abilities have a precedence order, defining which ones happen before others. If two cards have exactly equal precedence, the active player decides their order.
  + Event-Modifying Triggered Abilities (EMTA)
    + An EMTA is applied to an Event to produce a list of Events. This allows the EMTA to turn an event into multiple ones.
  + Event-Creating Triggered Abilities (ECTA)
    + An ECTA is applied to an Outcome and may cause Events to be processed.
    + When applying an ECTA to an Outcome, a list of Card Patterns is created from it and associated with the specific cards related to each pattern. These patterns are what will be used with the ECTA's Consequence to create the Event that will be processed if it is triggered.
+ Event Processing
  + This section describes the steps to process one event. Event processing is a recursive operation, as the triggering of an ECTA may cause yet another event to be processed.
  + An ordered list of only that event is made. This is the current events list.
  + A new, empty ordered list of events is made. This is the future events list.
  + Each EMTA is processed in the following way:
    + For each Event in the current events list:
      + If the Event does not match the EMTA's trigger, add it, unmodified, to the future events list.
      + Otherwise, apply the modification to it, and append the result to the future events list.
    + Then, make the current events list equal to the future events list.
    + Empty the future events list.
  + Then, for each event in the current events list,
    + Apply the event to the current board state.
    + Apply each ECTA to the consequence.
+ Starting A Game
  + For a game to start, each player must have built a main deck and a blood deck.
  + The player to have the first turn must be decided:
    + If both players have had a game before in the same set or tournament, the player who lost the last game will have the first turn.
    + Otherwise, if the current context provides a metric for each player's skill, the player with the lowest ranking in that metric will have the first turn.
    + Otherwise, if both players can agree on who will have the first turn in under a minute, the chosen player will have the first turn.
    + Otherwise, it is chosen at random.
  + Once a player is chosen, both players draw 5 cards from their main deck and 1 card from their blood deck.
   + A player may choose to shuffle the cards back into their decks, then draw again. This is called a Mulligan. Players may perform at most one Mulligan.
  + Once each player has chosen to either perform a Mulligan or not, the first turn starts.
+ During a Game
  + Bloodless is played in turns. The player whose turn it currently is, is called the "active player," and their opponent is called the "inactive player."
  + Before the beginning of a turn, and before any abilities triggered by the beginning of a turn are checked, players' additional card draws are set to one.
  + The Main Phase
    + During this phase, while no events are being processed, the active player may play any cards they have in hand by paying their cost.
    + While no events are being processed, if the active player has additional card draws, they may draw a card from either of their decks. This will reduce their amount of additional draws by one.
    + While no events are being processed, the active player may decide to enter the attack phase.
  + The Attack Phase
    + During the attack phase, creatures attack from left to right from the perspective of the active player.
      + If the attack phase is interrupted, this process ends.
    + Particularly, each space from left to right is checked. If it has a creature, that creature attacks.
    + Once all creatures have attacked, the attack phase ends, and the opposing player's turn begins.
+ Attacks
  + When a creature attacks, it strikes the spaces defined in its attack pattern.
  + Attacks are exclusive to the Attack phase, but Striking is not.
+ Winning a Game
  + After every event, the value of the Health Pool is checked. If it is zero, the last player to have taken damage loses, and their opponent wins.
+ Types of Events
  + This section details the types of events that exist in the game.
  + All event outcomes contain the information that their events had. If the information in the event was a pattern, the outcome contains the specific target.
  + Strike
    + Contains an attacker, a target pattern and a number pattern for an amount of damage.
  + Attack
    + Contains an attacker, a target pattern and a number pattern for an amount of damage.
  + Draw
    + Contains a player pattern and a deck pattern.
    + Its outcome, additionally, contains the card that was drawn.
  + Liberate
    + Contains a card pattern.
    + Its outcome does not contain the card that was liberated, as it does not exist. Instead, it contains the pattern.
+ Patterns
  + Patterns are ways to match things, such as when selecting "a creature with cost less than two."
  + TODO!
