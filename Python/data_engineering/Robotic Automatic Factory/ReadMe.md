**Robotic Automation Factory**


PROBLEM STATEMENT AND GUIDELINES: 

Instructions:

### Rules

Sort the packages using the following criteria:

A package is bulky if its volume (Width x Height x Length) is greater than 
or equal to 1,000,000 cm³ or when one of its dimensions is greater or equal to 150 cm.

A package is heavy when its mass is greater or equal to 20 kg.

dispatch the packages in the following stacks:

1. STANDARD: standard packages (those that are not bulky or heavy) can be handled normally.
2. SPECIAL: packages that are either heavy or bulky can't be handled automatically.
3. REJECTED: packages that are both heavy and bulky are rejected.

### Implementation

Implement the function **`sort(width, height, length, mass)`** 
(units are centimeters for the dimensions and kilogram for the mass). 
This function must return a string: the name of the stack where the package should go.

### Solution

Solution implemented in Python 3.12
