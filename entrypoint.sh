#!/bin/bash -l

 

    # copy source file to target file

    # delete properties which are part of argument 3

    # add properties and respective values as key,vaue pair in target file

 

    set -euo pipefail

 

    main() {

 

      local sourceFile="$1";

      local keysString="$2";

      local valuesString="$3";

 

      SAVEIFS=$IFS       # Save current IFS (Internal Field Separator)

      # read and split keys by ","

      IFS=$',' read -r -a keys <<<"$keysString"

      # read and split keys by ","

      IFS=$',' read -r -a values <<<"$valuesString"

 

      unset IFS

 

      IFS=$SAVEIFS       # Restore original IFS

 

      local index=0;

      for i in "${keys[@]}"; do

        local key=${keys[index]}

        deleteProperty "$sourceFile" "$key"

        local updatedProp="$key=${values[index]}"

        echo $updatedProp >> $sourceFile #add property into file

        index=$index+1

      done

    }

 

    deleteProperty() {

      # echo "delete called: ${1} - ${2}"

      local prop="$2"

      local sourceFile="$1"

      sed -i '/'${prop}'/d' $sourceFile

    }
 

    #1 - source template file with path

    #2 - keys to be updated with "," separated

    #3 - values to be updated with "," separated

    main "$1" "$2" "$3"