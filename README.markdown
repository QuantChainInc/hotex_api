Ruby client for Hotex API
==========================

[![Build Status](https://travis-ci.org/hotex/hotex-client-ruby.png?branch=master)](https://travis-ci.org/hotex/hotex-client-ruby)

`hotex-client-ruby` is a client for Hotex API, support all Hotex API functions like submit order, get tickers, etc. It's also a reference client implementation, where you can find how to authenticate private Hotex API.

### Requirements ###

* ruby 2.0.0 or higher (if you want to run 'rake test' in this gem you'll need ruby 2.1.0 or higher)
* openssl

#### REST API client ####

Use `#get` or `#post` to access API after you created a `HotexAPI::Client`:

```ruby
  require 'hotex_client'

  # Client can be initialized not providing key and sercet, but this client can only access public APIs
  client_public = HotexAPI::Client.new endpoint: 'https://hotex.com'

  # GET public api /api/v2/markets
  client_public.get_public '/api/v2/markets'

  # To build a full functional client which can access both public/private api, access_key/secret_key
  # are required.
  #
  # `endpoint` can be ignored or set to any Hotex powered exchange.
  #
  # If there's no data received in `timeout` seconds, Net::OpenTimeout will be raised. Default to 60.
  #
  client = HotexAPI::Client.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'https://hotex.com', timeout: 60

  # GET private api /api/v2/orders with 'market=btccny'
  client.get '/api/v2/orders', market: 'btccny'

  # POST to create an order
  client.post '/api/v2/orders', market: 'btccny', side: 'sell', volume: '0.11', price: '2955.0'

  # POST to create multiple orders at once
  client.post '/api/v2/orders/multi', market: 'btccny', orders: [{side: 'buy', volume: '0.15', price: '2955.0'}, {side: 'sell', volume: '0.16', price: '2956'}]
```

Check [Hotex API v2 Documents](https://hotex.com/documents/api_v2) for details on Hotex API.

### Streaming API client ###

Streaming API client is built upon eventmachine, it will start an endless loop to accept updates from server side, you only need to provide a callback block:

```ruby
  require 'hotex_client'

  client = HotexAPI::StreamingClient.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'wss://hotex.com:8080'
  client.run do |message|
    # do whatever you want with message
  end
```

### License ###

`hotex-client-ruby` is released under MIT license. See [http://hotex.mit-license.org](http://hotex.mit-license.org) for more information.

### How To Contribute ###

Just create an issue or open a pull request :)
