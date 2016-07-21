---
permalink: /
title: Overview
---
{% swagger load from url https://raw.githubusercontent.com/18F/micropurchase/develop/public/api/v0/swagger.json %}
This website is home to the documentation for 18F micro-purchase API.

From ["Open Source Micro-purchasing: An experiment in federal acquisition"](https://18f.gsa.gov/2015/10/13/open-source-micropurchasing/):

> 18F is an open-source team. We currently have hundreds of publicly available repositories, with dozens under active development. We've had numerous contributions from colleagues within government, and contributions from members of the public. But in the next few weeks, we are going to run an experiment: we want to contract for contributions. And we want to do it the 18F way.

Part of contracting the 18F way is ensuring that all systems are built modularly and with APIs as capable as the human interface. The [micro-purchase platform](https://micropurchase.18f.gov) itself is no exception. This means that all data and transactions that are accessible via the web UI can be accessed by software using the API.

This website is written with three types of audience-members in mind:

- micro-purchase participants (e.g. vendors bidding on auctions)
- the general public (e.g. journalists or anyone else who might want to track auctions via API)
- 18F staff (the API contains admin functionality reserved for certain 18F staff members)

### Support

If you are having trouble with the API, there are several ways to get help:

- File an [issue](https://github.com/18F/micropurchase/issues/new).
- Email us at micropurchase@gsa.gov.

If there's anything missing or incorrect in the API documentation, please file an [issue](https://github.com/18F/micropurchase-api-docs/issues/new).

As with any 18F API, it is our goal that the micro-purchase API adhere to our [API Standards](https://github.com/18f/api-standards). Please hold us accountable to these standards.

### Current Version

API requests should always include a version in the URL and older versions will eventually be deprecated after new versions are introduced.

The current version of the API is still in alpha.

### Requests

All API access is over HTTPS and uses the `micropurchase.18f.gov{{ swagger.base_path }}` base URL. All data is sent and received using JSON.

### Parameters

Some requests to view specific items (like a single auction) take the auction ID as a parameter in the request URL.

For bidding, the amount to be bid is submitted as the body of a POST request. They should be encoded as JSON with the following content type in the request headers:

```
Content-Type: application/json
```

### Client Errors

Errors will contain the appropriate HTTP status code as well as a JSON response containing an `error` key:

```
{
  "error": "Bid amount too high"
}
```

### Authentication

Currently all authentication occurs via the GitHub API. Rather than having the micro-purchase platform generate and store API keys, GitHub Personal API Tokens act as the API key. If you have created an account on the micro-purchase platform, you are signed up to use the API. All you need to do is generate a [GitHub Personal API Token](https://github.com/blog/1509-personal-api-tokens) (with no scopes) and put it in the request headers:

```
Api-Key: the-personal-api-token
```

Note that many routes do not require any authentication at all. These docs will note the authentication options for each route.
