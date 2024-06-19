TOKEN=$(gh auth token)
OUTPUT=$(curl -H "Authorization: Bearer $TOKEN" -X POST \
     -d '{ "query": "query($login: String!) { organization (login: $login) { login databaseId } } ", 
        "variables": {
            "login": "CF-Code-Ltd"
       } 
         }' \
https://api.github.com/graphql) 
DATABASE_ID=$(echo "$OUTPUT" | jq -r '.data.organization.databaseId')
echo "DatabaseID: $DATABASE_ID"