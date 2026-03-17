import SwiftUI

// MARK: - Floating Mini Music Player
struct MiniMusicPlayerView: View {
    @ObservedObject var audioManager = AudioManager.shared
    @EnvironmentObject var localization: LocalizationManager
    @State private var showFullPlayer = false
    
    var body: some View {
        if audioManager.isMusicEnabled {
            VStack(spacing: 0) {
                // Mini player bar
                HStack(spacing: 12) {
                    // Music icon with animation
                    ZStack {
                        Circle()
                            .fill(LinearGradient(
                                colors: [Color(hex: "FF6B8A").opacity(0.3), Color(hex: "C44569").opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: audioManager.isPlaying ? "music.note" : "music.note.list")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(hex: "FF6B8A"))
                            .rotationEffect(.degrees(audioManager.isPlaying ? 10 : 0))
                            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: audioManager.isPlaying)
                    }
                    
                    // Track info
                    VStack(alignment: .leading, spacing: 2) {
                        Text(audioManager.currentTrack.title)
                            .font(.system(size: 13, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Text(audioManager.currentTrack.artist)
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    // Controls
                    HStack(spacing: 16) {
                        Button(action: { audioManager.previousTrack() }) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        Button(action: { audioManager.togglePlayPause() }) {
                            Image(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 28))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color(hex: "FF6B8A"), Color(hex: "C44569")],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                        }
                        
                        Button(action: { audioManager.nextTrack() }) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(hex: "1E1E3F").opacity(0.95))
                        .shadow(color: Color(hex: "FF6B8A").opacity(0.2), radius: 10, x: 0, y: -2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: "FF6B8A").opacity(0.2), lineWidth: 1)
                )
                .padding(.horizontal, 12)
                .onTapGesture {
                    showFullPlayer = true
                }
            }
            .sheet(isPresented: $showFullPlayer) {
                FullMusicPlayerView(audioManager: audioManager)
                    .environmentObject(localization)
            }
        }
    }
}

// MARK: - Full Music Player View
struct FullMusicPlayerView: View {
    @ObservedObject var audioManager: AudioManager
    @EnvironmentObject var localization: LocalizationManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color(hex: "1A1A2E"), Color(hex: "16213E"), Color(hex: "0F3460")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Close button
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Album art / Visualizer
                ZStack {
                    // Outer glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color(hex: "FF6B8A").opacity(0.3), Color.clear],
                                center: .center,
                                startRadius: 60,
                                endRadius: 140
                            )
                        )
                        .frame(width: 280, height: 280)
                    
                    // Main circle
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "FF6B8A").opacity(0.2), Color(hex: "C44569").opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 200, height: 200)
                        .overlay(
                            Circle()
                                .stroke(
                                    LinearGradient(
                                        colors: [Color(hex: "FF6B8A"), Color(hex: "C44569")],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 2
                                )
                        )
                        .rotationEffect(.degrees(audioManager.isPlaying ? 360 : 0))
                        .animation(
                            audioManager.isPlaying ?
                                .linear(duration: 8).repeatForever(autoreverses: false) :
                                .default,
                            value: audioManager.isPlaying
                        )
                    
                    // Music note
                    Image(systemName: "music.note")
                        .font(.system(size: 60, weight: .light))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(hex: "FF6B8A"), Color(hex: "C44569")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
                
                // Track info
                VStack(spacing: 8) {
                    Text(audioManager.currentTrack.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(audioManager.currentTrack.artist)
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.5))
                    
                    Text("\(audioManager.currentTrackIndex + 1) / \(audioManager.playlist.count)")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.3))
                }
                
                // Volume slider
                HStack(spacing: 12) {
                    Image(systemName: "speaker.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                    
                    Slider(value: Binding(
                        get: { Double(audioManager.volume) },
                        set: { audioManager.volume = Float($0) }
                    ), in: 0...1)
                    .accentColor(Color(hex: "FF6B8A"))
                    
                    Image(systemName: "speaker.wave.3.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(.horizontal, 40)
                
                // Controls
                HStack(spacing: 40) {
                    Button(action: { audioManager.previousTrack() }) {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                    }
                    
                    Button(action: { audioManager.togglePlayPause() }) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color(hex: "FF6B8A"), Color(hex: "C44569")],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 70, height: 70)
                            
                            Image(systemName: audioManager.isPlaying ? "pause.fill" : "play.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                                .offset(x: audioManager.isPlaying ? 0 : 2)
                        }
                    }
                    
                    Button(action: { audioManager.nextTrack() }) {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                // Playlist
                VStack(alignment: .leading, spacing: 12) {
                    Text(Strings.MusicPlayer.playlist(localization))
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 4) {
                            ForEach(Array(audioManager.playlist.enumerated()), id: \.element.id) { index, track in
                                Button(action: {
                                    audioManager.stop()
                                    audioManager.currentTrackIndex = index
                                    audioManager.play()
                                }) {
                                    HStack(spacing: 12) {
                                        Image(systemName: index == audioManager.currentTrackIndex ? "music.note" : "music.note.list")
                                            .font(.system(size: 14))
                                            .foregroundColor(index == audioManager.currentTrackIndex ? Color(hex: "FF6B8A") : .white.opacity(0.4))
                                            .frame(width: 24)
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(track.title)
                                                .font(.system(size: 14, weight: index == audioManager.currentTrackIndex ? .bold : .regular))
                                                .foregroundColor(index == audioManager.currentTrackIndex ? Color(hex: "FF6B8A") : .white)
                                            Text(track.artist)
                                                .font(.system(size: 11))
                                                .foregroundColor(.white.opacity(0.4))
                                        }
                                        
                                        Spacer()
                                        
                                        if index == audioManager.currentTrackIndex && audioManager.isPlaying {
                                            Image(systemName: "waveform")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color(hex: "FF6B8A"))
                                                .symbolEffect(.variableColor.iterative, isActive: true)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                    .background(index == audioManager.currentTrackIndex ? Color(hex: "FF6B8A").opacity(0.1) : Color.clear)
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 200)
                }
                
                Spacer()
            }
        }
    }
}
