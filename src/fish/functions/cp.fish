# Defined in - @ line 1
function cp --description 'alias cp=cp --reflink=auto --sparse=always'
	command cp --reflink=auto --sparse=always $argv;
end
