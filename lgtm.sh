echo "\![](`curl https://lgtmoon.herokuapp.com/api/images/recent | jq '.images[0].url' | tr -d '\"'`)" | xclip
