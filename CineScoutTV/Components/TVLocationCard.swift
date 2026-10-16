import SwiftUI

// Reusable focusable card content for filming-location navigation.
struct TVLocationCard: View {
    let location: TVFilmingLocation

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            ZStack {
                LinearGradient(
                    colors: [TVTheme.amber.opacity(0.25), TVTheme.card],
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
