import XCTest
import Matchismo

class CardTest: XCTestCase {
  var card = Card(contents: "Card")
  
  func testIsChosen() {
    card.chosen = false
    XCTAssertEqual(card.isChosen(), false);
    
    card.chosen = true
    XCTAssertEqual(card.isChosen(), true);
  }
  
  func testIsMatched() {
    card.matched = false
    XCTAssertEqual(card.isMatched(), false);
    
    card.matched = true
    XCTAssertEqual(card.isMatched(), true);
  }
  
  func testMatchCalculatesZeroScoreWhenNotMatch() {
    let cards = [Card(contents: "foo")]
    let score = card.match(cards)
    
    XCTAssert(score == 0);
  }
}
