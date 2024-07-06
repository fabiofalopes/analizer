 #!/bin/bash

rsync -avu --delete /home/kali/.config/fabric/mypatterns/ /home/kali/projectos/analizer/mypatterns

:'

This puts folder A into folder B:

rsync -avu --delete "/home/user/A" "/home/user/B"

If you want the contents of folders A and B to be the same, put /home/user/A/ (with the slash) as the source. This takes not the folder A but all of its content and puts it into folder B. Like this:

rsync -avu --delete "/home/user/A/" "/home/user/B"

    -a Do the sync preserving all filesystem attributes
    -v run verbosely
    -u only copy files with a newer modification time (or size difference if the times are equal)
    --delete delete the files in target folder that do not exist in the source


'

