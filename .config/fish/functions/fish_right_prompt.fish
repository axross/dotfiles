function fish_right_prompt
  set_color yellow
  printf '%s ' (prompt_pwd)

  if git_is_repo
    set -l branch (git_branch_name ^/dev/null)
    set -l remote "origin"
    set -l ref (git show-ref --head --abbrev | awk '{print substr($0,0,7)}' | sed -n 1p)
    
    if git_is_stashed
      set_color white
      echo -n -s "^"
    end

    set_color white
    echo -n -s "["
    
    if git_is_dirty
      set_color white
      echo -n -s "*"
    end
          
    if command git symbolic-ref HEAD > /dev/null ^/dev/null
      if git_is_staged
        set_color cyan
      else
        set_color yellow
      end

      echo -n -s "$branch"
    else
      echo -n -s "$ref"
    end

    if command git remote | grep $remote > /dev/null ^/dev/null
      set -l behind_count (echo (command git rev-list $branch..$remote/$branch ^/dev/null | wc -l | tr -d " "))
      set -l ahead_count (echo (command git rev-list $remote/$branch..$branch ^/dev/null | wc -l | tr -d " "))

      if test $ahead_count -ne 0
        set_color black -o
        echo -n -s " +"$ahead_count
      end

      if test $behind_count -ne 0
        set_color black -o
        echo -n -s " -"$behind_count
      end
    end

    set_color white
    echo -n -s "] "
  end

  set_color normal
end
