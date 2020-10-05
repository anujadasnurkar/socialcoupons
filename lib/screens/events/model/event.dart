class Event {
  final String imagePath, title, description, location, duration, punchLine1, punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

final fiveKmRunEvent = Event(
    imagePath: "assets/images/slide1.png",
    title: "Teach English",
    description: "",
    location: "SV Nagar",
    duration: "3h",
    punchLine1: "Marathon!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    galleryImages: [],
    categoryIds: [0, 3]);

final cookingEvent = Event(
    imagePath: "assets/images/slide1.png",
    title: "Plant trees",
    description: "Guest list fill up fast so be sure to apply before handto secure a spot.",
    location: "GTB Nagar",
    duration: "4h",
    punchLine1: "Granite Cooking",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    categoryIds: [0, 2],
    galleryImages: ["assets/event_images/cooking_1.jpeg", "assets/event_images/cooking_2.jpeg", "assets/event_images/cooking_3.jpeg"]);

final musicConcert = Event(
    imagePath: "assets/images/slide1.png",
    title: "Volunteer as a scribe",
    description: "Listen to Arijit's latest compositions.",
    location: "Mumbai",
    duration: "5h",
    punchLine1: "Music Lovers!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    galleryImages: ["assets/event_images/cooking_1.jpeg", "assets/event_images/cooking_2.jpeg", "assets/event_images/cooking_3.jpeg"],
    categoryIds: [0, 1]);

final golfCompetition = Event(
    imagePath: "assets/images/slide1.png",
    title: "Cleanliness drive",
    description: "",
    location: "Delhi",
    duration: "4H",
    punchLine1: "Golf!",
    punchLine2: "The latest fad in foodology, get the inside scoup.",
    galleryImages: ["assets/event_images/cooking_1.jpeg", "assets/event_images/cooking_2.jpeg", "assets/event_images/cooking_3.jpeg"],
    categoryIds: [0, 3]);

final events = [
  fiveKmRunEvent,
  cookingEvent,
  musicConcert,
  golfCompetition,
];
