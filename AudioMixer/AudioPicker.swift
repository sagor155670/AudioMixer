//
//  AudioPicker.swift
//  AudioMixer
//
//  Created by Saiful Islam Sagor on 12/12/23.
//

import Foundation
import UIKit
import SwiftUI
import MobileCoreServices

struct AudioPicker: UIViewControllerRepresentable {
    @Binding var selectedAudioUrl: URL?
    @Binding var isShowingPicker: Bool

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let audioPicker = UIDocumentPickerViewController(documentTypes: [String(kUTTypeAudio)], in: .import)
        audioPicker.delegate = context.coordinator
        audioPicker.allowsMultipleSelection = false // Set to true if you want to allow multiple audio file selection
        return audioPicker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        // Update UI if needed
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIDocumentPickerDelegate {
    var parent: AudioPicker

    init(_ picker: AudioPicker) {
        self.parent = picker
    }

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            print("No file selected")
            return
        }
        
        // Process the selected file URL (e.g., use it to load/process the audio file)
        print("Selected file URL: \(selectedFileURL)")
        
        // Set the selected audio file URL to the parent's binding variable
        parent.selectedAudioUrl = selectedFileURL
        
        parent.isShowingPicker = false
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        parent.isShowingPicker = false
    }
}

