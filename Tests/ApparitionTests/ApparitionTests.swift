import XCTest
@testable import Apparition

final class ApparitionTests: XCTestCase {
    func testVersionIsNonEmpty() {
        XCTAssertFalse(Apparition.version.isEmpty)
    }
}
