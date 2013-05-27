
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

