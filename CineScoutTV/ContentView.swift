import SwiftUI

// App entry screen. Responsible for navigation, category filtering and favorites.
struct ContentView: View {
    @AppStorage("cineScoutTVFavorites") private var favoritesStorage = ""
    @State private var selectedCategory = "All"

    private let categories = [
        "All", "Nature", "Heritage", "Architecture", "Coastal", "Urban Nature"
    ]

    private var favoriteIDs: Set<String> {
        Set(favoritesStorage.split(separator: ",").map(String.init))
    }

    private var favoriteLocations: [TVFilmingLocation] {
        TVFilmingLocation.samples.filter { favoriteIDs.contains($0.id) }
    }

    private var filteredLocations: [TVFilmingLocation] {
        selectedCategory == "All"
            ? TVFilmingLocation.samples
            : TVFilmingLocation.samples.filter { $0.category == selectedCategory }
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
            Label("\(favoriteLocations.count) Favorites", systemImage: "heart.fill")
                .font(.system(size: 22))
                .foregroundStyle(TVTheme.amber)
        }
    }

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Discover Your Next\nPerfect Filming Location")
                .font(.system(size: 60, weight: .bold))
                .fixedSize(horizontal: false, vertical: true)
            Text("Explore cinematic destinations across Sri Lanka, discover filming ideas, and save your favorite locations.")
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
                Label("Explore All Locations", systemImage: "arrow.right")
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
                colors: [TVTheme.card, TVTheme.amber.opacity(0.2), TVTheme.card],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }

    private var exploreSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Explore Locations")
                .font(.system(size: 36, weight: .bold))
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        Button(category) { selectedCategory = category }
                            .buttonStyle(.bordered)
                            .tint(selectedCategory == category ? TVTheme.amber : .gray)
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
                    Text("Open a location and select Add to Favorites.")
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

    // Persists selected IDs using UserDefaults via AppStorage.
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

#Preview {
    ContentView()
}

