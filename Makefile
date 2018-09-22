all : islayer-vim.zip

remove-zip:
	-rm islayer-vim.zip

islayer-vim.zip: remove-zip
	zip -r islayer-vim.zip .vim

release: islayer-vim.zip
	vimup update-script emmet.vim

test:
	@-rm -f test.log 2> /dev/null
	@vim -N -c "let &rtp .= ',' . getcwd()" -c "so unittest.vim" -c EmmetUnitTest! || cat test.log || exit 1
