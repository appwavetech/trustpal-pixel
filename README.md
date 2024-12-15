# TrustPal Pixel Injector

This repository contains the TrustPal Pixel Injector template, designed for seamless integration into your website using Google Tag Manager (GTM). It enables you to add the TrustPal pixel to your website effortlessly, enhancing your marketing, attribution, and survey capabilities.

## Features

- **Client ID Integration**: Required parameter to uniquely identify your TrustPal account.
- **Verification Trustmark Selector**: Optional parameter to specify the selector or value for displaying the verification trustmark.
- **Checkout URL Support**: Optional parameter for associating a specific checkout URL with the injected pixel.

## Parameters

### Required

1. **Client ID**
   - Description: The unique ID to include in the TrustPal pixel script.
   - Type: Text
   - Example: `your-client-id`

### Optional

2. **Verification Trustmark Selector**
   - Description: Selector or value for the verification trustmark (if applicable).
   - Type: Text
   - Example: `#trustmark` or `.trust-badge`

3. **Checkout URL**
   - Description: URL of the checkout page (if applicable).
   - Type: Text
   - Example: `https://www.example.com/checkout`

## How to Use

1. Open Google Tag Manager (GTM).
2. Create a new tag and select **Custom Template**.
3. Import the `trustpal_pixel_injector.tpl` template into your GTM account.
4. Configure the required and optional parameters as needed:
   - Enter your **Client ID**.
   - Optionally, provide the **Verification Trustmark Selector** and **Checkout URL**.
5. Save and publish the tag.

## Script Behavior

The template dynamically injects a TrustPal pixel script into your website's `<head>` element. The script includes the following attributes:

- `data-client-id`: The provided Client ID.
- `data-verification-trustmark`: (Optional) The selector or value for the verification trustmark.
- `data-checkout-url`: (Optional) The specified checkout URL.

## Logging and Debugging

The template uses GTM's logging capabilities for debugging purposes. It provides logs for:

- Missing required parameters (e.g., Client ID).
- Successful script injection.

## Example

Here’s an example of the injected script:

```html
<script src="https://trustpal.gr/lib/trustpal-1.0.0.min.js"
        data-client-id="your-client-id"
        data-verification-trustmark="#trustmark"
        data-checkout-url="https://www.example.com/checkout">
</script>
```

## License

This project is licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## Contact

For support or further inquiries, contact **TrustPal - AppWave Technologies GP** at [info@trustpal.gr](mailto:info@trustpal.gr).

