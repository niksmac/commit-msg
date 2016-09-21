Git commit message format checker

This is a simple bash script to check against rules
1-4 and 6 from the following list

 1. Separate subject from body with a blank line
 2. Limit the subject line to 50 characters
 3. Capitalize the subject line
 4. Do not end the subject line with a period
 5. Use the imperative mood in the subject line
 6. Wrap the body at 72 characters
 7. Use the body to explain what and why vs. how

These rules were obtained from:

    http://chris.beams.io/posts/git-commit/

Copy the commit-msg.sh script to your own project
as .git/hooks/commit-msg to perform these checks
for each commit.

