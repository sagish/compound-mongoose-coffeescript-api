superagent = require 'superagent'
expect = require 'expect.js'

describe 'Server', ->

  it 'should be responseive and connected to database', (done) ->

    superagent
      .get('http://localhost:3000')
      .end (response) ->
        expect(response.status).to.equal 200
        expect(response.body.ok).to.equal true
        expect(response.body.db).to.equal true
        done()