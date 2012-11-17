'use strict'

# jasmine specs for services go here

describe "service", ->

  beforeEach(module "Lions.services")

  describe "version", ->
    it "should return current version", inject((version) ->
      expect(version).toEqual "0.0.1"
    )

  describe "RegisterWizard", ->
    it "should be defined", inject((RegisterWizard) ->
      expect(RegisterWizard).toBeDefined()
    )