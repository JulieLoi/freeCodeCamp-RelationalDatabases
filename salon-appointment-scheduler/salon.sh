#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo $($PSQL "TRUNCATE appointments, customers")

echo -e "\n~~~~~ MY SALON ~~~~~\n"

# Main Menu Selection
MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else 
    echo "Welcome to My Salon, how can I help you?" 
  fi

  # show available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get service selected
  read SERVICE_ID_SELECTED

  # if the choice is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, that is not a valid number! Please, choose again."
  else 
    SERVICE $SERVICE_ID_SELECTED
  fi
}

# Service Selection
SERVICE() {

  # get service
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$1")

  # if service not found
  if [[ -z $SERVICE ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?" 
    break
  fi

  # get customer info
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if not found
  if [[ -z $CUSTOMER_ID  ]]
  then

    # read name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # create customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  fi

  # get customer name
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")

  # ask for appointment time
  echo -e "\nWhat time would you like your $(echo $SERVICE | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME

  # create appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $1, '$SERVICE_TIME')")

  # echo appointment
  echo -e "\nI have you put down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU
