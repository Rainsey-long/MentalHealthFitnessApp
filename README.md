# Mental Health Fitness Mobile App

A SwiftUI implementation of a mental health fitness mobile app based on the Figma design: [Mental Health Fitness Mobile App design](https://www.figma.com/design/Cj7x2lQNXAcOMO3T25EG2x/Mental-Health-Fitness-Mobile-App-design--Community-?node-id=101-233&t=4jz9BhQMIrKw973N-0)

## Features

- User greeting and welcome screen
- Mood tracker with four emotional states (Calm, Happy, Relax, Focus)
- Daily tasks and activities
- Card-based UI for upcoming events and practices
- Bottom navigation bar

## Screenshots

![App Screenshot](https://via.placeholder.com/300x650)

## Setup Instructions

1. Clone the repository:
```bash
git clone https://github.com/Rainsey-long/MentalHealthFitnessApp.git
```

2. Open the project in Xcode:
```bash
cd MentalHealthFitnessApp
open MentalHealthFitnessApp.xcodeproj
```

3. Install required fonts:
   - Alegreya 
   - Alegreya Sans

4. Run the project in Xcode

## Font Installation

For the best experience, install the following fonts:

1. Download the fonts:
   - [Alegreya](https://fonts.google.com/specimen/Alegreya)
   - [Alegreya Sans](https://fonts.google.com/specimen/Alegreya+Sans)

2. Add the fonts to your Xcode project:
   - Create a "Fonts" folder in your project
   - Add the font files to this folder
   - Add the fonts to your Info.plist:
     ```xml
     <key>UIAppFonts</key>
     <array>
         <string>Alegreya-Regular.ttf</string>
         <string>Alegreya-Medium.ttf</string>
         <string>AlegreyaSans-Regular.ttf</string>
         <string>AlegreyaSans-Light.ttf</string>
         <string>AlegreyaSans-Bold.ttf</string>
     </array>
     ```

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.3+

## Implementation Details

- Built with SwiftUI
- Uses SF Symbols for icons
- Custom color palette matching the Figma design
- Responsive layout for different iOS devices
