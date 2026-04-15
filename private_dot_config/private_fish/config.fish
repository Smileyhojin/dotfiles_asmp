set -x PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $PATH

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source

end
