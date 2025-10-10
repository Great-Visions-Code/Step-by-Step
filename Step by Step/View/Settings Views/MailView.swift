//
//  MailView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/8/25.
//

import SwiftUI
import MessageUI

// MARK: - MailAttachment

/// A lightweight container representing a single email attachment.
///
/// ## Responsibilities
/// - Holds raw data along with its MIME type and filename so it can be attached to an email.
///
/// ## Design
/// - Plain struct with three stored properties; intentionally minimal to keep the email pipeline simple.
///
/// ## Ownership & State
/// - Value type; callers are responsible for managing the lifetime of `data`.
///
/// > Note:
/// > Keep attachments reasonably sized to avoid Mail composer rejections or long send times.
///
struct MailAttachment {
    /// The raw bytes of the attachment (e.g., PNG/JPEG/JSON/TXT).
    let data: Data
    /// IANA media type (e.g., `"image/jpeg"`, `"application/json"`, `"text/plain"`).
    let mimeType: String
    /// Suggested filename as it should appear in the recipient’s email client.
    let fileName: String
}

// MARK: - MailView
/// A SwiftUI wrapper for `MFMailComposeViewController`.
///
/// Bridges UIKit's Mail composer into SwiftUI using `UIViewControllerRepresentable`.
///
/// ## Responsibilities
/// - Present a native Mail compose sheet with subject, recipients, body, and attachments.
/// - Dismiss itself when the user finishes (send/cancel/save).
///
/// ## Design
/// - Encapsulates all configuration in init properties to keep usage sites tidy.
/// - Coordinator conforms to `MFMailComposeViewControllerDelegate` and dismisses on completion.
/// - Non-owning: does not retain external dependencies; content is passed in.
///
/// ## Ownership & State
/// - Stateless view; parent determines when to present via `.sheet`.
/// - Attachments are passed by value and added to the composer in `makeUIViewController`.
///
/// ## Threading & Performance
/// - UIKit view controller creation/updating occurs on the main thread (as per UIKit rules).
/// - Adding large attachments can be memory-intensive; prefer compressed formats.
///
/// > Important:
/// > Callers **must** check `MFMailComposeViewController.canSendMail()` prior to presenting
/// > this view, and provide a fallback (e.g., `mailto:`) when unavailable.
///
/// > TODO(gustavo):
/// > - Expose the result (`MFMailComposeResult`) via a completion handler if callers need analytics.
/// > - Consider a maximum total attachment size to avoid Mail composer issues.
///
struct MailView: UIViewControllerRepresentable {
    
    // MARK: Dependencies (Inputs)
    
    /// The email subject line.
    let subject: String
    
    /// To: recipients. At least one is typically expected by support workflows.
    let recipients: [String]
    
    /// Optional CC recipients.
    var cc: [String] = []
    
    /// Optional BCC recipients.
    var bcc: [String] = []
    
    /// The message body content.
    let messageBody: String
    
    /// Whether the body is HTML formatted.
    var isHTML: Bool = false
    
    /// Attachments to include with the message (if any).
    var attachments: [MailAttachment] = []
    
    // MARK: Coordinator
    
    /// A coordinator to bridge delegate callbacks from `MFMailComposeViewController`.
    ///
    /// - Dismisses the presented composer on any completion state.
    /// - Extend here if you need to surface `result` or `error` back to SwiftUI.
    final class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        /// Delegate callback invoked when the user finishes composing an email.
        ///
        /// - Parameters:
        ///   - controller: The mail compose view controller.
        ///   - result: The compose result (sent, saved, cancelled, failed).
        ///   - error: An optional error from the compose operation.
        func mailComposeController(_ controller: MFMailComposeViewController,
                                    didFinishWith result: MFMailComposeResult,
                                    error: Error?) {
            // Current behavior: silently dismiss on completion.
            // TODO(gustavo): Forward `result`/`error` to a completion if analytics are needed.
            controller.dismiss(animated: true)
        }
    }
    
    /// Creates the coordinator used to communicate with the UIKit controller.
    func makeCoordinator() -> Coordinator { Coordinator() }
    
    // MARK: UIViewControllerRepresentable
    
    /// Creates and configures `MFMailComposeViewController`.
    ///
    /// - Precondition: Should only be called when `MFMailComposeViewController.canSendMail()` is `true`.
    /// - Returns: A configured mail composer ready to present.
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        
        // Basic fields
        vc.setSubject(subject)
        vc.setToRecipients(recipients)
        
        // Optional recipients
        if !cc.isEmpty { vc.setCcRecipients(cc) }
        if !bcc.isEmpty { vc.setBccRecipients(bcc) }
        
        // Body
        vc.setMessageBody(messageBody, isHTML: isHTML)
        
        // Attachments
        for a in attachments {
            vc.addAttachmentData(a.data, mimeType: a.mimeType, fileName: a.fileName)
        }
        
        return vc
    }
    
    /// Updates the presented UIKit controller (no-op for this use case).
    ///
    /// - Note:
    ///   The mail composer does not support incremental updates to its content after presentation.
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
}

// MARK: - Previews

#Preview("SettingsView") {
    // Preview is focused on integration context rather than MailView directly.
    // In practice, guard presentation with `MFMailComposeViewController.canSendMail()`.
    SettingsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel()
    )
}
