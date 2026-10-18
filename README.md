# 🎬 CineScout TV – Cinematic Location Explorer

### SE4041 – Mobile Application Design and Development
**Assignment 02 – Part B | tvOS Application**

## Project Overview

CineScout TV is a native tvOS application developed using Swift and SwiftUI. It provides an interactive, large-screen experience for exploring cinematic filming locations across Sri Lanka.

The application is designed for filmmakers, photographers, content creators, and travel enthusiasts who want to discover filming destinations, explore location information, and organize their favorite places using an Apple TV interface.

**Tagline:** Scout. Save. Shoot.

## Key Features

- **Cinematic Home Screen:** A visually appealing dashboard with featured filming locations.
- **Explore Locations:** Browse six predefined filming destinations across Sri Lanka.
- **Category Filtering:** Filter locations by Nature, Heritage, Architecture, Coastal, and Urban Nature.
- **Location Details:** View descriptions, recommended shot types, geographical coordinates, and location categories.
- **Favorites Management:** Add or remove filming locations from a personalized favorites collection.
- **Local Persistence:** Store favorite location identifiers using `@AppStorage`.
- **TV Remote Navigation:** Navigate through interactive cards and buttons using tvOS focus-based interactions.
- **Reusable UI Components:** Consistent location cards and a cinematic amber design theme.

## Technologies Used

| Technology | Purpose |
|---|---|
| Swift | Application programming language |
| SwiftUI | Native tvOS user interface |
| NavigationStack | Navigation between screens |
| NavigationLink | Opening location details |
| @State | Managing temporary UI state |
| @AppStorage | Storing favorite selections locally |
| UserDefaults | Lightweight local persistence |
| LazyVGrid | Displaying location cards in a responsive grid |
| Xcode | Development environment |
| Apple TV Simulator | Application testing |
| Git and GitHub | Version control |

## Application Screens

1. Home Screen
2. Explore All Locations
3. Category-Filtered Location Catalogue
4. Filming Location Details
5. My Favorites

## Featured Filming Locations

The prototype includes six locations:

1. Nine Arch Bridge – Ella
2. Sigiriya Rock Fortress – Sigiriya
3. Galle Fort – Galle
4. Nuwara Eliya – Central Province
5. Mirissa Beach – Mirissa
6. Kandy Lake – Kandy

Each location contains a description, category, recommended filming shot, and geographical coordinates.

## Project Architecture

The application follows a modular SwiftUI structure:

```text
CineScoutTV/
├── CineScoutTVApp.swift
├── ContentView.swift
├── Models/
│   └── TVFilmingLocation.swift
├── Views/
│   ├── AllLocationsView.swift
│   └── TVLocationDetailView.swift
├── Components/
│   └── TVLocationCard.swift
└── Theme/
    └── TVTheme.swift
```

- **Models:** Defines the filming location data structure.
- **Views:** Contains the location catalogue and detail screens.
- **Components:** Provides reusable UI elements.
- **Theme:** Maintains consistent colors and visual styling.
- **ContentView:** Manages the home interface, category filtering, and favorites.

## How to Run

1. Clone or download this repository.
2. Open `CineScoutTV.xcodeproj` in Xcode.
3. Select an available Apple TV Simulator.
4. Press `Command + B` to build the application.
5. Press `Command + R` to run it.
6. Use the Apple TV Remote simulator or supported keyboard controls to navigate.

## Functional Testing

The application was built and run in the Apple TV 4K Simulator.

The following workflows were demonstrated:

- Application launch and Home Screen display
- Location catalogue navigation
- Category filtering
- Opening filming location details
- Adding and removing favorites
- Focus-based navigation through interactive controls

Screenshots and screen recordings were collected as supporting evidence.

## Current Limitations

- The prototype uses six predefined filming locations.
- Live location search and MapKit integration are implemented in the related CineScout iOS application, not this tvOS prototype.
- There is no cloud synchronization between the iOS and tvOS applications.
- Favorites are stored locally rather than in an online account.
- Comprehensive automated testing has not been documented.

## Future Enhancements

- Synchronization with the CineScout iOS application
- Expanded filming location catalogue
- Location photographs and cinematic previews
- Personalized location recommendations
- Collaborative project planning
- Cloud-based favorites and user profiles

## Academic Information

**Module:** SE4041 – Mobile Application Design and Development  
**Assignment:** Assignment 02 – Part B  
**Application:** CineScout TV  
**Platform:** Apple tvOS  
**Student ID:** IT22626974  
**Institution:** Sri Lanka Institute of Information Technology (SLIIT)

## Related Repositories

**Part A – CineScout iOS:**  
https://github.com/Ddevindya/CineScout-iOS

**Part B – CineScout TV:**  
https://github.com/Ddevindya/CineScout-tvOS

## References

- [Apple SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [Apple tvOS Developer Documentation](https://developer.apple.com/tvos/)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)

---

Developed as an academic tvOS prototype for SE4041 Assignment 02.
