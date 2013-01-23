Calculator
==========

Andrew Braunstein

Single view calculator app for CIS 195

## Design 

* Input/Output
    * Keyboard
        * keypad with numbers and operators
        * second keypad with symbols and advanced functions (pi, e,
          sqrt, etc.)
        * Submit key
    * Echo area
        * Shows a representation of what has been typed by the user
        * Once the user hits submit, this will show the output
* Math
    * All math is floating point
    * If int(x) = float(x), show as an int, otherwise show with 3
      decimal places
    * Order of operations will be done with a binding value and how it
      associates (left or right)
    * The data will be computed on in a tree like manner recursively
      by applying the operator at the node of the tree to the left and
      right children.
* Parser
    * Maybe use [ParseKit](http://parsekit.com/)
    * Possibly just hand roll it
* Classes
    * Echo area - Deals with showing the user either what they have
      typed or what was computed
    * Parser - Parses the text into a tree like data structure that
      can then be evaluated by the calculator
    * Calculator - Deals with the computations and the current
      calculator state (history, last equation, constants, etc.)
