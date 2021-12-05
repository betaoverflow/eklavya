class OnboardingModel {
  final image;
  final title;
  final descp;

  OnboardingModel({this.image, this.title, this.descp});
}

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
      title: "Get Easy Access to Professional Guidance",
      image:
          "https://res.cloudinary.com/dguy8qpzi/image/upload/v1638697322/img1__1_-removebg-preview_m46iaq.png",
      descp: "Get premium mentor support from the best in your field. Pay according to the tier you choose and get amazing results."),
  OnboardingModel(
      title: "Skyrocket Your Career By Gaining All The Skills",
      image:
          "https://res.cloudinary.com/dguy8qpzi/image/upload/v1638697632/img1__2_-removebg-preview_aw9uco.png",
      descp: "Get roadmaps for software learning tracks with FREE blogs, tutorials and articles to upskill users."),
  OnboardingModel(
      title: "Never Miss An Opportunity",
      image:
          "https://res.cloudinary.com/dguy8qpzi/image/upload/v1638698126/img1__3_-removebg-preview_likmg4.png",
      descp: "Get constant notifications on internship, open-source, scholarships, placement, and other opportunities.")
];
