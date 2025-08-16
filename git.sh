#!/bin/bash

   cd opal/opal-example-policy-repo
   git add abac_policy.rego
   git commit -m "Fix ABAC policy to use data.result.* paths"
   git push origin master