private struct RemoteEditorSettings: Codable {
    let editor_mobile: String
    let editor_web: String
}

public enum EditorSettings: String {
    case gutenberg
    case aztec

    static let `default` = EditorSettings.aztec
}

extension EditorSettings {
    init (with response: AnyObject) throws {
        guard let response = response as? [String: AnyObject] else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: nil)
        }

        let data = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
        let editorPreferenesRemote = try JSONDecoder().decode(RemoteEditorSettings.self, from: data)
        self.init(with: editorPreferenesRemote)
    }

    private init(with remote: RemoteEditorSettings) {
        self = EditorSettings(rawValue: remote.editor_mobile) ?? .default
    }
}