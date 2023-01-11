enum CardType {
  driver('driver_license', 'Driver License'),
  ghanaCard('ghana_card', 'ECOWAS Identity Card'),
  passport('passport', 'Passport');

  const CardType(this.id, this.displayTitle);

  final String id;
  final String displayTitle;
}
