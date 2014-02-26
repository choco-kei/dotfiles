"" smartyでも%でタグジャンプできるように
let b:match_words = '<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'

"" smartyのタグでもジャンプできるように追加
let b:match_words .= ',{if\>:{elseif\>:{else\>:{/if\>,{foreach\>:{foreachelse\>:{/foreach\>'

