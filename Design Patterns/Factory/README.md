# Factory Design Pattern

- Object creation logic becomes too over populated.
- Initializers are not very descriptive.
- Object creation (not piecewise, unlike Builder) can be done either through a seperate Function (Factory Method) or a seperate class (Factory) if object very big or hierarchy of factories.


## Factory
A Component responsible solely for the complete creation of objects. (not parts of objects like in Builder)
