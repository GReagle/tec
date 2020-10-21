tec(1)                    BSD General Commands Manual                   tec(1)

NAME
     tec — temporary email command

SYNOPSIS
     tec -c | -l
     tec [-t] -v ID

DESCRIPTION
     This is a command for using a temporary email service.

FLAGS
   Temporary email services
     -k      Use burner.kiwi temporary email service.

     -s      Use 1secmail temporary email service.

   Options
     -t      Print text body of the email message being viewed (instead of the
             HTML body)

   Actions
     -c      Create a new email address for use with a temporary email ser‐
             vice.  You are expected to redirect stdout of this action and use
             the resulting file as input for the other actions.

     -l      List headers of messages.  You are expected to redirect stdin of
             this action.

     -v      View the body of message ID.  You are expected to redirect stdin
             of this action.

EXAMPLES
   burner.kiwi
     Create an email address with burner.kiwi and save the account informa‐
     tion:
           tec -kc > kiwi-account.json

     Show the email address that was created:
           jq -r '.result.email.address' kiwi-account.json

     Pretty print all the account information:
           jq '' kiwi-account.json

     List messages
           tec -kl < kiwi-account.json

     View message
           tec -kv 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c < kiwi-account.json |
           elinks

           tec -kv 5e7e884f-7e2a-40db-8ca3-c2d5a9a2995c < kiwi-account.json |
           w3m -T text/html

   1secmail
     Generate a random email address for 1secmail and save it:
           tec -sc > secmail-address.txt

     Show the email address that was generated:
           cat secmail-address.txt

     List messages
           tec -sl < secmail-address.txt

     View message
           tec -tsv 89642495 < secmail-address.txt | less

SEE ALSO
     jq(1)

BSD                            October 21, 2020                            BSD
