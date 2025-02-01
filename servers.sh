#!/bin/bash

# Programs needed for the entire system
servers=(
  #######  
  # LSP #
  #######

  "clangd" 
  "lua-language-server" 
  "marksman" 
  "rust_hdl" 

  ###########
  # LINTERS #
  ###########
  
  "cpplint" 
  "cspell" 
  "markdownlint" 
  "pylint" 
  "selene" 
  
  ##############
  # FORMATTERS #
  ##############
  
  "black" 
  "clang-format" 
  "stylua"
  

)
