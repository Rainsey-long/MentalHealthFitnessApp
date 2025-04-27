import SwiftUI

struct ContentView: View {
    @State private var selectedMood: Mood?
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Header
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Welcome back, Sarina!")
                                .font(.custom("Alegreya", size: 30))
                                .fontWeight(.medium)
                                .foregroundColor(Color.textPrimary)
                            
                            Text("How are you feeling today ?")
                                .font(.custom("Alegreya Sans", size: 22))
                                .foregroundColor(Color.textPrimary)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 15) {
                            Button(action: {
                                // Menu action
                            }) {
                                HStack(spacing: 5) {
                                    Rectangle()
                                        .frame(width: 20, height: 2)
                                        .foregroundColor(Color.textPrimary)
                                    Rectangle()
                                        .frame(width: 15, height: 2)
                                        .foregroundColor(Color.textPrimary)
                                    Rectangle()
                                        .frame(width: 10, height: 2)
                                        .foregroundColor(Color.textPrimary)
                                }
                            }
                            
                            // Profile image
                            Circle()
                                .fill(Color(hex: 0xF5F5F5))
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.gray)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    // Mood selection
                    VStack(alignment: .leading, spacing: 15) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                MoodButton(mood: .calm, isSelected: selectedMood == .calm, action: { selectedMood = .calm })
                                MoodButton(mood: .happy, isSelected: selectedMood == .happy, action: { selectedMood = .happy })
                                MoodButton(mood: .relax, isSelected: selectedMood == .relax, action: { selectedMood = .relax })
                                MoodButton(mood: .focus, isSelected: selectedMood == .focus, action: { selectedMood = .focus })
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Today's tasks
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Today's Task")
                            .font(.custom("Alegreya Sans", size: 22))
                            .foregroundColor(Color.textPrimary)
                            .padding(.horizontal)
                        
                        // Peer Group Meetup Card
                        TaskCard(
                            color: Color.pinkLight,
                            iconBackground: Color.redLight,
                            title: "Peer Group Meetup",
                            description: "Let's open up to the thing that matters amoung the people",
                            actionLabel: "Join Now",
                            actionColor: Color.pink,
                            iconName: "person.3.fill"
                        )
                        .padding(.horizontal)
                        
                        // Meditation Card
                        TaskCard(
                            color: Color.orangeLight,
                            iconBackground: Color.orange,
                            title: "Meditation",
                            description: "Aura is the most important thing that matters to you.join us on",
                            actionLabel: "06:00 PM",
                            actionColor: Color.orange,
                            iconName: "sparkles"
                        )
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 80)
                }
            }
            
            // Bottom Navigation
            VStack {
                Spacer()
                BottomNavigationBar()
            }
        }
    }
}

// MARK: - Supporting Views

struct MoodButton: View {
    let mood: Mood
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(mood.color)
                        .frame(width: 50, height: 50)
                    
                    mood.icon
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                }
                
                Text(mood.title)
                    .font(.custom("Alegreya Sans", size: 15))
                    .foregroundColor(Color.textPrimary)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(mood.color.opacity(isSelected ? 0.3 : 0.1))
            )
        }
    }
}

struct TaskCard: View {
    let color: Color
    let iconBackground: Color
    let title: String
    let description: String
    let actionLabel: String
    let actionColor: Color
    let iconName: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            // Icon
            ZStack {
                Circle()
                    .fill(iconBackground)
                    .frame(width: 60, height: 60)
                
                Image(systemName: iconName)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.custom("Alegreya", size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color.textPrimary)
                
                Text(description)
                    .font(.custom("Alegreya Sans", size: 15))
                    .fontWeight(.light)
                    .foregroundColor(Color.textPrimary)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                    // Action for the card
                }) {
                    HStack {
                        Text(actionLabel)
                            .font(.custom("Alegreya Sans", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        if actionLabel.contains("PM") {
                            Image(systemName: "clock.fill")
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(actionColor)
                    )
                }
                .padding(.top, 5)
            }
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.borderLight, lineWidth: 1)
                )
        )
    }
}

struct BottomNavigationBar: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            
            NavigationButton(iconName: "house.fill", isActive: true)
            
            Spacer()
            
            NavigationButton(iconName: "person.2.fill", isActive: false)
            
            Spacer()
            
            NavigationButton(iconName: "chart.bar.fill", isActive: false)
            
            Spacer()
            
            NavigationButton(iconName: "gearshape.fill", isActive: false)
            
            Spacer()
        }
        .padding(.vertical, 15)
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.borderLight),
            alignment: .top
        )
    }
}

struct NavigationButton: View {
    let iconName: String
    let isActive: Bool
    
    var body: some View {
        Button(action: {
            // Navigation action
        }) {
            VStack(spacing: 5) {
                Image(systemName: iconName)
                    .font(.system(size: 22))
                    .foregroundColor(isActive ? Color.primary : Color.iconInactive)
                
                if isActive {
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 5, height: 5)
                }
            }
            .frame(height: 35)
        }
    }
}

// MARK: - Model

enum Mood: String, CaseIterable {
    case calm, happy, relax, focus
    
    var title: String {
        switch self {
        case .calm: return "Calm"
        case .happy: return "Happy"
        case .relax: return "Relax"
        case .focus: return "Focus"
        }
    }
    
    var color: Color {
        switch self {
        case .calm: return Color.calm
        case .happy: return Color.pink
        case .relax: return Color.orange
        case .focus: return Color.teal
        }
    }
    
    var icon: Image {
        switch self {
        case .calm: return Image(systemName: "cloud.fill")
        case .happy: return Image(systemName: "face.smiling.fill")
        case .relax: return Image(systemName: "leaf.fill")
        case .focus: return Image(systemName: "target")
        }
    }
}

// MARK: - Color Extension

extension Color {
    static let textPrimary = Color(hex: 0x371B34)
    static let primary = Color(hex: 0x4949C9)
    static let borderLight = Color(hex: 0xEDE6FC)
    static let calm = Color(hex: 0xAEAFF7)
    static let pink = Color(hex: 0xEF5DA8)
    static let orange = Color(hex: 0xF09E54)
    static let teal = Color(hex: 0xA0E3E2)
    static let pinkLight = Color(hex: 0xFCDDEC)
    static let orangeLight = Color(hex: 0xF09E54).opacity(0.3)
    static let redLight = Color(hex: 0xEA6665)
    static let iconInactive = Color(hex: 0xCDD0E3)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
