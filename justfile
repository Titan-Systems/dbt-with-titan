# List all available commands
default:
    @just --list

# Run dbt models
dbt-run:
    cd dbt_titan && dbt run

# Generate docs
dbt-docs:
    dbt docs generate
    dbt docs serve

# Run tests
dbt-test:
    cd dbt_titan && dbt test

# Clean project
clean:
    rm -rf target/
    rm -rf dbt_packages/

titan-plan *FLAGS:
    #!/usr/bin/env sh
    if [ "{{FLAGS}}" = "--admin" ]; then
        env $(cat ".env.admin" | xargs) titan plan --config titan/admin.yml
    else
        env $(cat ".env" | xargs) titan plan --config titan/config.yml
    fi

titan-apply *FLAGS:
    #!/usr/bin/env sh
    if [ "{{FLAGS}}" = "--admin" ]; then
        env $(cat ".env.admin" | xargs) titan apply --config titan/admin.yml
    else
        env $(cat ".env" | xargs) titan apply --config titan/config.yml
    fi
