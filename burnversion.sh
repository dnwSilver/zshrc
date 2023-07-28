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

### NODEJS
function get_version_typescript() {
    echo $(jq -r .version package.json)
}

function set_version_typescript() {
    PACKAGE_VERSION=$(get_version_typescript)
    NEW_VERSION=$(up_version $PACKAGE_VERSION $1)
    echo $(jq --arg v "$NEW_VERSION" '.version=$v' package.json) > package.json
    npx prettier package.json --write --loglevel=silent
    echo "🐝 Current version $PACKAGE_VERSION up to $NEW_VERSION."
}

### DOTNET
function get_project_dotnet() {
    echo $(yq '[ .variables.MAIN_PROJECT_PATH]' .gitlab-ci.yml)/$(yq -r '[ .variables.MAIN_PROJECT_NAME]' .gitlab-ci.yml) | sed -e s/\"//g -e s/-//g -e "s/ //g"
}

function get_version_dotnet() {
    PROJECT=$(get_project_dotnet)
    echo $(awk -F '[<>]' '/PackageVersion/{print $3}' $PROJECT)
}

function set_version_dotnet() {
    PROJECT=$(get_project_dotnet)
    OLD_VERSION=$(get_version_dotnet)    
    NEW_VERSION=$(up_version $OLD_VERSION $1)
    xmlstarlet edit --inplace --update "/Project/PropertyGroup/PackageVersion" --value "$NEW_VERSION" $PROJECT
    xmlstarlet edit --inplace --update "/Project/PropertyGroup/AssemblyVersion" --value "$NEW_VERSION" $PROJECT
    echo " 🐝 Current version $OLD_VERSION up to $NEW_VERSION."
}

