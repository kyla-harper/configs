# Defined in /tmp/fish.GWfkIL/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	echo

  # User
  set_color -d brcyan
  echo -n [(whoami)@(hostname)]
  set_color normal

  # Git Info (if CWD has it)
  set -l git_branch (git branch ^/dev/null | sed -n '/\*/s///p')
  if [ -n "$git_branch" ]
    set_color -d brgreen
    echo -n "" [git:"$git_branch"]
  end

  # PWD
  set_color -d bryellow
  echo "" [(prompt_pwd)]
  set_color normal

  # Prompty Part
  echo -n '-> '
end
