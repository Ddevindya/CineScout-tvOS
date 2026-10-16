import SwiftUI

// TV-friendly details and the action to add/remove a saved favorite.
struct TVLocationDetailView: View {
    let location: TVFilmingLocation
    let toggleFavorite: (String) -> Void

    @AppStorage("cineScoutTVFavorites") private var favoritesStorage = ""

    private var currentlyFavorite: Bool {
        favoritesStorage.split(separator: ",").contains(Substring(location.id))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                ZStack {
                    LinearGradient(
                        colors: [TVTheme.amber.opacity(0.3), TVTheme.card],
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
                        Label(location.region, systemImage: "mappin.circle.fill")
                            .font(.system(size: 24))
                            .foregroundStyle(TVTheme.amber)
                    }
                    Spacer()
                    Button {
                        toggleFavorite(location.id)
                    } label: {
                        Label(
                            currentlyFavorite ? "Remove Favorite" : "Add to Favorites",
                            systemImage: currentlyFavorite ? "heart.fill" : "heart"
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
                    infoCard(title: "Category", value: location.category, icon: "square.grid.2x2")
                    infoCard(title: "Recommended Shot", value: location.bestShot, icon: "video.fill")
                    infoCard(
                        title: "Coordinates",
                        value: String(format: "%.4f, %.4f", location.latitude, location.longitude),
                        icon: "location.fill"
                    )
                }
            }
            .padding(75)
        }
        .background(TVTheme.background.ignoresSafeArea())
        .navigationTitle(location.name)
    }

    private func infoCard(title: String, value: String, icon: String) -> some View {
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
