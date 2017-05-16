#!/usr/bin/env bash
driver_versions=();
python_versions=();

IFS=$'\n'
driver_versions=(`cat $1`)
python_versions=(`cat $2`)
IFS=$' \t\n'

for driver_version in "${driver_versions[@]}"
do
    for python_version_aliases in "${python_versions[@]}"
    do
        python_version_aliases=(${python_version_aliases})
        tags_args=()
        for python_version in "${python_version_aliases[@]}"
        do
            if [[ ${python_version} != latest ]]; then
                tags_args+=(-t "intezer/python-cassandra-driver:$python_version-$driver_version")
            fi
            if [[ ${driver_versions[0]} == ${driver_version} ]]; then
                tags_args+=(-t "intezer/python-cassandra-driver:$python_version")
            fi
        done
        docker build --pull --build-arg python_version="${python_version}" --build-arg driver_version="$driver_version" "${tags_args[@]}" .
        for i in "${!tags_args[@]}"
        do
            if [[ $((i%2)) -eq 1 ]]; then
                docker push ${tags_args[i]}
            fi
        done
    done
done