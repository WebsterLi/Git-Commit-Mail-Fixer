#!/bin/sh

git filter-branch --env-filter '

am="$GIT_AUTHOR_EMAIL"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_COMMITTER_EMAIL" = "[origin_mail]" ]
then
    cm="[target_mail]"
fi
if [ "$GIT_AUTHOR_EMAIL" = "[origin_mail]" ]
then
    am="[target_mail]"
fi

export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_EMAIL="$cm"
'
