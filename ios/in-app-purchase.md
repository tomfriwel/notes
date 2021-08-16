# In App Purchase

### Server-to-server notifications

- [Enabling App Store Server Notifications](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/enabling_app_store_server_notifications?language=objc)
- [status](https://developer.apple.com/documentation/appstorereceipts/status?language=objc)
- [responseBody(notification)](https://developer.apple.com/documentation/appstoreservernotifications/responsebody?language=objc)
- [requestBody(verifyReceipt)](https://developer.apple.com/documentation/appstorereceipts/requestbody?language=objc)
- [responseBody(verifyReceipt)](https://developer.apple.com/documentation/appstorereceipts/responsebody?language=objc)

#### status

21000
The request to the App Store was not made using the HTTP POST request method.

21001
This status code is no longer sent by the App Store.

21002
The data in the receipt-data property was malformed or the service experienced a temporary issue. Try again.

21003
The receipt could not be authenticated.

21004
The shared secret you provided does not match the shared secret on file for your account.

21005
The receipt server was temporarily unable to provide the receipt. Try again.

21006
This receipt is valid but the subscription has expired. When this status code is returned to your server, the receipt data is also decoded and returned as part of the response. Only returned for iOS 6-style transaction receipts for auto-renewable subscriptions.

21007
This receipt is from the test environment, but it was sent to the production environment for verification.

21008
This receipt is from the production environment, but it was sent to the test environment for verification.

21009
Internal data access error. Try again later.

21010
The user account cannot be found or has been deleted.

#### 

`expires_date_ms`

Manage auto-renewable subscriptions. Store this value, `original_transaction_id`, `product_id`, and `purchase_date_ms` for each subscription, as a best practice.

- [expires_date_ms](https://developer.apple.com/documentation/appstorereceipts/expires_date_ms?language=objc)
- [original_transaction_id](https://developer.apple.com/documentation/appstorereceipts/original_transaction_id?language=objc)
- `product_id`: The unique identifier of the product purchased. You provide this value when creating the product in App Store Connect, and it corresponds to the productIdentifier property of the SKPayment object stored in the transaction’s payment property.
- `purchase_date_ms`: The time when the App Store charged the user’s account for a subscription purchase or renewal after a lapse, in the UNIX epoch time format, in milliseconds. Use this time format for processing dates.


#### [notification_type](https://developer.apple.com/documentation/appstoreservernotifications/notification_type?language=objc)

```
CANCEL
Indicates that Apple Support canceled the auto-renewable subscription and the customer received a refund as of the timestamp in cancellation_date_ms.

CONSUMPTION_REQUEST
Indicates that the customer initiated a refund request for a consumable in-app purchase, and the App Store is requesting that you provide consumption data. For more information, see Send Consumption Information.

DID_CHANGE_RENEWAL_PREF
Indicates that the customer made a change in their subscription plan that takes effect at the next renewal. The currently active plan isn’t affected.

DID_CHANGE_RENEWAL_STATUS
Indicates a change in the subscription renewal status. In the JSON response, check auto_renew_status_change_date_ms to know the date and time of the last status update. Check auto_renew_status to know the current renewal status.

DID_FAIL_TO_RENEW
Indicates a subscription that failed to renew due to a billing issue. Check is_in_billing_retry_period to know the current retry status of the subscription. Check grace_period_expires_date to know the new service expiration date if the subscription is in a billing grace period.

DID_RECOVER
Indicates a successful automatic renewal of an expired subscription that failed to renew in the past. Check expires_date to determine the next renewal date and time.

DID_RENEW
Indicates that a customer’s subscription has successfully auto-renewed for a new transaction period.

INITIAL_BUY
Occurs at the user’s initial purchase of the subscription. Store latest_receipt on your server as a token to verify the user’s subscription status at any time by validating it with the App Store.

INTERACTIVE_RENEWAL
Indicates the customer renewed a subscription interactively, either by using your app’s interface, or on the App Store in the account’s Subscriptions settings. Make service available immediately.

PRICE_INCREASE_CONSENT
Indicates that App Store has started asking the customer to consent to your app’s subscription price increase. In the unified_receipt.Pending_renewal_info object, the price_consent_status value is 0, indicating that App Store is asking for the customer’s consent, and hasn’t received it. The subscription won’t auto-renew unless the user agrees to the new price. When the customer agrees to the price increase, the system sets price_consent_status to 1. Check the receipt using verifyReceipt to view the updated price-consent status.

REFUND
Indicates that the App Store successfully refunded a transaction for a consumable in-app purchase, a non-consumable in-app purchase, or a non-renewing subscription. The cancellation_date_ms contains the timestamp of the refunded transaction. The original_transaction_id and product_id identify the original transaction and product. The cancellation_reason contains the reason.

REVOKE
Indicates that an in-app purchase the user was entitled to through Family Sharing is no longer available through sharing. StoreKit sends this notification when a purchaser disabled Family Sharing for a product, the purchaser (or family member) left the family group, or the purchaser asked for and received a refund. Your app will also receive a paymentQueue(_:didRevokeEntitlementsForProductIdentifiers:) call. For more information about Family Sharing, see Supporting Family Sharing in Your App.

RENEWAL (DEPRECATED)
As of March 10, 2021 this notification is no longer sent in production and sandbox environments. Update your existing code to rely on the DID_RECOVER notification type instead.
```