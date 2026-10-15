
import SwiftUI

// MARK: - Location Model

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

    static let samples: [TVFilmingLocation] = [
        TVFilmingLocation(
            id: "ella",
            name: "Nine Arch Bridge",
            region: "Ella, Sri Lanka",
            category: "Nature",
            description: "A scenic railway bridge surrounded by green hills and tropical forest. Ideal for cinematic travel films and landscape photography.",
            bestShot: "Wide / Establishing Shot",
            symbol: "mountain.2.fill",
            latitude: 6.8767,
            longitude: 81.0610
        ),
        TVFilmingLocation(
            id: "sigiriya",
            name: "Sigiriya Rock Fortress",
            region: "Sigiriya, Sri Lanka",
            category: "Heritage",
            description: "An iconic ancient rock fortress with dramatic scenery, gardens and historical architecture.",
            bestShot: "Aerial / Landscape Shot",
            symbol: "mountain.2.circle.fill",
            latitude: 7.9570,
            longitude: 80.7603
        ),
        TVFilmingLocation(
            id: "galle",
            name: "Galle Fort",
            region: "Galle, Sri Lanka",
            category: "Architecture",
            description: "A historic coastal fort featuring colonial architecture, narrow streets and beautiful ocean views.",
            bestShot: "Street / Tracking Shot",
            symbol: "building.columns.fill",
            latitude: 6.0269,
            longitude: 80.2170
        ),
        TVFilmingLocation(
            id: "nuwara",
            name: "Nuwara Eliya",
            region: "Central Province, Sri Lanka",
            category: "Nature",
            description: "A peaceful hill-country setting with misty landscapes, tea plantations and beautiful mountain scenery.",
            bestShot: "Cinematic Landscape",
            symbol: "leaf.fill",
            latitude: 6.9497,
            longitude: 80.7891
        ),
        TVFilmingLocation(
            id: "mirissa",
            name: "Mirissa Beach",
            region: "Mirissa, Sri Lanka",
            category: "Coastal",
            description: "A tropical beach destination with ocean waves, golden sand and memorable sunset views.",
            bestShot: "Sunset / Wide Shot",
            symbol: "water.waves",
            latitude: 5.9483,
            longitude: 80.4716
        ),
        TVFilmingLocation(
            id: "kandy",
            name: "Kandy Lake",
            region: "Kandy, Sri Lanka",
            category: "Urban Nature",
            description: "A scenic lake surrounded by hills and historic city landmarks, suitable for travel and documentary filming.",
            bestShot: "Wide / Reflection Shot",
            symbol: "camera.metering.center.weighted",
            latitude: 7.2906,
            longitude: 80.6413
        )
    ]
}

// MARK: - Theme

enum TVTheme {
    static let background = Color(
        red: 16 / 255,
        green: 19 / 255,
        blue: 24 / 255
    )

    static let card = Color(
        red: 31 / 255,
        green: 36 / 255,
        blue: 45 / 255
    )

    static let amber = Color(
        red: 245 / 255,
        green: 158 / 255,
        blue: 11 / 255
    )
}

// MARK: - Main App

struct ContentView: View {

    @AppStorage("cineScoutTVFavorites")
    private var favoritesStorage = ""

    @State private var selectedCategory = "All"

    private let categories = [
        "All",
        "Nature",
        "Heritage",
        "Architecture",
        "Coastal",
        "Urban Nature"
    ]

    private var favoriteIDs: Set<String> {
        Set(
            favoritesStorage
                .split(separator: ",")
                .map(String.init)
        )
    }

    private var favoriteLocations: [TVFilmingLocation] {
        TVFilmingLocation.samples.filter {
            favoriteIDs.contains($0.id)
        }
    }

    private var filteredLocations: [TVFilmingLocation] {
        guard selectedCategory != "All" else {
            return TVFilmingLocation.samples
        }

        return TVFilmingLocation.samples.filter {
            $0.category == selectedCategory
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 42) {
                    header

                    heroSection

                    exploreSection

                    favoritesSection

                    footer
                }
                .padding(.horizontal, 75)
                .padding(.vertical, 48)
            }
            .background(TVTheme.background.ignoresSafeArea())
            .preferredColorScheme(.dark)
        }
        .tint(TVTheme.amber)
    }

    // MARK: - Header

    private var header: some View {
        HStack(spacing: 18) {
            Image(systemName: "film.stack.fill")
                .font(.system(size: 45))
                .foregroundStyle(TVTheme.amber)

            VStack(alignment: .leading, spacing: 4) {
                Text("CineScout TV")
                    .font(.system(size: 38, weight: .bold))

                Text("SCOUT. SAVE. SHOOT.")
                    .font(.system(size: 15, weight: .semibold))
                    .tracking(3)
                    .foregroundStyle(TVTheme.amber)
            }

            Spacer()

            Label(
                "\(favoriteLocations.count) Favorites",
                systemImage: "heart.fill"
            )
            .font(.system(size: 22))
            .foregroundStyle(TVTheme.amber)
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Discover Your Next\nPerfect Filming Location")
                .font(.system(size: 60, weight: .bold))
                .fixedSize(horizontal: false, vertical: true)

            Text(
                "Explore cinematic destinations across Sri Lanka, discover filming ideas, and save your favorite locations."
            )
            .font(.system(size: 24))
            .foregroundStyle(.white.opacity(0.75))
            .frame(maxWidth: 850, alignment: .leading)

            NavigationLink {
                AllLocationsView(
                    locations: TVFilmingLocation.samples,
                    favoriteIDs: favoriteIDs,
                    toggleFavorite: toggleFavorite
                )
            } label: {
                Label(
                    "Explore All Locations",
                    systemImage: "arrow.right"
                )
                .font(.system(size: 22, weight: .bold))
                .padding(.horizontal, 28)
                .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            .tint(TVTheme.amber)
            .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(55)
        .background(
            LinearGradient(
                colors: [
                    TVTheme.card,
                    TVTheme.amber.opacity(0.2),
                    TVTheme.card
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }

    // MARK: - Explore

    private var exploreSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Explore Locations")
                .font(.system(size: 36, weight: .bold))

            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Button(category) {
                            selectedCategory = category
                        }
                        .buttonStyle(.bordered)
                        .tint(
                            selectedCategory == category
                            ? TVTheme.amber
                            : .gray
                        )
                    }
                }
                .padding(8)
            }
            .scrollIndicators(.hidden)

            ScrollView(.horizontal) {
                HStack(spacing: 28) {
                    ForEach(filteredLocations) { location in
                        NavigationLink {
                            TVLocationDetailView(
                                location: location,
                                isFavorite: favoriteIDs.contains(
                                    location.id
                                ),
                                toggleFavorite: toggleFavorite
                            )
                        } label: {
                            TVLocationCard(location: location)
                        }
                        .buttonStyle(.card)
                    }
                }
                .padding(12)
            }
            .scrollIndicators(.hidden)
        }
    }

    // MARK: - Favorites

    private var favoritesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("My Favorites")
                    .font(.system(size: 36, weight: .bold))

                Spacer()

                Text("\(favoriteLocations.count) Saved")
                    .font(.system(size: 20))
                    .foregroundStyle(TVTheme.amber)
            }

            if favoriteLocations.isEmpty {
                VStack(spacing: 15) {
                    Image(systemName: "heart")
                        .font(.system(size: 45))
                        .foregroundStyle(TVTheme.amber)

                    Text("No Favorite Locations Yet")
                        .font(.system(size: 25, weight: .semibold))

                    Text(
                        "Open a location and select Add to Favorites."
                    )
                    .font(.system(size: 19))
                    .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding(55)
                .background(TVTheme.card)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            } else {
                ScrollView(.horizontal) {
                    HStack(spacing: 28) {
                        ForEach(favoriteLocations) { location in
                            NavigationLink {
                                TVLocationDetailView(
                                    location: location,
                                    isFavorite: true,
                                    toggleFavorite: toggleFavorite
                                )
                            } label: {
                                TVLocationCard(location: location)
                            }
                            .buttonStyle(.card)
                        }
                    }
                    .padding(12)
                }
                .scrollIndicators(.hidden)
            }
        }
    }

    private var footer: some View {
        HStack {
            Spacer()

            Text("CineScout TV • Filming Location Explorer")
                .font(.system(size: 17))
                .foregroundStyle(.gray)

            Spacer()
        }
        .padding(.top, 20)
    }

    // MARK: - Favorite Persistence

    private func toggleFavorite(_ id: String) {
        var updated = favoriteIDs

        if updated.contains(id) {
            updated.remove(id)
        } else {
            updated.insert(id)
        }

        favoritesStorage = updated.sorted().joined(separator: ",")
    }
}

// MARK: - All Locations

struct AllLocationsView: View {
    let locations: [TVFilmingLocation]
    let favoriteIDs: Set<String>
    let toggleFavorite: (String) -> Void

    private let columns = [
        GridItem(.flexible(), spacing: 35),
        GridItem(.flexible(), spacing: 35),
        GridItem(.flexible(), spacing: 35)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                Text("Explore Filming Locations")
                    .font(.system(size: 48, weight: .bold))

                Text("Select a location to view cinematic details.")
                    .font(.system(size: 23))
                    .foregroundStyle(.gray)

                LazyVGrid(columns: columns, spacing: 35) {
                    ForEach(locations) { location in
                        NavigationLink {
                            TVLocationDetailView(
                                location: location,
                                isFavorite: favoriteIDs.contains(
                                    location.id
                                ),
                                toggleFavorite: toggleFavorite
                            )
                        } label: {
                            TVLocationCard(location: location)
                        }
                        .buttonStyle(.card)
                    }
                }
            }
            .padding(75)
        }
        .background(TVTheme.background.ignoresSafeArea())
        .navigationTitle("Explore")
    }
}

// MARK: - Reusable Location Card

struct TVLocationCard: View {
    let location: TVFilmingLocation

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ZStack {
                LinearGradient(
                    colors: [
                        TVTheme.amber.opacity(0.25),
                        TVTheme.card
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Image(systemName: location.symbol)
                    .font(.system(size: 82))
                    .foregroundStyle(TVTheme.amber)
            }
            .frame(height: 190)
            .clipShape(RoundedRectangle(cornerRadius: 18))

            Text(location.category.uppercased())
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(TVTheme.amber)

            Text(location.name)
                .font(.system(size: 25, weight: .bold))
                .lineLimit(2)

            Label(location.region, systemImage: "mappin")
                .font(.system(size: 18))
                .foregroundStyle(.white.opacity(0.7))
                .lineLimit(1)
        }
        .padding(20)
        .frame(width: 355, height: 340, alignment: .topLeading)
        .background(TVTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

// MARK: - Location Details

struct TVLocationDetailView: View {
    let location: TVFilmingLocation
    let isFavorite: Bool
    let toggleFavorite: (String) -> Void

    @AppStorage("cineScoutTVFavorites")
    private var favoritesStorage = ""

    private var currentlyFavorite: Bool {
        favoritesStorage
            .split(separator: ",")
            .map(String.init)
            .contains(location.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                ZStack {
                    LinearGradient(
                        colors: [
                            TVTheme.amber.opacity(0.3),
                            TVTheme.card
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )

                    Image(systemName: location.symbol)
                        .font(.system(size: 140))
                        .foregroundStyle(TVTheme.amber)
                }
                .frame(height: 330)
                .clipShape(RoundedRectangle(cornerRadius: 28))

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 14) {
                        Text(location.name)
                            .font(.system(size: 52, weight: .bold))

                        Label(
                            location.region,
                            systemImage: "mappin.circle.fill"
                        )
                        .font(.system(size: 24))
                        .foregroundStyle(TVTheme.amber)
                    }

                    Spacer()

                    Button {
                        toggleFavorite(location.id)
                    } label: {
                        Label(
                            currentlyFavorite
                            ? "Remove Favorite"
                            : "Add to Favorites",
                            systemImage: currentlyFavorite
                            ? "heart.fill"
                            : "heart"
                        )
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(TVTheme.amber)
                }

                Divider()

                Text("About This Location")
                    .font(.system(size: 32, weight: .bold))

                Text(location.description)
                    .font(.system(size: 25))
                    .foregroundStyle(.white.opacity(0.8))

                HStack(spacing: 25) {
                    infoCard(
                        title: "Category",
                        value: location.category,
                        icon: "square.grid.2x2"
                    )

                    infoCard(
                        title: "Recommended Shot",
                        value: location.bestShot,
                        icon: "video.fill"
                    )

                    infoCard(
                        title: "Coordinates",
                        value: String(
                            format: "%.4f, %.4f",
                            location.latitude,
                            location.longitude
                        ),
                        icon: "location.fill"
                    )
                }
            }
            .padding(75)
        }
        .background(TVTheme.background.ignoresSafeArea())
        .navigationTitle(location.name)
    }

    private func infoCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundStyle(TVTheme.amber)

            Text(title)
                .font(.system(size: 19))
                .foregroundStyle(.gray)

            Text(value)
                .font(.system(size: 23, weight: .semibold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(28)
        .background(TVTheme.card)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

#Preview {
    ContentView()
}
