let
  hostname = "examplehost";
in
{
  # Define your hostname.
  networking.hostName = "${hostname}";

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";
}
