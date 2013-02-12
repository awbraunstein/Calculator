Calculator
==========

Andrew Braunstein

Single view calculator app for CIS 195

## Functionality

### Behavior

Once an expression is evaluated, the response is shown in the echo
area. Upon pushing any other button, the echo area will clear
automatically.

If the first button you push is an operator (+, x, -, ^, ÷), the first
argument will be the last answer. The last answer defaults to 0.

If there are two values next to each other, there is implicit
multiplication. For example, 4π will be expanded to 4 x π before
evaluation. Multiplication is also implicit with parentheses. For
example, 4(3 + 2) will be the same as 4 x (3 + 2). This works on the
other side of the parentheses as well.

Division by 0 results in Inf, except when we divide 0 by 0 (here the
answer is nan). We can still operate on Inf and nan as if they are
numbers. If the answer is still computable, then you will get a real
number, otherwise, the app will return nan.

### Errors

All errors will write to the echo area and will be cleared upon
pressing any button.

Errors:
* Mismatched Parentheses
* Illegal number
    * Any number that is poorly formatted, either due to decimal
      points or negative signs.
* Incorrect number of arguments to this operator
    * If an operator is used incorrectly
* Values left on the stack
    * This may be an error attributed to incorrect use of operators,
      but will most likely never be thrown

### Interesting Buttons

(-) is negation

^ is exponentiation

c is clear


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
