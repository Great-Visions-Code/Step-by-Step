//
//  WaveBackground.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 7/18/25.
//

import SwiftUI

/// A dynamic, animated background view that simulates layered waves moving in a calm, looping pattern.
///
/// The waves are designed to provide ambient, atmospheric motion with subtle variations in amplitude,
/// opacity, and offset to create depth. This can be used as a visually engaging background in apps.
///
/// - Parameters:
///   - animated: A Boolean flag that controls whether the waves animate. Defaults to `true`.
///   - verticalCoverage: A CGFloat between `0` and `1` controlling how much vertical space the waves occupy. Defaults to `0.38`.
struct WaveBackground: View {
    
    @Environment(\.colorScheme) private var scheme
    
    /// Optional slow “breathing” animation toggle.
    var animated: Bool = true
    
    /// Adjusts how much vertical space the waves occupy (0–1).
    var verticalCoverage: CGFloat = 0.38
    
    /// Controls animation phase progression over time.
    @State private var animPhase: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                skyGradient
                
                // Back to front layering of waves to create depth effect
                wave(
                    yOffset: 0.12, amplitude: 0.06, phaseShift: 0.0,
                    color: Color("Wave3"),
                    baseOpacity: scheme == .dark ? 0.20 : 0.16,
                    geo: geo
                )
                
                wave(
                    yOffset: 0.08, amplitude: 0.07, phaseShift: 0.25,
                    color: Color("Wave2"),
                    baseOpacity: scheme == .dark ? 0.24 : 0.20,
                    geo: geo
                )
                
                wave(
                    yOffset: 0.04, amplitude: 0.08, phaseShift: 0.5,
                    color: Color("Wave1"),
                    baseOpacity: scheme == .dark ? 0.30 : 0.25,
                    geo: geo
                )
            }
            .ignoresSafeArea()
            .onAppear {
                guard animated else { return }
                withAnimation(.linear(duration: 22).repeatForever(autoreverses: false)) {
                    animPhase = 1
                }
            }
        }
    }
    
    // MARK: - Subviews
    
    /// A gradient background to simulate sky color, adapting to light/dark mode.
    private var skyGradient: some View {
        LinearGradient(
            colors: scheme == .dark
                ? [Color("SkyTopDark"), Color("SkyMidDark")]
                : [Color("SkyTopLight"), Color("SkyMidLight")],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    /// A single wave layer, offset and styled independently for depth.
    ///
    /// - Parameters:
    ///   - yOffset: How high the wave appears from the bottom.
    ///   - amplitude: Vertical oscillation strength.
    ///   - phaseShift: Timing offset for animation cycle.
    ///   - color: Wave fill color.
    ///   - baseOpacity: Base opacity for the wave layer.
    ///   - geo: GeometryProxy for parent container.
    @ViewBuilder
    private func wave(
        yOffset: CGFloat,
        amplitude: CGFloat,
        phaseShift: CGFloat,
        color: Color,
        baseOpacity: Double,
        geo: GeometryProxy
    ) -> some View {
        AnimatedWaveShape(
            phase: animPhase + phaseShift,
            yOffset: yOffset * verticalCoverage,
            amplitude: amplitude * verticalCoverage
        )
        .fill(color.opacity(baseOpacity))
        .blur(radius: 0.35) // Reduces banding artifacts in gradients
    }
}

// MARK: - AnimatedWaveShape

/// A smoothly animated wave shape, created with three cubic Bézier curves.
///
/// The wave changes dynamically as `phase` animates from `0` to `1`,
/// causing offsets to shift control points for natural wave-like motion.
///
/// - Parameters:
///   - phase: Progress through animation loop (0-1).
///   - yOffset: Baseline vertical offset as a fraction of height.
///   - amplitude: Maximum vertical deviation as a fraction of height.
struct AnimatedWaveShape: Shape {
    
    var phase: CGFloat
    var yOffset: CGFloat
    var amplitude: CGFloat
    
    /// Enables implicit animation on `phase`.
    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let h = rect.height
        let w = rect.width
        
        let baseY = h * (1 - yOffset)
        let amp = h * amplitude
        
        /// Offsets control points using sine waves for organic motion.
        func offset(_ seed: CGFloat, scale: CGFloat) -> CGFloat {
            sin((phase + seed) * .pi * 2) * scale
        }
        
        let dx = w * 0.04 // Horizontal influence of control points
        
        p.move(to: CGPoint(x: 0, y: baseY))
        
        p.addCurve(
            to: CGPoint(x: w * 0.33,
                        y: baseY - amp + offset(0.11, scale: amp * 0.25)),
            control1: CGPoint(x: w * 0.11 + offset(0.21, scale: dx),
                              y: baseY + offset(0.31, scale: amp * 0.2)),
            control2: CGPoint(x: w * 0.22 + offset(0.41, scale: dx),
                              y: baseY - amp + offset(0.51, scale: amp * 0.3))
        )
        
        p.addCurve(
            to: CGPoint(x: w * 0.66,
                        y: baseY + amp + offset(0.61, scale: amp * 0.25)),
            control1: CGPoint(x: w * 0.44 + offset(0.71, scale: dx),
                              y: baseY - amp * 1.2 + offset(0.81, scale: amp * 0.4)),
            control2: CGPoint(x: w * 0.55 + offset(0.91, scale: dx),
                              y: baseY + amp * 1.2 + offset(0.07, scale: amp * 0.4))
        )
        
        p.addCurve(
            to: CGPoint(x: w,
                        y: baseY + offset(0.17, scale: amp * 0.15)),
            control1: CGPoint(x: w * 0.77 + offset(0.27, scale: dx),
                              y: baseY - amp + offset(0.37, scale: amp * 0.3)),
            control2: CGPoint(x: w * 0.88 + offset(0.47, scale: dx),
                              y: baseY + offset(0.57, scale: amp * 0.2))
        )
        
        p.addLine(to: CGPoint(x: w, y: h))
        p.addLine(to: CGPoint(x: 0, y: h))
        p.closeSubpath()
        return p
    }
}

// MARK: - Previews

struct WaveBackground_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WaveBackground(animated: false)
                .previewDisplayName("Waves Light (Static)")
                .environment(\.colorScheme, .light)
            
            WaveBackground(animated: false)
                .previewDisplayName("Waves Dark (Static)")
                .environment(\.colorScheme, .dark)
            
            WaveBackground(animated: true)
                .previewDisplayName("Waves Animated")
                .environment(\.colorScheme, .dark)
        }
    }
}
