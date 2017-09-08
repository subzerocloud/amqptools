#!/bin/bash

MESSAGE_ROUTING_KEY=$2
MESSAGE_FILE=$3
MESSAGE=$(cat $MESSAGE_FILE)

# cleanup
rm $MESSAGE_FILE

# if the message is a JSON object, you can convert all the keys to vars like this
# while read k v; do export $k=$v; done < <(echo  $MESSAGE | jq -c -r 'to_entries[] | [.key, .value] | @tsv')

# works starts here
# just output the message
echo "$MESSAGE_ROUTING_KEY | $MESSAGE"
