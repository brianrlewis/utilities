table=$1
col=$2
foreignTable="${3:-my_table}"
foreignCol="${4:-id}"

foreignKeyName="${1}_${2}_foreign"
indexName="${foreignKeyName}_idx"

echo  "
ALTER TABLE \`$table\`
ADD INDEX \`$indexName\` (\`$col\` ASC);
;
ALTER TABLE \`$table\`
ADD CONSTRAINT \`$foreignKeyName\`
FOREIGN KEY (\`$col\`)
REFERENCES \`$foreignTable\` (\`$foreignCol\`)
ON DELETE CASCADE
ON UPDATE NO ACTION;
"