#!/bin/bash


cat /dev/null > operation_history.txt
re='^[-0-9]+(\.[0-9]+)?\s+(\+|-|\/|\*|\^)\s+[-0-9]+(\.[0-9]+)?$'

echo "Welcome to the basic calculator!" | tee -a operation_history.txt
echo "Enter arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
read -r expression
echo "$expression" >> operation_history.txt



while [ "$expression" != "quit" ]
do
    if [[ "$expression" =~ $re ]]; then
        bc <<< "scale=2; $expression" | tee -a operation_history.txt
    else
        echo "Operation check failed!" | tee -a operation_history.txt
    fi

    echo "Enter arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
    read -r expression
    echo "$expression" >> operation_history.txt
done

echo "Goodbye!" | tee -a operation_history.txt