require 'colorizer'.setup{
	'*'; -- Highlight all files, ! to exclude
	css = {
		rgb_fn = true; -- Parse rgb()
	};
	html = {
		names = false; -- Disable color names
	}
}
