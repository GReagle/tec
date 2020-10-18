TEC-CREATE-ADDRESS(1)     BSD General Commands Manual    TEC-CREATE-ADDRESS(1)

NAME
     tec-create-address — temporary email commands: create an email address

SYNOPSIS
     tec-create-address -k | -s

DESCRIPTION
     tec-create-address creates an email address for use with a temporary
     email service.

   Arguments and Options
     tec-create-address does not take any arguments.

     -k      Use burner.kiwi temporary email service.  With this option, it
             prints a json string containing all the details of the account
             including the authentication token.

     -s      Use 1secmail temporary email service.  With this option, it gen‐
             erates a random email address, which it prints to stdout (without
             communicating with the service).

EXAMPLES
   burner.kiwi
     Create an email address with burner.kiwi and save the account informa‐
     tion:
           tec-create-address -k > kiwi-account.json

     Show the email address that was created:
           jq -r '.result.email.address' kiwi-account.json

     Pretty print all the account information:
           jq '' kiwi-account.json

   1secmail
     Generate a random email address for 1secmail and save it:
           tec-create-address -s > secmail-address.txt

     Show the email address that was generated:
           cat secmail-address.txt

SEE ALSO
     tec-list-headers(1), tec-view-message(1), jq(1)

     https://burner.kiwi/, https://www.1secmail.com/

BSD                            October 18, 2020                            BSD

------------------------------------------------------------------------------

TEC-LIST-HEADERS(1)       BSD General Commands Manual      TEC-LIST-HEADERS(1)

NAME
     tec-list-headers — temporary email commands: list headers of messages

SYNOPSIS
     tec-list-headers -k | -s

DESCRIPTION
   Input
     tec-list-headers requires the information previously created by
     tec-create-email(1) to be on its standard input.

   Arguments and Options
     tec-list-headers does not take any arguments.

     -k      Use burner.kiwi temporary email service.

     -s      Use 1secmail temporary email service.

EXAMPLES
   burner.kiwi
           tec-list-headers -k < kiwi-account.json

   1secmail
           tec-list-headers -s < secmail-address.txt

SEE ALSO
     tec-create-email(1), tec-view-message(1), jq(1)

BSD                            October 18, 2020                            BSD

------------------------------------------------------------------------------

TEC-VIEW-MESSAGE(1)       BSD General Commands Manual      TEC-VIEW-MESSAGE(1)

NAME
     tec-view-message — temporary email commands: view a message

SYNOPSIS
     tec-view-message [-t] -k | -s ID

DESCRIPTION
   Input
     tec-view-message requires the information previously created by
     tec-create-email(1) to be on its standard input.

   Arguments and Options
     ID can be found in the output of tec-list-headers(1)

     -k      Use burner.kiwi temporary email service.

     -s      Use 1secmail temporary email service.

     -t      Print text text body of the email message (instead of the HTML
             body)

EXAMPLES
   burner.kiwi
           tec-view-message -tk b32ee0b3-36c7-4125-94f2-dbc80e80deec <
           kiwi-account.json | less

           tec-view-message -k 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c <
           kiwi-account.json | elinks

           tec-view-message -k 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c <
           kiwi-account.json | w3m -T text/html

   1secmail
           tec-view-message -ts 89642495 < secmail-address.txt | less

SEE ALSO
     tec-create-email(1), tec-list-headers(1), jq(1)

BSD                            October 18, 2020                            BSD
