___INFO___
{
  "displayName": "MyCookieKit Cookie Consent",
  "description": "GDPR and Google Consent Mode v2 cookie banner. Enter your MyCookieKit Site ID — the banner goes live automatically and forwards consent signals to Google Tag Manager.",
  "securityGroups": [],
  "id": "cvt_mycookiekit_consent",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "",
    "displayName": "MyCookieKit"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_NAME___
MyCookieKit Cookie Consent


___SANDBOXED_JS_FOR_WEB_TEMPLATE___
const injectScript = require('injectScript');
const setDefaultConsentState = require('setDefaultConsentState');

const siteId = data.siteId;

if (!siteId) {
  data.gtmOnFailure();
  return;
}

// Set Google Consent Mode v2 defaults — deny everything until the visitor chooses.
// MyCookieKit will call gtag('consent', 'update', ...) once the visitor decides.
setDefaultConsentState({
  analytics_storage: 'denied',
  ad_storage: 'denied',
  ad_user_data: 'denied',
  ad_personalization: 'denied',
  functionality_storage: 'granted',
  personalization_storage: 'denied',
  wait_for_update: 2000
});

// Inject the MyCookieKit banner script
injectScript(
  'https://mycookiekit.com/api/script/' + siteId + '.js',
  data.gtmOnSuccess,
  data.gtmOnFailure,
  siteId
);


___WEB_PERMISSIONS___
[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://mycookiekit.com/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "analytics_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_user_data"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_personalization"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "personalization_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___FIELDS___
[
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Site ID",
    "simpleValueType": true,
    "help": "Your MyCookieKit Site ID. Find it on your site\u0027s settings page at mycookiekit.com/dashboard.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___TESTS___
[]
