#let enum_numbering = (..it) => {
  counter("enum").update(it.pos())
  numbering("1.1.", ..it)
}

#set enum(numbering: enum_numbering, full: true)

#show ref: it => {
  let el = it.element
  if el != none and el.func() == text {
    // Override enum references.
    link(el.location(), context numbering("1.1", ..counter("enum").at(el.location())))
  } else {
    // Other references as usual.
    it
  }
}

#show heading.where(depth: 1): set align(center);
#show heading.where(depth: 2): set align(center);
#set text(hyphenate: false, size: 12pt);
#set par(justify: true);

#[
  #set align(horizon + center)
  
  = The Comprehensive Rules of Bloodless
  Draft: 5.0.0


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

== Definitions
This chapter defines all types of values that are used to process a game of Bloodless. The following chapter defines the processes used by the game.

+ Lists
  + A list is a collection of various things of the same kind.
  + Unordered Lists
    + In an unordered list, there is no real sense of "first" or "last". It simply contains its objects.
  + Ordered Lists
    + In an ordered list, all elements have an index. The lowest index is the first element, and the highest index is the last element. All indexes are unique.<sortedListRule>
    + Adding an item to the "back" of an ordered list simply adds an element whose index is one plus the current highest.
    + Adding an item to the "front" of an ordered list adds 1 to all existing indexes and adds the new element with 0 as its index.
    + Adding an item at a specific index adds 1 to all indexes greater than or equal to the desired index, then puts the element at that index.
    + An ordered list can be shuffled, which consists of moving all elements to another index at random, respecting rule @sortedListRule.
+ Numbers
  + Natural numbers are defined as the set of positive integers with zero appended.
  + In Bloodless, a number is a natural number.
  + Whenever an operation between numbers results in a number outside the natural integers, the result is zero.
  + "Extended numbers" are natural numbers with positive infinity (#sym.infinity) appended. Positive infinity is defined by the following two properties:
    + It is greater than every natural number.
    + It is equal to itself.
  + Variables
    + A variable represents a number which may be Undefined.
    + In print, a variable is represented with a letter from the Latin or Greek alphabet. Variable numbers have two variants: Undefined and Defined. Their default state is Undefined.
    + The Defined variant contains a number. The Undefined variant contains no extra structure.
    + When the value of a number that is variable is needed and that number is in a Defined variant, the number it is Defined with is used.
    + When the value of a number that is variable is needed and that number is in its Undefined variant, it is zero.
+ Names
  + In Bloodless, Names are unique objects, which have representations in each language and medium.#linebreak()
    *Example*
    - "Ant Queen" is an English representation of a Name in Bloodless in a written medium.
    - "Hormiga Reina" is a representation of _the exact same name_, in different languages and mediums.
  + Every Name has an extended number associated with it, called its Limit. The default Limit for a name is 5.
+ Card Types
  + There exist two basic types: Command and Creature.
  + There exist _variants_ of types. These are considered the same type as the type they are a variant of, but not the other way around.#linebreak()
    *Examples*
    - "Extended Command Saga" is also considered an "Extended Command."
    - "Extended Command" is also considered a "Command."
    - "Creature" is *not* also considered a "Creature Saga."
    
  + Blood Flask is a variant of Creature.
  + Extended Command is a variant of Command.
  + All Creature and Command types have Saga variants.
  + All non-Vestige types have Vestige variants.
+ Events
  + An event represents a change to the state of the game.
  + When an event is applied, it creates an Outcome. The Outcome may be a Failure or a Success containing information about all cards and players involved in the event.
+ Abilities
  + Event-Modifying Triggered Abilities (EMTAs)
    + EMTAs have a trigger, which is an Event pattern.
    + When applied to an event that triggers it, an EMTA will result in a list of new events, defined by the specific EMTA.
    + When applied to an event that does not trigger it, an EMTA will just result in a list of  only that same event.
  + Event-Creating Triggered Abilities (ECTAs)
    + ECTAs have a trigger, which is an Outcome pattern. They also have a Consequence, with is an ordered list of events.
    + When triggered, they process their Consequence.
  + Passive Abilities
    + A Passive Ability modifies the state of a card as long as a condition is met, and undoes it when the condition is unmet.
    + In order to achieve this, a Passive Ability remembers the specific state change for everything that it modifies, if it has.
    + Passive Abilities have an opposite operation. For example, the opposite of adding two health is removing two health.
+ Rules Text
  + Rules Text, despite being called Text, is not actually a string of characters, but a list of either Abiliites or Events.
+ Faces
  + A Face may have a Name.
  + A Face may have a Cost. This number may be variable.
  + Type Properties
    + Creatures must have Health, Defense and Power, all of which may be variable. They also have Combat Targets, which are relative directions to spaces on the board.
 + A Face may have a Flip Cost. This number may be variable.
+ Card
  + A card has a main face, and a back face.
  + A card's Name, Cost, Flip Cost, Health, Defense and Power are those of its main face.
  + There exist certain rules that apply only to cards of a certain Type.
  + While a card is in an owned zone, the owner of that zone is the card's "controller".
  + A card's owner is the player who controls it when the game begins, or when it is created.
+ Places
  + A Place is a location where a card may be. A place may have at most one card.
  + All Places have an owner.
  + Places are also linked by Zones. All spaces in a Zone have defined collective behavior with one another.
    + Discard Pile: An unordered list of places.
    + Board
      + The Board consists of 8 places, called spaces, in a 4x2 grid. Each player owns one row.
      + Only cards of Creature type may be on the spaces of the Board.
    + Timeline: An ordered list of cards.
      + Only cards of Command type can be on the Timeline.
    + Hand: An unordered list of cards.
    + Deck: An ordered list of cards.
      + The first element of the Deck is also known as "the top" of the Deck.
      + The last element of the Deck is also known as "the bottom" of the Deck.
    + Aside: An unordered list of cards.
      + Cards in the Aside cannot be directly referenced by other cards, unless they had referenced them before they entered this zone.
  + In print, cards in the Board are called "creatures" and cards in the Timeline are called "commands", whereas cards in other zones are called "cards." Their type may be specified such as "creature card" or "command card." The only exceptions to these rule are:
    + Spawning, summoning, moving to board, where "creature" includes (but is not exclusive to) "creature cards".
    + Executing, moving to timeline, where "command" includes (but is not exclusive to) "command cards".
    + Playing, where "command" and "creature" include (but are not exclusive to) "command card" and "creature card" respectively.
+ Card States
  + Card States are attached to cards that are in play. When looking at a property of a card, the state is used instead.
  + A Card State's initial properties are those of the corresponding card.
  + A Card State may have Counters. Counters are numbers with names associated to them.
  + If a card does not have a counter of a certain number, it has zero of it. If a card has zero of a counter, it is also said to not have that counter.

== Processes
This section defines all processes in Bloodless. When playing a game of Bloodless, the Bloodless process is initiated.

Every process has its own "current step", separate from the process that initiated it. The process that initiated it can only move to the next step once all the processes it's started have finished. However, child processes can change the current step of processes that are unique, such as the Bloodless process.

When a process moves to a step, that step is immediately executed, even if a child process has not finished.

+ Applying Events
  + The outcome of an event contains the same information as the event itself. However, if the event contains patterns, the outcome will contain definite information. (e.g. a specific card instead of a card pattern).
  + Move
    + This event contains a card pattern (`target_card`), a place pattern (`target_place`), and an optional player pattern (`done_by`).
    + Let `card` be a match of `target_card`. This event fails if a match cannot be found.
    + Let `place` be a match of `target_place`. This event fails if a match cannot be found.
    + Let `by` be a match of `done_by` if there is a pattern. This event fails if a match cannot be found.
    + Let `from` be the place that `card` is in.
    + Move `card` to `place`
    + This event's Success contains `card`, `place` and `from`.
  + Play
    + Contains a card pattern to a command, a player pattern, an optional blood cost, an optional space on the board.
    + Player defines all the variable numbers present in the card's Cost.
    + If there is no cost in the event, the cost in the event is the same as the card's.
    + If the player has less blood than the paid blood cost, process ends here. Outcome is a failure.
    + If card is a command and there is a space, process ends here. Outcome is a failure.
    + If card is a creature and there is no space, space is chosen by player.
    + Player loses that amount of blood (process event)
    + Queue a move to the corresponding zone or space.
  + Draw
    + Contains a player pattern and a deck pattern.
    + Processes moving a card from the top of a matching deck to a matching player's hand.
    + Outcome additionally contains the car that was drawn.
  + End of Turn
    + Does not contain anything.
    + Changes active player so that it is now their opponent.
    + Clears event queue.
    + Outcome contains the previous player.
  + Search
    + Contains the player who will do the search, the deck that will be searched, and the pattern to be matched.
    + All cards in the deck become known to the player.
    + The outcome contains the cards found to match. If the pattern cannot be matched, the player Fails To Find. This is _not_ a failure outcome for this event (e.g. the next event in a "then" chain will work fine).
  + Shuffle
    + Contains which deck is shuffled.
    + Randomizes order of cards in a deck.
+ Creature Death Checks <creatureDeathChecks>
  + The active player's spaces  checked from left to right from their perspective. Then, the inactive player's, from left to right also from their perspective.
  + If one of the spaces has a creature with 0 health, process a "death" event for that creature.
+ Game End Condition Checks <gameEndChecks>
  + If the health pool is zero, process a "finish game" event of with the player who last received player damage losing and their opponent.
+ Processing A Player's Turn Skips <turnSkipsProcess>
  + If the player has more than zero turn skips, do game end condition checks, Bloodless moves to step @turnEnd.
+ Applying Passive Abilities
  + Every Passive Ability iterates through its targets.
  + If the target passes the condition:
    + If this Passive Ability is already modifying the target:
      + If the modification to be done has changed, change the state accordingly.
    + If this Passive Ability has not modified the target:
      + Change the state accordingly
  + If the target doesn't pass the condition:
    + If this Passive Ability has not modified the target:
      + Change the state accordingly
    + If this Passive Ability is modifying the target:
      + Modify the state oppositely
+ Resolving an Event
  + An ordered list of only the processed event is made. This is the current events list.
  + A new, empty ordered list of events is made. This is the future events list.
  + EMTAs are sorted by precedence.
  + Each EMTA is processed in the following way:
    + For each Event in the current events list:
      + If the Event does not match the EMTA's trigger, add it, unmodified, to the future events list.
      + Otherwise, apply the modification to it, and append the result to the future events list.
    + Then, make the current events list equal to the future events list.
    + Empty the future events list.
  + ECTAs are sorted by precedence.
  + Then, for each event in the current events list,
    + Apply the event to the current board state.
    + Apply each ECTA to the Outcome.
    + If the Outcome is of a Play-related event, process its next step.
  + Apply passive abilities
  + Process game end condition checks. (see @gameEndChecks)
  + Process creature death checks. (see @creatureDeathChecks)
  + Process turn skips. (see @turnSkipsProcess)
  + Then, players can make any instant speed decisions they are allowed to, if they have any.
+ Main Phase choices
  + The Active Player can choose to do one of the following things:
    + Playing a card from their hand.
    + If they have additional card draws, they can draw a card, then reduce the additional card draws by one.
    + Bloodless goes to step @mainPhaseEnd.
+ Bloodless
  + Players draw 5 cards from their main deck, then one from their blood deck.
  + If a player chooses to do so, they may Mulligan. They may only do this once. Continue with the next step once both players have decided to or not to mulligan.
  + Turn loop:<turnStart>
    + Process "start of turn" event for the active player.
    + If it is not the Active Player's first turn, their additional card draws are set to 1.
    + Process "start of main phase" event for the active player.
    + Main Phase loop:
      + The Active Player makes their Main Phase choices
    + Process "end of main phase" event for the active player. <mainPhaseEnd>
    + Process "start of attack phase" event for the active player.
    + Attack Phase loop: <attackLoop>
      + Currently attacking space is leftmost space
      + If currently attacking space has a creature, it attacks.
      + If there is a space right of the currently attacking space, the currently attacking space is now that space, and return to step @attackLoop.
      + Otherwise, continue to step @attackEnd.
    + Process "end of attack phase" event for active player.<attackEnd>
  + Process "end of turn" event.<turnEnd>
  + Continue with step @turnStart.

#pagebreak()
= Notes For This Draft
This draft is, like, violently incomplete. You wouldn't believe it.

It's missing:
- A list of triggers
- A list of events
- What, like, any pattern even is
- How ECTAs _actually_ create their consequence event using event outcomes
- Literally anything about flip costs??? oh my god
- When you play a card, you have to set all its undefined variables that are part of one of its stats
- Play card events self trigger
- Also technically events trigger other events trigger other events. Like when you play a command it goes play -> execute -> move to timeline
- Maaaaaaaaybe card parsing? That could probably be part of a separate chapter specific to English rules, since every language will have its own parsing scheme

Despite all of this... I'm actually quite happy with this structure? It feels like the first version of Bloodless' rules that has a chance to be complete. I think it's up to Yellow now, whenever he has the time and energy for this stuff. He's good at breaking everything I make (/pos \<3)
