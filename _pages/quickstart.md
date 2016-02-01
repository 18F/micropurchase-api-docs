---
title: Quickstart
permalink: /quickstart/
---

### Hello world

In your terminal, run the following curl command:

```
$ curl https://micropurchase.18f.gov/auctions -H "Accept: text/x-json"
```

This returns a JSON string of all `auction` resources. Each `auction` resource contains its child `bid` and `bidder` resources.

### Authentication

#### Why Authenticate?

If you just want to collect auction data via the API, there is no need to authenticate.

If you're an auction participant, you'll be able to do things such as placing bids and viewing your own (temporarily) private bidding data.

If you're a micro-purchase admin at 18F, you'll need to authenticate to access any of the admin resources. If you're an 18F staff member who should be made an admin, send a pull request adding your GitHub ID to [this file](https://github.com/18F/micropurchase/blob/develop/config/admins.yml).

#### Authenticate with a GitHub Personal API Token

Whether you're a vendor or 18F staff, you'll authenticate the same way.

Visit [GitHub](https://github.com/settings/tokens/new). Enter in anything you want in "Token Description". Leave all scopes unchecked in "Select scopes". Click "Generate token". Copy and save the token somewhere safe. Once you leave the token page, GitHub will never reveal it again. The good news is that these tokens are easily re-creatable.

<img src="{{site.baseurl}}/images/access_token.png" alt="The new personal access token form on https://github.com/settings/tokens/new">
