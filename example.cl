
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

class Parent {
  bar():Bool {
    true
  };
  
  foo():Int {
    0
  };
};

class Child inherits Parent {
  baz():Bool {
    false
  };

  foo():Int {
    1
  };
};