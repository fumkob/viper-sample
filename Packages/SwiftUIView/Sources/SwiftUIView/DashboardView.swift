import SwiftUI

// MARK: - Language Data Structure
public struct LanguageStatistic {
    let name: String
    let repositoryCount: Int
    let percentage: Double
    let color: Color

    public init(name: String, repositoryCount: Int, percentage: Double, color: Color) {
        self.name = name
        self.repositoryCount = repositoryCount
        self.percentage = percentage
        self.color = color
    }
}

public struct DashboardView: View {

    // Dashboard data properties - GitHub API compatible metrics
    let reposCreatedToday: String
    let totalPublicRepos: String
    let recentlyUpdatedRepos: String
    let popularLanguages: [LanguageStatistic]

    public init(
        reposCreatedToday: String = "0",
        totalPublicRepos: String = "0",
        recentlyUpdatedRepos: String = "0",
        popularLanguages: [LanguageStatistic] = []
    ) {
        self.reposCreatedToday = reposCreatedToday
        self.totalPublicRepos = totalPublicRepos
        self.recentlyUpdatedRepos = recentlyUpdatedRepos
        self.popularLanguages = popularLanguages
    }

    public var body: some View {
        NavigationStack {
            ZStack {
                // Full screen background
                Color(.systemGray6)
                    .ignoresSafeArea()

                ScrollView {
                    LazyVStack(spacing: 24) {
                        // Add some top spacing to ensure content doesn't interfere with large title
                        Spacer()
                            .frame(height: 1)

                        // Stats cards
                        statsSection

                        // Popular languages
                        popularLanguagesSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                .refreshable {
                    // Refresh action - placeholder for future implementation
                }
            }
            .navigationTitle("Open Source Explorer")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.clear, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Refresh action
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }

    // MARK: - Stats Section

    private var statsSection: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            StatCard(title: "New Today", value: reposCreatedToday, icon: "plus.circle.fill", color: .green)
            StatCard(title: "Public Repos", value: totalPublicRepos, icon: "folder.fill", color: .blue)
            StatCard(title: "Updated", value: recentlyUpdatedRepos, icon: "clock.fill", color: .orange)
        }
    }

    // MARK: - Popular Languages Section

    private var popularLanguagesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundStyle(.blue)
                Text("Popular Languages")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
            }

            VStack(spacing: 12) {
                if popularLanguages.isEmpty {
                    // Default fallback when no data is provided
                    LanguageBar(language: "JavaScript", repositoryCount: "2.5M", percentage: 0.68, color: .yellow)
                    LanguageBar(language: "Python", repositoryCount: "1.9M", percentage: 0.54, color: .blue)
                    LanguageBar(language: "Swift", repositoryCount: "1.3M", percentage: 0.38, color: .orange)
                } else {
                    // Dynamic data from API
                    ForEach(popularLanguages.prefix(5), id: \.name) { language in
                        LanguageBar(
                            language: language.name,
                            repositoryCount: formatRepositoryCount(language.repositoryCount),
                            percentage: language.percentage,
                            color: language.color
                        )
                    }
                }
            }
        }
        .padding(20)
        .glassEffect(in: .rect(cornerRadius: 16))
    }

    // MARK: - Helper Methods

    private func formatRepositoryCount(_ count: Int) -> String {
        if count >= 1_000_000 {
            return String(format: "%.1fM", Double(count) / 1_000_000)
        } else if count >= 1_000 {
            return String(format: "%.1fK", Double(count) / 1_000)
        } else {
            return "\(count)"
        }
    }


}

// MARK: - Supporting Views

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(color)
                .frame(width: 44, height: 44)
                .background {
                    Circle()
                        .fill(color.opacity(0.1))
                }

            VStack(spacing: 4) {
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)

                Text(title)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .glassEffect(in: .rect(cornerRadius: 16))
    }
}


struct LanguageBar: View {
    let language: String
    let repositoryCount: String
    let percentage: Double
    let color: Color
    @State private var animatedPercentage: Double = 0

    // Convenience initializer for backward compatibility
    init(language: String, percentage: Double, color: Color) {
        self.language = language
        self.repositoryCount = "\(Int(percentage * 100))%"
        self.percentage = percentage
        self.color = color
    }

    // New initializer with repository count
    init(language: String, repositoryCount: String, percentage: Double, color: Color) {
        self.language = language
        self.repositoryCount = repositoryCount
        self.percentage = percentage
        self.color = color
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(language)
                    .font(.caption)
                    .fontWeight(.medium)
                Spacer()
                Text(repositoryCount)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 6)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: geometry.size.width * animatedPercentage, height: 6)
                }
            }
            .frame(height: 6)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).delay(0.2)) {
                animatedPercentage = percentage
            }
        }
    }
}


// MARK: - Preview

#Preview {
    DashboardView(
        reposCreatedToday: "1,247",
        totalPublicRepos: "12.5M",
        recentlyUpdatedRepos: "3,892",
        popularLanguages: [
            LanguageStatistic(name: "JavaScript", repositoryCount: 2_500_000, percentage: 0.68, color: .yellow),
            LanguageStatistic(name: "Python", repositoryCount: 1_900_000, percentage: 0.54, color: .blue),
            LanguageStatistic(name: "Java", repositoryCount: 1_600_000, percentage: 0.45, color: .red),
            LanguageStatistic(name: "TypeScript", repositoryCount: 1_300_000, percentage: 0.38, color: .indigo),
            LanguageStatistic(name: "Swift", repositoryCount: 950_000, percentage: 0.28, color: .orange)
        ]
    )
}
