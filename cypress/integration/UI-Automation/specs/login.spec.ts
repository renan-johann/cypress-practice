/// <reference types="cypress" />

describe('First web testing', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('can add new todo items', () => {
    cy.get('.login').click()
    cy.title()
      .should('eq', 'Login - My Store')
  })
})
