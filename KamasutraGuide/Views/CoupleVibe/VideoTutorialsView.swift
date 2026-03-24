import SwiftUI

struct VideoTutorialsView: View {
    @EnvironmentObject var localization: LocalizationManager
    @State private var selectedCategory: VideoCategory?
    @State private var selectedTutorial: VideoTutorial?
    
    private var filteredTutorials: [VideoTutorial] {
        guard let cat = selectedCategory else { return CoupleVibeData.videoTutorials }
        return CoupleVibeData.videoTutorials.filter { $0.category == cat }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        headerSection
                        categoryFilter
                        tutorialList
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 30)
                }
            }
            .navigationTitle(localization.L("Tutoriale", "Tutorials"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("\u{1F3AC}")
                .font(.system(size: 50))
            Text(localization.L("Tutoriale Educative", "Educational Tutorials"))
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            Text(localization.L("Ghiduri pas cu pas pentru a imbunatati viata de cuplu", "Step by step guides to improve your couple life"))
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                filterChip(title: localization.L("Toate", "All"), isSelected: selectedCategory == nil) {
                    withAnimation { selectedCategory = nil }
                }
                
                ForEach(VideoCategory.allCases, id: \.rawValue) { cat in
                    filterChip(
                        title: cat.localizedName(localization),
                        isSelected: selectedCategory == cat,
                        color: cat.color
                    ) {
                        withAnimation { selectedCategory = cat }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func filterChip(title: String, isSelected: Bool, color: Color = Theme.primary, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(isSelected ? .white : .white.opacity(0.6))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? color.opacity(0.3) : Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isSelected ? color : Color.clear, lineWidth: 1.5)
                )
                .cornerRadius(20)
        }
    }
    
    private var tutorialList: some View {
        VStack(spacing: 12) {
            ForEach(filteredTutorials) { tutorial in
                NavigationLink(destination: TutorialDetailView(tutorial: tutorial)) {
                    tutorialCard(tutorial)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.horizontal)
    }
    
    private func tutorialCard(_ tutorial: VideoTutorial) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(tutorial.gradient)
                        .frame(width: 56, height: 56)
                    Text(tutorial.icon)
                        .font(.system(size: 28))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(tutorial.localizedTitle(localization))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(tutorial.localizedDescription(localization))
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.3))
            }
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 10))
                    Text(tutorial.duration)
                        .font(.system(size: 11))
                }
                .foregroundColor(.white.opacity(0.5))
                
                HStack(spacing: 4) {
                    Image(systemName: tutorial.category.sfIcon)
                        .font(.system(size: 10))
                    Text(tutorial.category.localizedName(localization))
                        .font(.system(size: 11))
                }
                .foregroundColor(tutorial.category.color)
                
                HStack(spacing: 4) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 10))
                    Text(localization.L("\(tutorial.steps.count) pasi", "\(tutorial.steps.count) steps"))
                        .font(.system(size: 11))
                }
                .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color(hex: tutorial.color1).opacity(0.2), lineWidth: 1)
        )
        .cornerRadius(18)
    }
}

// MARK: - Tutorial Detail View
struct TutorialDetailView: View {
    @EnvironmentObject var localization: LocalizationManager
    let tutorial: VideoTutorial
    @State private var currentStep = 0
    @State private var completedSteps: Set<Int> = []
    
    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 10) {
                        Text(tutorial.icon)
                            .font(.system(size: 60))
                        Text(tutorial.localizedTitle(localization))
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 12) {
                            HStack(spacing: 4) {
                                Image(systemName: "clock.fill")
                                Text(tutorial.duration)
                            }
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.5))
                            
                            HStack(spacing: 4) {
                                Image(systemName: tutorial.category.sfIcon)
                                Text(tutorial.category.localizedName(localization))
                            }
                            .font(.system(size: 12))
                            .foregroundColor(tutorial.category.color)
                        }
                    }
                    .padding(.top, 8)
                    
                    // Progress
                    HStack {
                        Text(localization.L("Progres", "Progress"))
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Text("\(completedSteps.count)/\(tutorial.steps.count)")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(tutorial.category.color)
                    }
                    .padding(.horizontal)
                    
                    // Current Step
                    if currentStep < tutorial.steps.count {
                        currentStepView(tutorial.steps[currentStep])
                    }
                    
                    // All Steps Overview
                    VStack(alignment: .leading, spacing: 8) {
                        Text(localization.L("Toti pasii", "All steps"))
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ForEach(tutorial.steps) { step in
                            stepRow(step)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func currentStepView(_ step: TutorialStep) -> some View {
        VStack(spacing: 16) {
            Text(step.icon)
                .font(.system(size: 44))
            
            Text(localization.L("Pasul \(step.stepNumber)", "Step \(step.stepNumber)"))
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(tutorial.category.color)
            
            Text(step.localizedTitle(localization))
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text(step.localizedDescription(localization))
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
            
            HStack(spacing: 4) {
                Image(systemName: "clock")
                Text(step.duration)
            }
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.5))
            
            HStack(spacing: 12) {
                if currentStep > 0 {
                    Button {
                        withAnimation { currentStep -= 1 }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text(localization.L("Inapoi", "Back"))
                        }
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                
                Button {
                    completedSteps.insert(currentStep)
                    if currentStep < tutorial.steps.count - 1 {
                        withAnimation { currentStep += 1 }
                    }
                } label: {
                    HStack {
                        Text(currentStep < tutorial.steps.count - 1
                             ? localization.L("Urmatorul pas", "Next step")
                             : localization.L("Terminat!", "Done!"))
                        if currentStep < tutorial.steps.count - 1 {
                            Image(systemName: "chevron.right")
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(tutorial.gradient)
                    .cornerRadius(12)
                }
            }
        }
        .padding()
        .background(tutorial.category.color.opacity(0.08))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(tutorial.category.color.opacity(0.3), lineWidth: 1)
        )
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    private func stepRow(_ step: TutorialStep) -> some View {
        Button {
            withAnimation { currentStep = step.stepNumber - 1 }
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(completedSteps.contains(step.stepNumber - 1)
                              ? Color(hex: "66BB6A").opacity(0.3)
                              : (currentStep == step.stepNumber - 1 ? tutorial.category.color.opacity(0.3) : Color.white.opacity(0.1)))
                        .frame(width: 32, height: 32)
                    
                    if completedSteps.contains(step.stepNumber - 1) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(hex: "66BB6A"))
                    } else {
                        Text("\(step.stepNumber)")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(currentStep == step.stepNumber - 1 ? tutorial.category.color : .white.opacity(0.5))
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(step.localizedTitle(localization))
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(currentStep == step.stepNumber - 1 ? .white : .white.opacity(0.7))
                    Text(step.duration)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.4))
                }
                
                Spacer()
                
                Text(step.icon)
                    .font(.system(size: 16))
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(currentStep == step.stepNumber - 1 ? tutorial.category.color.opacity(0.08) : Color.clear)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
