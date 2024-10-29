# List all available commands
default:
    @just --list

# Run dbt models
dbt-run:
    dbt run --profiles-dir profiles

# Generate docs
dbt-docs:
    dbt docs generate
    dbt docs serve

# Run tests
dbt-test:
    dbt test

# Clean project
clean:
    rm -rf target/
    rm -rf dbt_packages/

titan-plan:
    env $(cat ".env" | xargs) titan plan --config titan/config.yml

titan-apply:
    env $(cat ".env" | xargs) titan apply --config titan/config.yml
