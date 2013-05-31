Class Main inherits IO {
  main() : SELF_TYPE {
    {
      out_int((1 + 1));
      if 2 = (1 + 1) then out_string("\nEQ\n") else out_string("\nNOT EQ\n") fi;
    }
  };
};