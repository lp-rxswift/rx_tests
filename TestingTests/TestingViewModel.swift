import XCTest
import RxSwift
import RxCocoa
import RxTest
@testable import Testing

class TestingViewModel : XCTestCase {
  var viewModel: ViewModel!
  var scheduler: ConcurrentDispatchQueueScheduler!

  override func setUp() {
    super.setUp()
    viewModel = ViewModel()
    scheduler = ConcurrentDispatchQueueScheduler(qos: .default)
  }
}
