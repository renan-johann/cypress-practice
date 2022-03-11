/// <reference types="cypress" />

describe('First web testing', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('can add new todo items', () => {
    cy.get('.login').click()
    cy.title()
      .should('eq', 'Login - My Store')
      cy.get('#email').type('renan.phelps18@gmail.com')
      cy.get('#passwd').type('12345')
  })

  it('should contain the word heroes', () => {
    cy.contains("Best Sellers");
  })
})
