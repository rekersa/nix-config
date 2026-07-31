{
  vars,
  ...
}:
{
  users.users.${vars.username} = {
    isNormalUser = true;
    description = "";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
