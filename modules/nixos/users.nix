{ ... }:

{
  # TODO: set hashed passwd
  users.users = {
    "breanna" = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      home = "/home/breanna";
    };
  };
}
