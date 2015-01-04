import XCTest
import Matchismo

class DeckTest: XCTestCase {
  var deck = Deck()
  
  func testDrawRandomCardReturnsCardWhenCards() {
    deck.addCard(Card(contents: "card"))
    let card = deck.drawRandomCard()
    XCTAssertNotNil(card)
    XCTAssertEqual(card!.contents, "card")
  }
  
  func testDrawRandomCardReturnsNilWhenNoCards() {
    let card = deck.drawRandomCard()
    XCTAssertNil(card)
  }
  
  func testAddCard() {
    XCTAssertEqual(deck.cards.count, 0)
    deck.addCard(Card())
    XCTAssertEqual(deck.cards.count, 1)
  }
  
  func testAddCardToTop() {
    let card1 = Card()
    let card2 = Card()
    XCTAssertEqual(deck.cards.count, 0)
    deck.addCard(card1)
    deck.addCard(card2, atTop: true)
    XCTAssertEqual(deck.cards.count, 2)
    XCTAssert(deck.cards.first === card2)
  }
}
