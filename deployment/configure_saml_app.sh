applicationStartURL="$1"
applicationACSURL="$2"
applicationSAMLAudience="$3"


# aws sso-admin create-application \
#   --application-name "TEAM IDC APP" \
#   --application-type "SAML" \
#   --application-metadata '{"ApplicationACSURL":"...","ApplicationStartURL":"...","ApplicationSAMLAudience":"..."}' \
#   --region us-east-1


  aws sso-admin create-application \
  --application-name "TEAM IDC APP2" \
  --application-type "SAML" \
  --application-metadata "{
    \"ApplicationACSURL\": \"${applicationACSURL}\",
    \"ApplicationStartURL\": \"${applicationStartURL}\",
    \"ApplicationSAMLAudience\": \"${applicationSAMLAudience}\"
  }" \
  --region eu-west-2