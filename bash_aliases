function g() {
  case $* in
    ss* ) shift 1; command git status "$@" ;;
    sh* ) shift 1; command git stash "$@" ;;
    sp* ) shift 1; command git stash pop ;;
    d* ) shift 1; command git diff "$@" ;;
    a* ) shift 1; command git add "$@" ;;
    r* ) shift 1; command git reset "$@" ;;
    b* ) shift 1; command git branch "$@" ;;
    p* ) shift 1; gp "$@" ;;
    c* ) shift 1; gc "$@" ;;
    * ) command git "$@" ;;
  esac
}

function gc() {
  echo $*;
  case $* in 
    o* ) shift 1; command git checkout "$@" ;;
    m* ) shift 1; command git commit -m "$@" ;;
    amnd* ) echo $*; shift 1; command git commit --amend ;;
    am* ) shift 1; command git commit -am "$@" ;;
    * ) shift 1; command git commit "$@" ;;
  esac
}

function gp() {
  case $* in 
    r* ) shift 1; command git pull --rebase ;;
    o* ) shift 1; command git push origin "$@" ;;
    * ) command git pull "$@" ;;
  esac
}

function bb() {
  case $* in
    c* ) shift 1; bbc "$@" ;;
    s* ) shift 1; command brazil-build server "$@" ;;
    ut* ) shift 1; command brazil-build unit-tests "$@" ;;
    t* ) shift 1; command brazil-build t -Df="$@" ;;
    * ) command brazil-build "$@" ;;
  esac
}

function bbc() {
  case $* in 
    s* ) command brazil-build clean; brazil-build server ;;
    b* ) command brazil-build clean; brazil-build ;;
    * ) command brazil-build clean ;;
  esac
}

alias bi='brazil-recursive-cmd --allPackages --continue brazil-build clean; brazil-recursive-cmd --allPackages brazil-build'
alias bps4='brazil-recursive-cmd --allPackages --continue brazil-build clean; brazil-recursive-cmd --allPackages brazil-build -Dpack=Ps4'
alias pr='post-review -i shaktis,kprajith,somdip,aggarw -u dv-blast-eng-blr -o --testing-done="Tested on Browser. UTs added and Passing" $@'
