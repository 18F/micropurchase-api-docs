---
title: API Reference
permalink: /api-reference/
---

### /auctions

#### GET

Returns a list of all auctions (upcoming, running, and ended). Each auction contains bids and each bid contains one bidder.

Example response:

```
{
  "auctions": [
    {
      "issue_url": "https://github.com/18F/mpt3500/issues/10",
      "github_repo": "https://github.com/18F/mpt3500",
      "start_price": 3500,
      "start_datetime": "2016-01-26T18:00:00+00:00",
      "end_datetime": "2016-02-27T17:00:00+00:00",
      "title": "Review a blog post",
      "description": "Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\r\n\r\n## A Markdown Quote\r\n\r\n> Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\r\n\r\n```\r\ndef foo(bar)\r\n  10.times do\r\n     puts bar\r\n   end\r\nend\r\n```",
      "id": 1,
      "created_at": "2015-12-21T16:40:01+00:00",
      "updated_at": "2015-12-21T16:40:01+00:00",
      "summary": "## Summary\r\n\r\nWe need some prose to be proof-read.",
      "bids": [
        {
          "bidder_id": null,
          "auction_id": 1,
          "amount": 222,
          "created_at": "2016-01-06T16:59:59+00:00",
          "updated_at": "2016-01-06T16:59:59+00:00",
          "id": 68,
          "bidder": {
            "github_id": null,
            "duns_number": null,
            "name": null,
            "email": null,
            "sam_account": null,
            "created_at": null,
            "updated_at": null,
            "id": null
          }
        },
        {
          "bidder_id": null,
          "auction_id": 1,
          "amount": 240,
          "created_at": "2016-01-06T16:59:55+00:00",
          "updated_at": "2016-01-06T16:59:55+00:00",
          "id": 67,
          "bidder": {
            "github_id": null,
            "duns_number": null,
            "name": null,
            "email": null,
            "sam_account": null,
            "created_at": null,
            "updated_at": null,
            "id": null
          }
        }
      ]
    }
  ]
}
```

If an auction is still running, `bid['bidder_id']` and all keys in `bidder` will be `null`. If you are authenticated, any bids you made will not be redacted. This is consistent with the behavior of the web UI.

### /auctions/:id

#### GET

The same as `/auctions`, but returns a hash with a single `auction` key and value.

### /auctions/:id/bids

#### POST

Places a bid in the given auction.

Payload: `bid[amount]`

Payload example:

```
{
  "bid": {
    "amount": 1000
  }
}
```

`amount` must be an integer.

Example request:

```
curl -i \
  -H "Accept: text/x-json" \
  -H "Api-Key: $MICROPURCHASE_API_KEY" \
  -H "Content-Type: application/json" \
  -X POST -d '{"bid": {"amount": 1000}}' \
  https://micropurchase-staging.18f.gov/auctions/1/bids
```

Example response:

```
{
	"bid": {
		"bidder_id": 1,
		"auction_id": 3,
		"amount": 1000,
		"created_at": "2016-01-27T01:12:07+00:00",
		"updated_at": "2016-01-27T01:12:07+00:00",
		"id": 7,
		"bidder": {
			"github_id": "86790",
			"duns_number": "123456789",
			"name": "Alan deLevie",
			"email": "",
			"sam_account": true,
			"created_at": "2015-12-23T14:51:34+00:00",
			"updated_at": "2016-01-26T01:56:24+00:00",
			"id": 1
		}
	}
}
```

### /admin/auctions

#### GET

Just like its non-admin counterpart, but bidder info is never redacted.

### /admin/users

#### GET

Provides a report of all users in the database.

Example response:

```
{
  "admin_report": {
    "quick_stats": {
      "total_users": 0,
      "users_with_duns": 0,
      "users_in_sam": 0,
      "notes": "None of these include admin users"
    },
    "non_admin_users": [],
    "admin_users": [
      {
        "id": 1,
        "github_id": "86790",
        "duns_number": "123456789",
        "name": "Alan deLevie",
        "created_at": "2015-12-23T14:51:34.725+00:00",
        "updated_at": "2016-01-26T01:56:24.477+00:00",
        "email": "",
        "sam_account": true
      }
    ]
  }
}
```
