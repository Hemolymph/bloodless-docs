= Bloodless Localization Specification (v0.0.3)
This specification describes the nuances that the Bloodless card game's cards must be able to unambiguously express in any localization.

== Objects
For the purposes of this specification, what is coloquially refered to as a "card" will be referred to as an "object", as the word "card" is reserved (see card types).

In English, the word Object is avoided in all cards and is treated as a technical term intended for judges and 'anhemologist' players, however, localizations MAY do it differently. If it is necessary to have a common-use term for objects, it is recommended for it to be something colloquially associable with physical playing cards, such as "card." If this is done, be careful with other distinctions related to the chosen word.

== References & Determinacy
A reference is a phrase which refers to a game element. This element may be concrete, such as a card or a player, or abstract, such as a number.

In Bloodless, a reference may be indeterminate or determinate. A determinate reference refers to something that is known, whereas an indeterminate reference may require a decision from a player in order to become determinate.

=== Examples
In English, there exist a few ways to express determination and indetermination. Consider these examples:

- A command
- Any card
- Those creatures
- Your opponent
- You

The first two examples are indeterminate, as they don't refer to any one game object, but instead require an external context (usually a decision from the player) to decide which one it is.

The next examples are determinate. The first example assumes an indeterminate instance of a creature is already bound For the other two, "you" is always known to be the controller of a card, and when the card has no controller, it is known to be its owner.

This distinction MUST be preserved. Determinate bindings MUST resolve to the same indeterminate bindings in the official English cards. Which determinate binding refers to which indeterminate binding MUST be clear.

The following effect is malformed, as it isn't clear which creature the word "ìt" refers to.

#quote(block: true)[Whenever a creature attacks another creature, it gains +1 power.]

#pagebreak()
== Patterns
References are accompanied by what is called a Pattern. In an indeterminate reference, the pattern restricts what it can be bound to, and in a determinate reference, it restricts what variables it looks for.

Patterns are things like "killed creature", "drawn card" or "increased counter". They MUST match their English counterpart. Details MUST NOT be added or removed.

=== Example
If in English, a card says the following:

#quote(block: true)[Execute a command from your hand, and move *the command* to your deck]

Another language MUST NOT say something like the following:

#quote(block: true)[Execute a command from your hand, and move *the executed command* to your deck]

These are two different effects with completely different repercusions on the game.

== Then vs. And
Bloodless distinguishes two ways to chain events. "Then" and "and".

A "then" chain expects the previous event to have succeeded - if it failed, it doesn't do the next.

An "and" chain does not care about this.

This distinction MUST be preserved.

== Whenever
In Bloodless, "whenever" actually means "right after". This is clear in English because the word "whenever" in an imperative sentence comes with the connotation that you're waiting for a signal to then follow an instruction or make something happen.

If this would be confusing in another language, the clearest option SHOULD be used.
