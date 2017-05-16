#!/usr/bin/env bash
driver_versions=();
python_versions=();

IFS=$'\n'
driver_versions=(`cat $1`)
python_versions=(`cat $2`)

for driver_version in "${driver_versions[@]}"
do
    for python_version_aliases in "${python_versions[@]}"
    do
        python_version_aliases=(${python_version_aliases})
        tags_command_string=()
        for python_version in "${python_version_aliases[@]}"
        do
            tags_command_string+=(-t "intezer/python-cassandra-driver:$python_version-$driver_version")
            if [[ ${driver_versions[0]} == ${driver_version} ]]; then
                tags_command_string+=(-t "intezer/python-cassandra-driver:$python_version")
            fi
        done
        docker build --pull --build-arg python_version=${python_version_aliases[0]} --build-arg driver_version="$driver_version" "${tags_command_string[@]}" .
        for i in "${!tags_command_string[@]}"
        do
            if [[ $i%2==0 ]]; then
                docker push ${tags_command_string[i]}
            fi
        done
    done
done