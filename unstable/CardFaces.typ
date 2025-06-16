= Card Faces
The current existance of the Flip ability demands the possibility of cards that have two faces. The current model of what a Card is is not capable of supporting this idea.

== Technical Implementation
The following changes are additive where they have to be and modify rules wherever they need to. This is not a complete list of modifications needed to implement the system, but more of an outline for how this system would be implemented.

The States section of the comprehensive rules is long overdue, and this system relies on it.

+ Card Faces
  + A card face has: Name (optional), Type (optional), and Cost (a number which may be a variable).
  + A card face may have a Flip Cost (a number which may be a variable).
  + The "Back Face" is defined as a face with no name, no type, and a cost of 1 blood.
  + The "Blood Flask Back Face" is defined as a face with no name, no type, and a cost of 1 blood. It is distinct from the regular "Back Face" as, when revealed, it tells the opponent that the other side is a Blood Flask.

+ Cards
  + A Card has a main faces, and a back face. 
  + A Card's Name, Type and Cost are determined by its main face. If the main face has no Type, the type of the back face is used. If the back face does not have type either, the card is invalid.
  + A face's text may affect the other face's text.

+ States
  + Creature State
    + The creation of a creature's state is always based on a card. The state is created with the stats and properties of the card's front face (such as Name, Cost, or Text) unless otherwise specified.
    + A creature's state includes whether it's Flipped. A Flipped creature's front face is its respective card's back face, and vice versa.
