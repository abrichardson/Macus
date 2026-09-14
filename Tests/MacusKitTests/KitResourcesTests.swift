import Foundation
import Testing
@testable import MacusKit

struct KitResourcesTests {
    @Test func relocatedAppFindsResourcesWithoutBuildDirectory() throws {
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        defer { try? FileManager.default.removeItem(at: root) }
        let app = root.appendingPathComponent("Relocated Macus.app")
        let resources = app.appendingPathComponent("Contents/Resources/Macus_MacusKit.bundle")
        try FileManager.default.createDirectory(at: resources, withIntermediateDirectories: true)
        let script = resources.appendingPathComponent("windows-write.sh")
        try Data("fixture".utf8).write(to: script)
        let bundle = try #require(KitResources.appBundle(at: app))
        #expect(bundle.url(forResource: "windows-write", withExtension: "sh") == script)
        #expect(bundle.url(forResource: "missing", withExtension: "sh") == nil)
        #expect(KitResources.appBundle(at: root.appendingPathComponent("Missing.app")) == nil)
    }

    @Test func packageResourcesRemainAvailable() {
        #expect(KitResources.url(forResource: "windows-write", withExtension: "sh") != nil)
        #expect(!DistroCatalog.bundled().entries.isEmpty)
        #expect(KitResources.url(forResource: "InventoryToolkit", withExtension: nil) != nil)
    }
}
