syn region smartyZone     matchgroup=Statement   start="{{"   end="}}" contains=smartyParameter, smartyProperty, smartyGlue, smartyModifier, smartyDollarSign, smartyInBracket, smartyStringDouble, smartyVariable, smartyString, smartyBlock, smartyTagName, smartyConstant, smartyInFunc
syn region smartyComment  matchgroup=Comment   start="{{\*" end="\*}}"
