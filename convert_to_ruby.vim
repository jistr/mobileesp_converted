" Vim script to convert MobileESP library from Java to Ruby
" Author: Jiri Stransky
" License: MIT

fun! s:ConvertToRuby()
  set filetype=ruby
  call s:TabsToSpaces()
  call s:ConvertComments()
  call s:FixTrailingSpaces()
  call s:FixShorthandIfs()
  call s:RemovePackage()
  call s:ConvertBrackets()
  call s:ConvertKeywords()
  call s:ConvertClassDefinitions()
  call s:ConvertConstantDefinitions()
  call s:ConvertInstanceVariableDefinitions()
  call s:ConvertMethodDefinitions()
  call s:ConvertParameterLists()
  call s:ConvertLocalVariables()
  call s:ConvertThisDot()
  call s:ConvertStandardMethods()
  call s:ConvertStringContains()
  call s:WrapIntoModule()
  call s:RemoveSemicolons()
  call s:JoinLinesBeginningWithLogicOperators()
  call s:FixBugs()
  call s:FixIndent()
  call s:PrependConversionNotice()
endfun

fun! s:TabsToSpaces()
  normal gg
  " expand tabs to spaces
  %s/\t/    /g
endfun

fun! s:FixTrailingSpaces()
  %s/\s\+$//
endfun

fun! s:FixShorthandIfs()
  " make sure opening bracket is on the line of the condition
  normal gg
  while search("^\\s*{$", 'W') > 0
    normal kJ
  endwhile

  " if / else if
  normal gg
  while search("^\\s\\+\\(if\\|else if\\)", 'W') > 0
    normal f(%$
    normal v"zy
    let l:lastchar = getreg('z')
    if l:lastchar != '{'
      s/$/ {/
      call search(';', 'W')
      s/$/\r}/
    endif
  endwhile

  " else
  normal gg
  while search("^\\s\\+else[\s{]*$", 'W') > 0
    normal $
    normal v"zy
    let l:lastchar = getreg('z')
    if l:lastchar != '{'
      s/$/ {/
      call search(';', 'W')
      s/$/\r}/
    endif
  endwhile
endfun

fun! s:FixIndent()
  normal ggVG=
endfun

fun! s:ConvertComments()
  " convert multiline comments that begin and end on their own lines
  %s/^\s*\/\*\(\_.\{-}\)\*\/\s*$/=begin\r\1\r=end/

  " convert single-line comments on their own line
  %s/^\w*\/\/\(.*\)/#\1/

  " remove single-line comments sharing a line with code
  " (they do nasty stuff to FixShorthandIfs)
  %s/\w*\/\/\(.*\)//
endfun

fun! s:RemovePackage()
  %s/^package .*;$//
endfun

fun! s:ConvertBrackets()
  %s/\s*{$//

  %s/}\_s*else if/elsif/
  %s/}\_s*else/else/

  %s/}\(\s*#.*\)\?$/end/
endfun

fun! s:ConvertKeywords()
  %s/\<null\>/nil/g
endfun

fun! s:ConvertClassDefinitions()
  %s/public class UAgentInfo/class UserAgentInfo/
endfun

fun! s:ConvertConstantDefinitions()
  normal gg
  while search('public static final String ') > 0
    s/public static final String //
    normal ve"zy
    let replacement = s:Underscore(getreg('z'))
    call setreg('x', replacement)
    normal ve"xp
    normal ^ve~
    normal ve"xy

    " replace the identifier in the whole document
    exe "%s/(" . getreg('z') . ")/(" . getreg('x') . ")/g"
  endwhile
endfun

fun! s:ConvertInstanceVariableDefinitions()
  normal gg
  while search("^\\s*\\(public\\|private\\) \\(boolean\\|String\\).*=.*;.*$") > 0
    s/^\s*\(public\|private\) \(boolean\|String\) \(\w*\) = .*;.*$/\3/

    normal ve"zy
    let replacement = s:Underscore(getreg('z'))
    call setreg('x', replacement)
    normal ve"xp
    normal ^ve"xy
    s/\(\w\+\)/attr_reader :\1/

    " replace the identifier in the whole document
    exe "%s/\\<" . getreg('z') . "\\>/" . getreg('x') . "/g"
  endwhile
endfun

fun! s:ConvertMethodDefinitions()
  " constructor
  normal gg
  %s/public UAgentInfo(/def initialize(/

  normal gg
  while search("^\\s*public \\w\\+ \\w\\+(.*).*$", 'W') > 0
    s/\(^\s*\)public \w\+ \(.*$\)/\1def \2/
    normal ma

    normal ^wve"zy
    let replacement = s:Underscore(getreg('z'))
    call setreg('x', replacement)
    normal ^wve"xp
    normal ^wve"xy

    " replace the identifier in the whole document
    exe "%s/\\<" . getreg('z') . "\\>/" . getreg('x') . "/g"

    normal 'a
  endwhile
endfun

fun! s:ConvertParameterLists()
  normal gg
  while search("^\\s*def ", 'W') > 0
    s/\w\+ \(\w\+[,)]\)/\1/ge
  endwhile
endfun

fun! s:ConvertLocalVariables()
  normal gg
  while search("^\\s*\\(boolean\\)\\s\\+\\w\\+\\s*=\\s*\\w\\+\\s*;$", 'W') > 0
    normal ^dw
  endwhile
endfun

fun! s:ConvertThisDot()
  %s/\<this\./@/g
endfun

fun! s:ConvertStandardMethods()
  %s/\.toLowerCase()/.downcase/g
endfun

fun! s:ConvertStringContains()
  " contains
  %s/\.indexOf(\([^)]\+\))\_s*\(!=\|>\)\_s*-1/.include?(\1)/g

  " does not contain
  %s/\<\(\w*\)\.indexOf(\([^)]\+\))\_s*<\_s*0/!\1.include?(\2)/g
endfun

fun! s:RemoveSemicolons()
  %s/;$//
endfun

fun! s:JoinLinesBeginningWithLogicOperators()
  normal gg
  while search("^\\s*\\(&&\\|||\\)", 'W') > 0
    normal kJ
  endwhile
endfun

fun! s:WrapIntoModule()
  normal gg
  call search("class UserAgentInfo")
  exe "normal Omodule MobileESPConverted\e"
  normal G
  exe "normal oend\e"
endfun

fun! s:PrependConversionNotice()
  normal gg
  exe "normal O# This file has been automatically converted to Ruby from Java source code.\e"
  exe "normal o\e"
  exe "normal o\e"
  exe "normal o\e"
endfun

fun! s:FixBugs()
  " fix detect_iphone_or_ipod
  %s/^\s*if (user_agent.include?(DEVICE_IPHONE) || user_agent.include?(DEVICE_IPOD))$/if (detect_iphone() || user_agent.include?(DEVICE_IPOD))
endfun

fun! s:Underscore(text)
  let l:replacement = substitute(a:text, "\\(\\u\\)", "_\\1", "g")
  let l:replacement = substitute(l:replacement, "\\(\\u\\)", "\\l\\1", "g")
  return l:replacement
endfun

call s:ConvertToRuby()
