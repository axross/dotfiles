function ll
  command ls --almost-all --color --classify --human-readable -l $argv
end

function '🍣'
  command ll $argv
end