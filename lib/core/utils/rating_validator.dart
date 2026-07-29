class RatingValidator {
  const RatingValidator._();

  static bool isValid(double? rating) {
    if (rating == null) {
      return true;
    }
    final isHalfStep = (rating * 2) % 1 == 0;
    return rating >= 0 && rating <= 10 && isHalfStep;
  }
}
