$src = Split-Path -parent $MyInvocation.MyCommand.Definition
$bin = Join-Path $src "bin/debug"
cd $bin

chcp 65001
$env:Path= ".;$env:Path"