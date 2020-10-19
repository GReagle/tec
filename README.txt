tec-new-addr(1)           BSD General Commands Manual          tec-new-addr(1)

NAME
     tec-new-addr — temporary email commands: create an email address

SYNOPSIS
     tec-new-addr -k | -s

DESCRIPTION
     tec-new-addr creates an email address for use with a temporary email ser‐
     vice.  You are expected to redirect stdout of this command and use the
     resulting file as input for subsequent commands

   Arguments and Options
     tec-new-addr does not take any arguments.

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
           tec-new-addr -k > kiwi-account.json

     Show the email address that was created:
           jq -r '.result.email.address' kiwi-account.json

     Pretty print all the account information:
           jq '' kiwi-account.json

   1secmail
     Generate a random email address for 1secmail and save it:
           tec-new-addr -s > secmail-address.txt

     Show the email address that was generated:
           cat secmail-address.txt

SEE ALSO
     tec-ls-hdrs(1), tec-view-msg(1), jq(1)

     https://burner.kiwi/, https://www.1secmail.com/

BSD                            October 19, 2020                            BSD
_____


tec-ls-hdrs(1)            BSD General Commands Manual           tec-ls-hdrs(1)

NAME
     tec-ls-hdrs — temporary email commands: list headers of messages

SYNOPSIS
     tec-ls-hdrs -k | -s

DESCRIPTION
   Input
     tec-ls-hdrs requires the information previously created by
     tec-new-addr(1) to be on its standard input.

   Arguments and Options
     tec-ls-hdrs does not take any arguments.

     -k      Use burner.kiwi temporary email service.

     -s      Use 1secmail temporary email service.

EXAMPLES
   burner.kiwi
           tec-ls-hdrs -k < kiwi-account.json

   1secmail
           tec-ls-hdrs -s < secmail-address.txt

SEE ALSO
     tec-new-addr(1), tec-view-msg(1), jq(1)

BSD                            October 19, 2020                            BSD
_____


tec-view-msg(1)           BSD General Commands Manual          tec-view-msg(1)

NAME
     tec-view-msg — temporary email commands: view the body of a message

SYNOPSIS
     tec-view-msg [-t] -k | -s ID

DESCRIPTION
   Input
     tec-view-msg requires the information previously created by
     tec-new-addr(1) to be on its standard input.

   Arguments and Options
     ID can be found in the output of tec-ls-hdrs(1)

     -k      Use burner.kiwi temporary email service.

     -s      Use 1secmail temporary email service.

     -t      Print text text body of the email message (instead of the HTML
             body)

EXAMPLES
   burner.kiwi
           tec-view-msg -tk b32ee0b3-36c7-4125-94f2-dbc80e80deec <
           kiwi-account.json | less

           tec-view-msg -k 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c <
           kiwi-account.json | elinks

           tec-view-msg -k 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c <
           kiwi-account.json | w3m -T text/html

   1secmail
           tec-view-msg -ts 89642495 < secmail-address.txt | less

SEE ALSO
     tec-new-addr(1), tec-ls-hdrs(1), jq(1)

BSD                            October 19, 2020                            BSD
