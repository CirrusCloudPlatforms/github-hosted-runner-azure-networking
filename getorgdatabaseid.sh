TOKEN=$(gh auth token)
OUTPUT=$(curl -H "Authorization: Bearer $TOKEN" -X POST \
     -d '{ "query": "query($login: String!) { organization (login: $login) { login databaseId } } ", 
        "variables": {
            "login": "CirrusCloudPlatforms"
       } 
         }' \
https://api.github.com/graphql) 
DATABASE_ID=$(echo "$OUTPUT" | jq -r '.data.organization.databaseId')
echo "DatabaseID: $DATABASE_ID"