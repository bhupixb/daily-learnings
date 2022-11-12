#!/usr/bin/env python3

from jsonschema import validate

schema = {
    "type" : "object",
    "required": [
        "name",
        "version"
    ],
    "properties" : {
        "name" : {
            "type" : "string"
        },
        "version" : {
            "type" : "string"
        },
        "dependencies": {
            "type": "array",
            "required": [
                "name1",
                "version",
                "repository"
            ],
            "properties": {
                "name": {
                    "type": "string"
                },
                "version": {
                    "type": "string"
                },
                "repository": {
                    "type": "string"
                }
            }
        }

    },

}

obj = {
  "apiVersion": "v2",
  "name": "chartname",
  "description": "A Helm chart for Kubernetes",
  "type": "application",
  "version": "0.2.0",
  "appVersion": "1.0.0",
  "dependencies": [
    {
      "name": "kubernetes",
      "repo": "repohere",
      "version": "0.2.2",
      "condition": "kubernetes.enabled",
      "alias": "kubernetes"
    }
  ]
}

validate(obj, schema=schema)
