#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

LIST_SERVICES() {
  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
  echo -e "$SERVICE_ID) $NAME"
  done
}

REGISTER() {
  echo "Please, insert your name: "
  read CUSTOMER_NAME
  INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
}

APPOINTMENT() {
  echo "For what time would you like to make an appointment?"
  read SERVICE_TIME
  FEEDBACK=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | sed 's/^ *//')
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID"  | sed 's/^ *//' )
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  exit
}

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  LIST_SERVICES
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]];
  then
  # if not number
  MAIN_MENU "I could not find that service. What would you like today?"
  # if service does not exist
  fi
  SERVICE_QUERY_RESULT=$($PSQL "SELECT * FROM services WHERE service_id = $SERVICE_ID_SELECTED")  
  if [[ -z $SERVICE_QUERY_RESULT ]]
  then
  MAIN_MENU "I could not find that service. What would you like today?"
  fi

  echo "Insert your phone number: "
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
  REGISTER
  fi
  APPOINTMENT
} 

MAIN_MENU