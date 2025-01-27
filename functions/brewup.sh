#!/bin/bash

brewup() {
  brew update -v && 
  brew upgrade -v --greedy
}