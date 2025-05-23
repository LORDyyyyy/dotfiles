#!/usr/bin/env bash
# A script to push to GitHub with one command.
# Usage:
#   push [branch | C|c for current | F|f for fzf] [commit message...]

if [ "$#" -lt 2 ]; then
    echo "Error: At least 2 arguments are required."
    echo "Usage: $0 [branch | C|c for current | F|f for fzf] [#1 commit word] [#2 commit word] ..."
    exit 1
fi

case "$1" in
    C|c)
        branch=$(git rev-parse --abbrev-ref HEAD)
        ;;
    F|f)
        if ! command -v fzf >/dev/null 2>&1; then
            echo "Error: fzf is not installed. Please install fzf to use branch selection."
            exit 1
        fi
        branch=$(git for-each-ref --format='%(refname:short)' refs/heads/ refs/remotes/origin/ \
         | grep -vE 'HEAD|origin/HEAD' \
         | sed 's|^origin/||' \
         | sort -u \
         | fzf)
        if [ -z "$branch" ]; then
            echo "Error: No branch selected."
            exit 1
        fi
        ;;
    *)
        branch="$1"
        ;;
esac

commit_message="${*:2}"

echo "Pushing to branch: $branch"
echo "Commit message: $commit_message"

read -p "Proceed? (Y/n): " confirm
if [[ "$confirm" =~ ^[Nn]$ ]]; then
    echo "Aborted."
    exit 0
fi

git add .
git commit -m "$commit_message"
git push origin "$branch"

