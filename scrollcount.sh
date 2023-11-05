#!/bin/bash

# Define an array of addresses
addresses=("0x0000000000000000000000000000000000000000" "0x0000000000000000000000000000000000000000" "0x0000000000000000000000000000000000000000" )
# Function to get the number of transactions for an address 
get_transaction_count() {
  local address="$1"
  local api_url="https://api.scrollscan.com/api?module=account&action=txlist&address=${address}&startblock=1&endblock=99999999&sort=asc&apikey=YourApiKeyToken"

  local response
  response=$(curl -s "$api_url")

  # Extract the transaction count from the response
  local transaction_count
  transaction_count=$(echo "$response" | jq -r '.result | length')

  echo "Address: $address, Number of Transactions: $transaction_count"
}

# Iterate over the addresses and make API requests
for address in "${addresses[@]}"; do
  get_transaction_count "$address"
done
