syn region smartyZone matchgroup=Statement start="{{" end="}}" contains=smartyProperty, smartyString, smartyBlock, smartyTagName, smartyConstant, smartyInFunc, smartyModifier
syn region smartyComment  matchgroup=Comment   start="{{\*" end="\*}}"
syn keyword smartyModifier debug_print_var
