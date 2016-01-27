---
permalink: /
title: Overview
---

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

Currently there is no version of the API. Although the [18F team is currently split on the matter of API versioning](https://github.com/18F/api-standards/issues/5), we may or may not introduce versioning.

Due to the architecture of the micro-purchase platform, the API and web UI share the exact same routes and resources. This coupling should, in theory, be a bulwark against wreckless, user-unfriendly, and backwards-incompatible changes to the API.

Nevertheless, in the event we introduce versioning, the version will be declared in the request headers and never in the URL.

### Schema

All API access is over HTTPS and uses the `micropurchase.18f.gov` base URL. All data is sent and received using JSON.

All API requests must have the following headers:

```
Accept: text/x-json
```

If in the future we version the API, the header will follow the format of:

```
Accept: application/vnd.micropurchase.v{VERSION_NUMBER}+json
```

### Parameters

Currently, the only parameters accepted by the API are in POST requests. They should be encoded as JSON with the following content type in the request headers:

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
