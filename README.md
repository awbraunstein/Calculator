Calculator
==========

Andrew Braunstein

Single view calculator app for CIS 195

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
* Parser
    * Maybe use [ParseKit](http://parsekit.com/)
    * Possibly just hand roll it
    * Maybe transform infix notation to polish notation to do
      computations on
    
