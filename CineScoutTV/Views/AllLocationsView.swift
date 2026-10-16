import SwiftUI

// Full catalogue: a three-column grid suitable for a large TV screen.
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
