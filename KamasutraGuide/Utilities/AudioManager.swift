import Foundation
import AVFoundation
import SwiftUI

// MARK: - Music Track
struct MusicTrack: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let fileName: String
    let duration: TimeInterval
}

// MARK: - Audio Manager
class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    @Published var isPlaying = false
    @Published var currentTrackIndex = 0
    @Published var volume: Float = 0.5 {
        didSet {
            audioPlayer?.volume = volume
            tonePlayer?.volume = volume
            UserDefaults.standard.set(volume, forKey: "kamasutra_music_volume")
        }
    }
    @Published var isMusicEnabled = true {
        didSet {
            UserDefaults.standard.set(isMusicEnabled, forKey: "kamasutra_music_enabled")
            if !isMusicEnabled { stop() }
        }
    }
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    
    private var audioPlayer: AVAudioPlayer?
    private var tonePlayer: AVAudioPlayer?
    private var timer: Timer?
    private var toneTimer: Timer?
    private var currentToneIndex = 0
    
    // Romantic playlist - tracks that user can add to bundle
    let playlist: [MusicTrack] = [
        MusicTrack(title: "Seara Romantica", artist: "Ambient", fileName: "romantic-evening", duration: 180),
        MusicTrack(title: "Pasiune", artist: "Ambient", fileName: "passion", duration: 180),
        MusicTrack(title: "Dragoste Eterna", artist: "Ambient", fileName: "eternal-love", duration: 180),
        MusicTrack(title: "Momentul Nostru", artist: "Ambient", fileName: "our-moment", duration: 180),
        MusicTrack(title: "Sub Stele", artist: "Ambient", fileName: "under-stars", duration: 180),
        MusicTrack(title: "Vis de Iubire", artist: "Ambient", fileName: "love-dream", duration: 180),
        MusicTrack(title: "Noapte Magica", artist: "Ambient", fileName: "magic-night", duration: 180),
        MusicTrack(title: "Tandrele", artist: "Ambient", fileName: "tenderness", duration: 180),
    ]
    
    var currentTrack: MusicTrack {
        playlist[currentTrackIndex % playlist.count]
    }
    
    init() {
        // Load saved preferences
        let savedVolume = UserDefaults.standard.float(forKey: "kamasutra_music_volume")
        if savedVolume > 0 {
            volume = savedVolume
        }
        isMusicEnabled = UserDefaults.standard.object(forKey: "kamasutra_music_enabled") as? Bool ?? true
        
        // Configure audio session
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            // Audio session configuration failed - app will still work without music
        }
    }
    
    // MARK: - Playback Controls
    func play() {
        guard isMusicEnabled else { return }
        
        // Try to play bundled music file first
        if tryPlayBundledTrack() {
            isPlaying = true
            startProgressTimer()
            return
        }
        
        // Fallback: generate ambient tone
        playAmbientTone()
        isPlaying = true
        startProgressTimer()
    }
    
    func pause() {
        audioPlayer?.pause()
        tonePlayer?.pause()
        isPlaying = false
        stopProgressTimer()
    }
    
    func stop() {
        audioPlayer?.stop()
        tonePlayer?.stop()
        toneTimer?.invalidate()
        toneTimer = nil
        isPlaying = false
        currentTime = 0
        stopProgressTimer()
    }
    
    func togglePlayPause() {
        if isPlaying {
            pause()
        } else {
            play()
        }
    }
    
    func nextTrack() {
        stop()
        currentTrackIndex = (currentTrackIndex + 1) % playlist.count
        currentToneIndex = (currentToneIndex + 1) % ambientFrequencies.count
        play()
    }
    
    func previousTrack() {
        stop()
        currentTrackIndex = (currentTrackIndex - 1 + playlist.count) % playlist.count
        currentToneIndex = (currentToneIndex - 1 + ambientFrequencies.count) % ambientFrequencies.count
        play()
    }
    
    // MARK: - Bundled Track Playback
    private func tryPlayBundledTrack() -> Bool {
        let track = currentTrack
        
        // Try common audio formats
        for ext in ["mp3", "m4a", "wav", "aac"] {
            if let url = Bundle.main.url(forResource: track.fileName, withExtension: ext) {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.volume = volume
                    audioPlayer?.numberOfLoops = 0
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()
                    duration = audioPlayer?.duration ?? 0
                    return true
                } catch {
                    continue
                }
            }
        }
        return false
    }
    
    // MARK: - Ambient Tone Generation (Fallback)
    private let ambientFrequencies: [(base: Double, harmony: Double, name: String)] = [
        (261.63, 329.63, "C Major"),   // C + E
        (293.66, 369.99, "D Major"),   // D + F#
        (349.23, 440.00, "F Major"),   // F + A
        (392.00, 493.88, "G Major"),   // G + B
        (261.63, 311.13, "C Minor"),   // C + Eb
        (293.66, 349.23, "D Minor"),   // D + F
        (329.63, 392.00, "E Minor"),   // E + G
        (440.00, 523.25, "A Minor"),   // A + C
    ]
    
    private func playAmbientTone() {
        let sampleRate: Double = 44100
        let toneDuration: Double = 8.0  // 8 second tones with fade
        let numSamples = Int(sampleRate * toneDuration)
        
        let freqPair = ambientFrequencies[currentToneIndex % ambientFrequencies.count]
        
        var audioData = [Float](repeating: 0, count: numSamples)
        
        for i in 0..<numSamples {
            let t = Double(i) / sampleRate
            
            // Fade in/out envelope
            let fadeTime = 2.0
            var envelope: Double = 1.0
            if t < fadeTime {
                envelope = t / fadeTime
            } else if t > toneDuration - fadeTime {
                envelope = (toneDuration - t) / fadeTime
            }
            
            // Generate warm ambient tone with harmonics
            let base = sin(2.0 * Double.pi * freqPair.base * t) * 0.3
            let harmony = sin(2.0 * Double.pi * freqPair.harmony * t) * 0.2
            let sub = sin(2.0 * Double.pi * freqPair.base * 0.5 * t) * 0.15
            let overtone = sin(2.0 * Double.pi * freqPair.base * 2.0 * t) * 0.05
            
            // Slow vibrato for warmth
            let vibrato = sin(2.0 * Double.pi * 4.5 * t) * 0.02
            
            audioData[i] = Float((base + harmony + sub + overtone + vibrato) * envelope * 0.4)
        }
        
        // Create WAV data
        let wavData = createWAVData(from: audioData, sampleRate: Int(sampleRate))
        
        do {
            tonePlayer = try AVAudioPlayer(data: wavData)
            tonePlayer?.volume = volume
            tonePlayer?.numberOfLoops = -1  // Loop continuously
            tonePlayer?.prepareToPlay()
            tonePlayer?.play()
            duration = toneDuration
        } catch {
            // Tone generation failed
        }
    }
    
    private func createWAVData(from samples: [Float], sampleRate: Int) -> Data {
        var data = Data()
        let numChannels: Int16 = 1
        let bitsPerSample: Int16 = 16
        let byteRate = Int32(sampleRate * Int(numChannels) * Int(bitsPerSample / 8))
        let blockAlign = Int16(numChannels * (bitsPerSample / 8))
        let dataSize = Int32(samples.count * Int(bitsPerSample / 8))
        let chunkSize = 36 + dataSize
        
        // RIFF header
        data.append(contentsOf: "RIFF".utf8)
        data.append(contentsOf: withUnsafeBytes(of: chunkSize.littleEndian) { Array($0) })
        data.append(contentsOf: "WAVE".utf8)
        
        // fmt chunk
        data.append(contentsOf: "fmt ".utf8)
        data.append(contentsOf: withUnsafeBytes(of: Int32(16).littleEndian) { Array($0) })
        data.append(contentsOf: withUnsafeBytes(of: Int16(1).littleEndian) { Array($0) }) // PCM
        data.append(contentsOf: withUnsafeBytes(of: numChannels.littleEndian) { Array($0) })
        data.append(contentsOf: withUnsafeBytes(of: Int32(sampleRate).littleEndian) { Array($0) })
        data.append(contentsOf: withUnsafeBytes(of: byteRate.littleEndian) { Array($0) })
        data.append(contentsOf: withUnsafeBytes(of: blockAlign.littleEndian) { Array($0) })
        data.append(contentsOf: withUnsafeBytes(of: bitsPerSample.littleEndian) { Array($0) })
        
        // data chunk
        data.append(contentsOf: "data".utf8)
        data.append(contentsOf: withUnsafeBytes(of: dataSize.littleEndian) { Array($0) })
        
        for sample in samples {
            let intSample = Int16(max(-1.0, min(1.0, sample)) * Float(Int16.max))
            data.append(contentsOf: withUnsafeBytes(of: intSample.littleEndian) { Array($0) })
        }
        
        return data
    }
    
    // MARK: - Progress Timer
    private func startProgressTimer() {
        stopProgressTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if let player = self.audioPlayer, player.isPlaying {
                self.currentTime = player.currentTime
                self.duration = player.duration
            } else if let player = self.tonePlayer, player.isPlaying {
                self.currentTime = player.currentTime.truncatingRemainder(dividingBy: self.duration > 0 ? self.duration : 8.0)
            }
        }
    }
    
    private func stopProgressTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        stop()
    }
}
