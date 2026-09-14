import Foundation

enum KitResources {
    static func url(forResource name: String, withExtension ext: String?) -> URL? {
        // SwiftPM's generated accessor traps when the bundle isn't at the app
        // root or its original build path. Distributed apps use Resources.
        if Bundle.main.bundleURL.pathExtension == "app" {
            return appBundle(at: Bundle.main.bundleURL)?.url(forResource: name, withExtension: ext)
        }
        return Bundle.module.url(forResource: name, withExtension: ext)
    }

    static func appBundle(at appURL: URL) -> Bundle? {
        Bundle(url: appURL.appendingPathComponent("Contents/Resources/Macus_MacusKit.bundle"))
    }
}
