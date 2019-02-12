# Fluent Builder

> Helps to make builder patter with Fluent Interface.

```
builder.addChild(name: "li", text: "hello")
builder.addChild(name: "li", text: "world")
```
In Place of above we can make use of following
```
builder.addChildFluent(name: "li", text: "hello")
       .addChildFluent(name: "li", text: "world")
```



