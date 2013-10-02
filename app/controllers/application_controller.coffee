action 'status', ->
  send 200, {ok: true, db: if compound.db == 'connected' then true else compound.db}