/// <reference types="cypress" />

describe('First web testing', () => {
  beforeEach(() => {
    cy.visit('/products')
  })

  it('Select category T-shirt', () => {
    cy.title().should('eq', 'Automation Exercise - All Products');
    cy.get('input#search_product').type('Tshirt');
    cy.get('button#submit_search').click();
  })
})
