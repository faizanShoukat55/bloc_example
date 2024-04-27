abstract class Shape
{
  void draw();
}

class RoundedRectangle implements Shape {
  @override
  void draw() {
    print("RoundedRectangle");
  }
}
class RoundedSquare implements Shape {
  @override
  void draw() {
    print("RoundedSquare");
  }
}
class Rectangle implements Shape {
  @override
  void draw() {
    print("Rectangle");
  }
}
class Square implements Shape {
  @override
  void draw() {
    print("Square");
  }
}

///
abstract class AbstractFactory
{

  Shape? getShape(String shapeType);
}

///
class ShapeFactory extends AbstractFactory
{
  @override
  Shape? getShape(String shapeType)
  {
    if (shapeType == "RECTANGLE") {
      return Rectangle();
    } else if (shapeType == "SQUARE") {
      return Square();
    }
    return null;
  }
}
class RoundedShapeFactory extends AbstractFactory
{
  @override
  Shape? getShape(String shapeType)
  {
    if (shapeType == "RECTANGLE") {
      return RoundedRectangle();
    } else if (shapeType == "SQUARE") {
      return RoundedSquare();
    }
    return null;
  }
}

///
class FactoryProducer
{
  static AbstractFactory getFactory(bool rounded)
  {
    if (rounded) {
      return RoundedShapeFactory();
    } else {
      return ShapeFactory();
    }
  }
}