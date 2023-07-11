#!/bin/bash
## Need to install: xmlstarlet, jq.

function up_version() {
    OLD_VERSION=$1
    UP_TYPE=$2
    MAJOR=$(cut -d '.' -f 1 <<< $OLD_VERSION)
    MINOR=$(cut -d '.' -f 2 <<< $OLD_VERSION)
    PATCH=$(cut -d '.' -f 3 <<< $OLD_VERSION)
    if [[ "$UP_TYPE" = "major" ]]
    then
        MAJOR=$(($MAJOR+1))
        MINOR=0
        PATCH=0
    elif [[ "$UP_TYPE" = "minor" ]]
    then
        MINOR=$(($MINOR+1))
        PATCH=0
    else
        PATCH=$(($PATCH+1))
    fi
    echo $MAJOR.$MINOR.$PATCH
}

function set_version_typrescript() {
    PACKAGE_VERSION=$(jq -r .version package.json)
    NEW_VERSION=$(up_version $PACKAGE_VERSION $1)
    echo $(jq --arg v "$NEW_VERSION" '.version=$v' package.json) > package.json
    npx prettier package.json --write --loglevel=silent
    echo "Project $PWD have version $PACKAGE_VERSION. Version 🆙 to $NEW_VERSION"
}


function set_version_dotnet() {
    PROJECT=$(echo $(yq '[ .variables.MAIN_PROJECT_PATH]' .gitlab-ci.yml)/$(yq -r '[ .variables.MAIN_PROJECT_NAME]' .gitlab-ci.yml) | sed -e s/\"//g -e s/-//g -e "s/ //g")
    OLD_VERSION=$(awk -F '[<>]' '/PackageVersion/{print $3}' $PROJECT)
    echo $1
    NEW_VERSION=$(up_version $OLD_VERSION $1)
    xmlstarlet edit --inplace --update "/Project/PropertyGroup/PackageVersion" --value "$NEW_VERSION" $PROJECT
    xmlstarlet edit --inplace --update "/Project/PropertyGroup/AssemblyVersion" --value "$NEW_VERSION" $PROJECT
    echo "Project $PROJECT have version $OLD_VERSION. Version 🆙 to $NEW_VERSION"
}
