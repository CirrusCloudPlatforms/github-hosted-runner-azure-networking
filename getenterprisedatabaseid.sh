# gh auth login
# gh auth refresh --scopes read:enterprise
TOKEN=$(gh auth token)
OUTPUT=$(curl -H "Authorization: Bearer $TOKEN" -X POST \
     -d '{ "query": "query($slug: String!) { enterprise (slug: $slug) { slug databaseId } } ", 
        "variables": {
            "slug": "beis"
       } 
         }' \
https://api.github.com/graphql) 
DATABASE_ID=$(echo "$OUTPUT" | jq -r '.data.enterprise.databaseId')
echo "DatabaseID: $DATABASE_ID"