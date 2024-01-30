name: autoupdate
on:
 push: {}
jobs:
 autoupdate:
 name: autoupdate
    runs-on: ubuntu-18.04
    steps:
 - uses: docker://chinthakagodawita/autoupdate-action:v1
        id: autoupdate
        env:
 GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"
          MERGE_CONFLICT_ACTION: "ignore"

 - run: echo 'Merge conflicts found!'
        if: ${{ steps.autoupdate.outputs.conflicted }}

 - run: echo 'No merge conflicts'
        if: ${{ !steps.autoupdate.outputs.conflicted }}
