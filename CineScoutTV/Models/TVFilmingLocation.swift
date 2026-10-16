import Foundation

// Represents a filming destination displayed in the tvOS prototype.
struct TVFilmingLocation: Identifiable, Hashable {
    let id: String
    let name: String
    let region: String
    let category: String
    let description: String
    let bestShot: String
    let symbol: String
    let latitude: Double
    let longitude: Double

    // Local demonstration data. The tvOS app does not connect to the iOS database.
    static let samples: [TVFilmingLocation] = [
        .init(id: "ella", name: "Nine Arch Bridge", region: "Ella, Sri Lanka", category: "Nature", description: "A scenic railway bridge surrounded by green hills and tropical forest. Ideal for cinematic travel films and landscape photography.", bestShot: "Wide / Establishing Shot", symbol: "mountain.2.fill", latitude: 6.8767, longitude: 81.0610),
        .init(id: "sigiriya", name: "Sigiriya Rock Fortress", region: "Sigiriya, Sri Lanka", category: "Heritage", description: "An iconic ancient rock fortress with dramatic scenery, gardens and historical architecture.", bestShot: "Aerial / Landscape Shot", symbol: "mountain.2.circle.fill", latitude: 7.9570, longitude: 80.7603),
        .init(id: "galle", name: "Galle Fort", region: "Galle, Sri Lanka", category: "Architecture", description: "A historic coastal fort featuring colonial architecture, narrow streets and beautiful ocean views.", bestShot: "Street / Tracking Shot", symbol: "building.columns.fill", latitude: 6.0269, longitude: 80.2170),
        .init(id: "nuwara", name: "Nuwara Eliya", region: "Central Province, Sri Lanka", category: "Nature", description: "A peaceful hill-country setting with misty landscapes, tea plantations and beautiful mountain scenery.", bestShot: "Cinematic Landscape", symbol: "leaf.fill", latitude: 6.9497, longitude: 80.7891),
        .init(id: "mirissa", name: "Mirissa Beach", region: "Mirissa, Sri Lanka", category: "Coastal", description: "A tropical beach destination with ocean waves, golden sand and memorable sunset views.", bestShot: "Sunset / Wide Shot", symbol: "water.waves", latitude: 5.9483, longitude: 80.4716),
        .init(id: "kandy", name: "Kandy Lake", region: "Kandy, Sri Lanka", category: "Urban Nature", description: "A scenic lake surrounded by hills and historic city landmarks, suitable for travel and documentary filming.", bestShot: "Wide / Reflection Shot", symbol: "camera.metering.center.weighted", latitude: 7.2906, longitude: 80.6413)
    ]
}
