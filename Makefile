README.txt: tec-new-addr.1 tec-ls-hdrs.1 tec-view-msg.1 Makefile
	{ man -l tec-new-addr.1; printf '_____\n\n'; echo; man -l tec-ls-hdrs.1; printf '_____\n\n' ; echo; man -l tec-view-msg.1; } > README.txt
