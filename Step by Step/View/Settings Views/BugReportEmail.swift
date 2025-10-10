//
//  BugReportEmail.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/8/25.
//
import SwiftUI
import MessageUI
import PhotosUI
/// A normalized frequency selector for bug reports.
///
/// Represents how often a user experiences a specific issue.
///
/// - Conforms to:
///   - `CaseIterable` for easy UI listing (e.g., `Picker`)
///   - `Identifiable` for `ForEach`
///
/// > TODO(gustavo): Localize `rawValue` strings. Consider a `displayName` computed
/// > property if localization must differ from raw values.
///
enum BugFrequency: String, CaseIterable, Identifiable {
    case everyTime = "Every time"
    case often = "Often"
    case rarely = "Rarely"
    case other = "Other"
    var id: String { rawValue }        // Stable identity for lists.
    var label: String { rawValue }     // Convenience for UI binding.
}
/// A self-contained screen to compose and send a bug report via email with diagnostics and screenshots.
///
/// ## Responsibilities
/// - Collect a minimal, structured bug report (summary, steps, expected/actual).
/// - Optionally attach **diagnostics** (TXT/JSON) and up to **5 screenshots**.
/// - Generate a pre-filled email using the in-app mail composer if available, otherwise offer fallbacks.
///
/// ## Design
/// - Uses `CardView` for the form container to match the app’s card visual language.
/// - Keeps inputs focused and scannable with `LabeledContent`, `TextField`, and a compact `TextEditor`.
/// - A segmented control captures report frequency with an “Other” input for custom descriptors.
///
/// ## Ownership & State
/// - Does not own any external models; accepts optional `appMetrics` as an injected dictionary
///   to include context like step goal, today’s steps, etc.
/// - Manages its own UI state for fields, toggles, screenshot selection, and mail composer presentation.
///
/// ## Privacy
/// - Diagnostics include device and app metadata (OS, model, locale, disk, etc.).
///   Ensure user consent is clear and that content is appropriate to share with support.
///   Consider a privacy notice in Settings or the bug form itself if needed.
///
/// ## Notes
/// - Requires `MessageUI` and a configured Mail account on device to send directly.
/// - Falls back to `mailto:` (no attachments) if the composer is unavailable.
/// - Screenshots are limited to 5 to keep email sizes manageable.
/// - `Brand`, `AppInfo`, `DeviceInfo`, `CardView`, `WaveBackground`, `MailView`, `MailAttachment`
///   are expected to exist elsewhere in the app.
///
struct BugReportEmail: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Dependencies (Injected)
    
    /// Optional app metrics (e.g., `"Step Goal": "7,000"`) shown in the email body.
    let appMetrics: [String: String]
    
    // MARK: - Form Fields (State)
    
    @State private var summary = ""
    @State private var steps = "1)\n2)\n3)\n"
    @State private var expected = ""
    @State private var actual = ""
    
    // MARK: - Frequency (State)
    
    @State private var frequency: BugFrequency = .everyTime
    @State private var frequencyOther: String = ""
    
    // MARK: - Toggles (State)
    
    @State private var includeTxtDiagnostics = true
    @State private var includeJSONDiagnostics = true
    
    // MARK: - Screenshots (State)
    
    @State private var pickedItems: [PhotosPickerItem] = []
    @State private var pickedImages: [UIImage] = []
    
    // MARK: - Mail (State)
    
    @State private var showMailView = false
    @State private var showNoMailAlert = false
    
    /// Initializes the view with optional app metrics (defaults to an empty dictionary).
    ///
    /// - Parameter appMetrics: Key-value metadata to include in the email body.
    init(appMetrics: [String: String] = [:]) {
        self.appMetrics = appMetrics
    }
    
    // MARK: - Branding + Content (Computed)
    /// Constructs a subject using the optional summary, e.g.:
    /// - `"GreatVisions Step by Step — Bug: Crash on Convert"` or
    /// - `"GreatVisions Step by Step — Bug Report"` when summary is blank.
    private var subject: String {
        let title = summary.trimmingCharacters(in: .whitespacesAndNewlines)
        let suffix = title.isEmpty ? "Bug Report" : "Bug: \(title)"
        return "\(Brand.subjectPrefix) \(suffix)"
    }
    
    /// Header line included at the top of the body for quick context.
    private var headerLine: String { "\(Brand.companyName) — \(Brand.appDisplayName)" }
    /// Displays the chosen frequency, including “Other” custom text when provided.
    private var frequencyDisplay: String {
        frequency == .other
        ? (frequencyOther.isEmpty ? "Other" : frequencyOther)
        : frequency.label
    }
    
    /// Multiline email body template including user input, device/app details, and metrics.
    ///
    /// - Important: Keep the structure stable for fast triage by support. If you change sections,
    ///   coordinate with your support workflow/search tooling.
    private var bodyTemplate: String {
        """
        \(headerLine)
        ——————————————————————
        Hi Team,
        I’d like to report a bug.
        Summary:
        \(summary.isEmpty ? "—" : summary)
        Steps to Reproduce:
        \(steps.isEmpty ? "—" : steps)
        Expected Result:
        \(expected.isEmpty ? "—" : expected)
        Actual Result:
        \(actual.isEmpty ? "—" : actual)
        Frequency:
        \(frequencyDisplay)
        Screenshots attached: \(pickedImages.isEmpty ? "No" : "Yes (\(pickedImages.count))")
        ---
        App & Device
        • App: \(AppInfo.appName) \(AppInfo.formattedVersion) [\(AppInfo.bundleID)]
        • OS: \(DeviceInfo.systemName) \(DeviceInfo.systemVersion)
        • Device: \(DeviceInfo.model) (\(DeviceInfo.modelIdentifier))
        • Screen: \(DeviceInfo.screenDescription)
        • Battery: \(DeviceInfo.battery)  • Low Power: \(DeviceInfo.lowPowerMode ? "On" : "Off")
        • Storage: Free \(DeviceInfo.freeDisk) / Total \(DeviceInfo.totalDisk)
        • Locale: \(DeviceInfo.locale)
        • Time Zone: \(DeviceInfo.timeZone)
        • Languages: \(DeviceInfo.preferredLanguages)
        App Metrics:
        \(formattedMetricsForBody())
        Thank you!
        """
    }
    
    /// Formats `appMetrics` as a bulleted list (or "—" when empty).
    private func formattedMetricsForBody() -> String {
        if appMetrics.isEmpty { return "—" }
        return appMetrics
            .map { "• \($0.key): \($0.value)" }
            .sorted()
            .joined(separator: "\n")
    }
    
    /// Plain-text diagnostics attachment content.
    ///
    /// > Note: Consider redacting sensitive info or making inclusion opt-in if necessary.
    private var diagnosticsText: String {
        """
        # \(Brand.appDisplayName) — Diagnostics (TXT)
        Generated: \(Date().formatted(.dateTime))
        Company: \(Brand.companyName)
        App: \(AppInfo.appName) \(AppInfo.formattedVersion) [\(AppInfo.bundleID)]
        [Device]
        system=\(DeviceInfo.systemName) \(DeviceInfo.systemVersion)
        model=\(DeviceInfo.model) id=\(DeviceInfo.modelIdentifier)
        screen=\(DeviceInfo.screenDescription)
        battery=\(DeviceInfo.battery) lowPower=\(DeviceInfo.lowPowerMode)
        disk_free=\(DeviceInfo.freeDisk) disk_total=\(DeviceInfo.totalDisk)
        locale=\(DeviceInfo.locale) tz=\(DeviceInfo.timeZone)
        languages=\(DeviceInfo.preferredLanguages)
        [AppMetrics]
        \(appMetrics.map { "\($0.key)=\($0.value)" }.sorted().joined(separator: "\n"))
        """
    }
    
    /// JSON diagnostics attachment payload (pretty printed).
    private var diagnosticsJSONData: Data? {
        let json: [String: Any] = [
            "generatedAt": ISO8601DateFormatter().string(from: Date()),
            "company": Brand.companyName,
            "app": [
                "name": AppInfo.appName,
                "version": AppInfo.shortVersion,
                "build": AppInfo.buildNumber,
                "bundleID": AppInfo.bundleID
            ],
            "device": [
                "system": DeviceInfo.systemName,
                "systemVersion": DeviceInfo.systemVersion,
                "model": DeviceInfo.model,
                "modelIdentifier": DeviceInfo.modelIdentifier,
                "screen": DeviceInfo.screenDescription,
                "battery": DeviceInfo.battery,
                "lowPowerMode": DeviceInfo.lowPowerMode,
                "disk": ["free": DeviceInfo.freeDisk, "total": DeviceInfo.totalDisk],
                "locale": DeviceInfo.locale,
                "timeZone": DeviceInfo.timeZone,
                "languages": DeviceInfo.preferredLanguages
            ],
            "appMetrics": appMetrics
        ]
        return try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
    }
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            WaveBackground()
            ScrollView {
                VStack(spacing: 16) {
                    Text("Report a Bug")
                        .font(.title3).bold()
                    
                    // Card
                    ZStack {
                        CardView()
                        
                        VStack(alignment: .leading, spacing: 14) {
                            // Compact, scannable sections—keep labels short and consistent.
                            LabeledContent("Summary") {
                                TextField("Short title of the issue", text: $summary)
                                    .textInputAutocapitalization(.sentences)
                            }
                            field(title: "Steps to Reproduce",
                                    text: $steps,
                                    placeholder: "1) …\n2) …\n3) …",
                                    minHeight: 110)
                            field(title: "Expected Result",
                                    text: $expected,
                                    placeholder: "What you expected to happen",
                                    minHeight: 70)
                            field(title: "Actual Result",
                                    text: $actual,
                                    placeholder: "What actually happened",
                                    minHeight: 70)
                            
                            // Frequency capture—“Other” adds a freeform text field to clarify.
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Frequency").font(.headline)
                                Picker("Frequency", selection: $frequency) {
                                    ForEach(BugFrequency.allCases) { option in
                                        Text(option.label).tag(option)
                                    }
                                }
                                .pickerStyle(.segmented) // Alternative: .menu for compact dropdowns.
                                
                                if frequency == .other {
                                    TextField("Describe (e.g., “2/5 times”)", text: $frequencyOther)
                                        .textInputAutocapitalization(.never)
                                        .autocorrectionDisabled()
                                }
                            }
                            
                            // Diagnostics toggles—on by default for richer triage.
                            Toggle("Attach diagnostics.txt", isOn: $includeTxtDiagnostics)
                                .tint(.accentColor)
                            Toggle("Attach diagnostics.json", isOn: $includeJSONDiagnostics)
                                .tint(.accentColor)
                            
                            // Screenshots picker + lightweight thumbnail strip.
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Screenshots (optional)").font(.headline)
                                PhotosPicker(
                                    selection: $pickedItems,
                                    maxSelectionCount: 5,           // hard cap for email size
                                    matching: .images
                                ) {
                                    HStack {
                                        Image(systemName: "photo.on.rectangle.angled")
                                        Text(pickedImages.isEmpty ? "Add Screenshots" : "Add More Screenshots")
                                        Spacer()
                                        Text("\(pickedImages.count)/5")
                                            .foregroundStyle(.secondary)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                }
                                .onChange(of: pickedItems) { _, items in
                                    Task {
                                        // Append newly picked images; keep previous ones
                                        for item in items {
                                            if let data = try? await item.loadTransferable(type: Data.self),
                                                let img = UIImage(data: data) {
                                                pickedImages.append(img)
                                            }
                                        }
                                        // Defensive cap: in case of OS quirks exceeding `maxSelectionCount`.
                                        if pickedImages.count > 5 { pickedImages = Array(pickedImages.prefix(5)) }
                                        pickedItems.removeAll()
                                    }
                                }
                                
                                if !pickedImages.isEmpty {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 10) {
                                            ForEach(Array(pickedImages.enumerated()), id: \.offset) { index, image in
                                                ZStack(alignment: .topTrailing) {
                                                    Image(uiImage: image)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 90, height: 160)
                                                        .clipped()
                                                        .cornerRadius(10)
                                                    Button {
                                                        pickedImages.remove(at: index)
                                                    } label: {
                                                        Image(systemName: "xmark.circle.fill")
                                                            .foregroundStyle(.secondary)
                                                    }
                                                    .padding(4)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            // Primary action—enabled only when a summary exists.
                            Button {
                                sendEmail()
                            } label: {
                                Text("Email Bug Report")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .font(.headline)
                            }
                            .buttonStyle(.borderedProminent)
                            .disabled(summary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .sheet(isPresented: $showMailView) {
            // Native mail composer with attachments.
            MailView(
                subject: subject,
                recipients: [Brand.supportEmail],
                messageBody: bodyTemplate,
                isHTML: false,
                attachments: composeAttachments()
            )
        }
        .alert("Can’t Send Email on This Device", isPresented: $showNoMailAlert) {
            // Fallback actions—no attachments for mailto.
            Button("Open Mail App") { openMailApp() }
            Button("Use Mailto (no attachments)") { openMailtoFallback() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("This device isn’t configured to send email directly. You can open the Mail app or use a mailto link. Note: attachments (screenshots/diagnostics) won’t be included with mailto.")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Subviews
    /// Small helper to present a titled `TextEditor` with a visible placeholder and minimum height.
    ///
    /// - Parameters:
    ///   - title: Section label (e.g., "Expected Result").
    ///   - text: Bound text for the editor.
    ///   - placeholder: Hint text when `text` is empty.
    ///   - minHeight: Minimum height for the editor content area.
    private func field(title: String, text: Binding<String>, placeholder: String, minHeight: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.headline)
            TextEditorWithPlaceholder(text: text, placeholder: placeholder)
                .frame(minHeight: minHeight)
        }
    }
    
    // MARK: - Email helpers
    
    /// Builds an array of attachments (diagnostics + screenshots) based on toggles and selections.
    private func composeAttachments() -> [MailAttachment] {
        var atts: [MailAttachment] = []
        
        // Diagnostics
        if includeTxtDiagnostics {
            atts.append(.init(data: Data(diagnosticsText.utf8),
                                mimeType: "text/plain",
                                fileName: "diagnostics.txt"))
        }
        if includeJSONDiagnostics, let json = diagnosticsJSONData {
            atts.append(.init(data: json,
                                mimeType: "application/json",
                                fileName: "diagnostics.json"))
        }
        
        // Screenshots
        for (idx, img) in pickedImages.enumerated() {
            if let data = img.jpegData(compressionQuality: 0.85) {
                atts.append(.init(data: data,
                                    mimeType: "image/jpeg",
                                    fileName: "screenshot_\(idx + 1).jpg"))
            }
        }
        return atts
    }
    
    /// Presents the native mail composer if available; otherwise shows the fallback alert.
    private func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            showMailView = true
        } else {
            showNoMailAlert = true
        }
    }
    
    /// Attempts to open the Mail app directly.
    private func openMailApp() {
        guard let url = URL(string: "message://") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    /// Opens a `mailto:` URL with subject/body prefilled (no attachments supported).
    private func openMailtoFallback() {
        var comps = URLComponents()
        comps.scheme = "mailto"
        comps.path = Brand.supportEmail
        comps.queryItems = [
            .init(name: "subject", value: subject),
            .init(name: "body", value: bodyTemplate)
        ]
        if let url = comps.url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: - Minimal TextEditor placeholder helper

/// A `TextEditor` wrapper that shows a placeholder when the bound text is empty.
///
/// - Note: Uses a `ZStack` with `.allowsHitTesting(false)` on the placeholder to avoid intercepting input.
/// - Tip: Keep placeholder short; long placeholder text can be mistaken for user-entered content.
private struct TextEditorWithPlaceholder: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.secondary)
                    .padding(.top, 8)
                    .allowsHitTesting(false)
            }
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .padding(.horizontal, -4) // Future tweak: evaluate if this is still needed after design refinements.
        }
        .font(.body)
    }
}
