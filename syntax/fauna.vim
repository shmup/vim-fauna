" Vim syntax file
" Language: Fauna Schema Language (FSL)
" Maintainer: Jared Tyler Miller
" Latest Revision: 2024-07-14

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword fslKeyword collection constraints index migrations type unique

" Types
syn keyword fslType Array Boolean Date Document Null Number Ref String Time Tuple Object Union

" Boolean
syn keyword fslBoolean true false

" Special characters
syn match fslSpecialChar "[{}[\]|?=<>]"

" Numbers
syn match fslNumber "\<\d\+\>"

" Strings
syn region fslString start=/"/ skip=/\\"/ end=/"/ oneline

" Comments
syn match fslComment "//.*$"

" Field names
syn match fslField "\<\w\+\>:"

" Collection definition
syn region fslCollection start="collection" end="}" fold transparent

" Index definition
syn region fslIndex start="index" end="}" fold transparent

" Dot notation
syn match fslDotNotation "\.\w\+"

" Enum-like definitions
syn match fslEnum "|" nextgroup=fslEnumValue skipwhite
syn match fslEnumValue "\<\w\+\>" contained

" Highlight links
hi def link fslKeyword Keyword
hi def link fslType Type
hi def link fslSpecialChar Special
hi def link fslNumber Number
hi def link fslString String
hi def link fslComment Comment
hi def link fslField Identifier
hi def link fslBoolean Boolean
hi def link fslDotNotation Identifier
hi def link fslEnum Operator
hi def link fslEnumValue Constant

let b:current_syntax = "fsl"
