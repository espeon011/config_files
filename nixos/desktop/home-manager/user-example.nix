let
  name = "exampleuser";
in {
  inherit name;
  directory = "/home/${name}";
}
