
(*  Example cool program testing as many aspects of the code generator
    as possible.
 *)

class Main {
  foo : Int <- 5;
  main():Int { case foo of myInt : Int => 1;
  			   			   myBool : Bool => 2;
						   myObject : Object => 3;
			   esac
			 };
};

class Dummy {

};

class Child inherits Parent {
  attr3 : String;
  attr4 : Dummy;

  baz():Bool {
    false
  };

  foo():Int {
    1
  };
};

class Parent {
  attr1 : Int;
  attr2 : Bool;

  bar():Bool {
    true
  };
  
  foo():Int {
    0
  };
};
