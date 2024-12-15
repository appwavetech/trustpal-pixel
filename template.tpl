___TERMS_OF_SERVICE___

// Copyright 2024 TrustPal - AppWave Technologies GP
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Terms of Service
// By using this template, you agree to the TrustPal Terms of Service.
// You can review the full terms at: https://trustpal.gr/terms-of-use

___INFO___

{
  "displayName": "TrustPal Pixel",
  "description": "Injects the TrustPal pixel into your website.",
  "categories": ["ATTRIBUTION", "MARKETING", "SURVEY"],
  "securityGroups": [],
  "id": "trustpal_pixel_injector",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "https://trustpal.gr/favicon.ico",
    "displayName": "TrustPal",
    "id": "trustpal"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Enter the Client ID to include in the injected script. This field is required.",
    "displayName": "Client ID",
    "defaultValue": "",
    "name": "clientId",
    "type": "TEXT",
    "validators": ["required"]
  },
  {
    "help": "Optional: Enter a selector or value for the Verification Trustmark.",
    "displayName": "Verification Trustmark Selector",
    "defaultValue": "",
    "name": "verificationTrustmark",
    "type": "TEXT"
  },
  {
    "help": "Optional: Enter the Checkout URL to be included in the script.",
    "displayName": "Checkout URL",
    "defaultValue": "",
    "name": "checkoutUrl",
    "type": "TEXT"
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Required permission to log to the console
const log = require('logToConsole');

// Get template parameters
const clientId = data.clientId;
const verificationTrustmark = data.verificationTrustmark || '';
const checkoutUrl = data.checkoutUrl || '';

// Validate required parameter
if (!clientId) {
  log('Error: Client ID is required.');
  data.gtmOnFailure();
  return;
}

// Create script element
const script = document.createElement('script');
script.src = 'https://trustpal.gr/lib/trustpal-1.0.0.min.js';
script.setAttribute('data-client-id', clientId);

if (verificationTrustmark) {
  script.setAttribute('data-verification-trustmark', verificationTrustmark);
}

if (checkoutUrl) {
  script.setAttribute('data-checkout-url', checkoutUrl);
}

// Append the script to the document head
document.head.appendChild(script);

// Log success
log('TrustPal Pixel injected successfully:', {
  clientId: clientId,
  verificationTrustmark: verificationTrustmark,
  checkoutUrl: checkoutUrl
});

// Call gtmOnSuccess when the tag is finished
data.gtmOnSuccess();


___NOTES___

Created on 12/15/2024, 12:34:56 PM
